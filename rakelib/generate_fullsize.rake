###############################################################################
# TASK: generate_fullsize
#
# create fullsize web-optimized images from large source files in the 'objects' folder
###############################################################################

require 'image_optim' unless Gem.win_platform?
require 'mini_magick'

def process_fullsize_image(filename, file_type, output_filename, size, density)
  image_optim = ImageOptim.new(svgo: false) unless Gem.win_platform?
  puts "Creating: #{output_filename}"
  begin
    if file_type == :pdf
      inputfile = "#{filename}[0]"
      magick = MiniMagick.convert
      magick.density(density)
      magick << inputfile
      magick.resize(size)
      magick.flatten
      magick << output_filename
      magick.call
    else
      magick = MiniMagick.convert
      magick << filename
      magick.resize(size)
      magick.flatten
      magick << output_filename
      magick.call
    end
    image_optim.optimize_image!(output_filename) unless Gem.win_platform?
  rescue StandardError => e
    puts "Error creating #{filename}: #{e.message}"
  end
end


desc 'Generate fullsize web-optimized image files from large collection objects'
task :generate_fullsize, [:fullsize_size, :density, :missing, :input_dir] do |_t, args|
  # set default arguments
  # default fullsize size balances web quality with file size reduction
  # 3000px on longest dimension reduces ~13,000px originals to ~23% of original dimensions
  args.with_defaults(
    fullsize_size: '3000x3000',
    density: '300',
    missing: 'true',
    input_dir: 'objects'
  )

  # set the folder locations
  objects_dir = args.input_dir
  fullsize_image_dir = objects_dir + '/full'

  # Ensure that the output directories exist.
  [objects_dir, fullsize_image_dir].each do |dir|
    FileUtils.mkdir_p(dir) unless Dir.exist?(dir)
  end

  # support these file types
  EXTNAME_TYPE_MAP = {
    '.jpeg' => :image,
    '.jpg' => :image,
    '.pdf' => :pdf,
    '.png' => :image,
    '.tif' => :image,
    '.tiff' => :image
  }.freeze

  # CSV output
  list_name = File.join(objects_dir, 'fullsize_list.csv')
  field_names = 'filename,source_location,fullsize_image'.split(',')
  CSV.open(list_name, 'w') do |csv|
    csv << field_names

    # Iterate over all files in the objects directory.
    Dir.glob(File.join(objects_dir, '*')).each do |filename|
      # Skip subdirectories and the README.md file.
      if File.directory?(filename) || File.basename(filename) == 'README.md' || File.basename(filename) == 'object_list.csv' || File.basename(filename) == 'fullsize_list.csv'
        next
      end

      # Determine the file type and skip if unsupported.
      extname = File.extname(filename).downcase
      file_type = EXTNAME_TYPE_MAP[extname]
      unless file_type
        puts "Skipping file with unsupported extension: #{filename}"
        csv << ["#{File.basename(filename)}", "/#{filename}", nil]
        next
      end

      # Get the lowercase filename without any leading path and extension.
      base_filename = File.basename(filename, '.*').downcase

      # Generate the fullsize image.
      fullsize_filename = File.join(fullsize_image_dir, "#{base_filename}_fs.jpg")
      if args.missing == 'false' || !File.exist?(fullsize_filename)
        process_fullsize_image(filename, file_type, fullsize_filename, args.fullsize_size, args.density)
      else
        puts "Skipping: #{fullsize_filename} already exists"
      end
      csv << ["#{File.basename(filename)}", "/#{filename}", "/#{fullsize_filename}"]
    end
  end
  puts "\e[32mSee '#{list_name}' for list of objects and fullsize derivatives created.\e[0m"
end
