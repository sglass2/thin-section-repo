---
title: Subjects
layout: cloud
permalink: /subjects.html
# Default subject page is configured in "_data/theme.yml"
# leave cloud-fields as "site.data.theme.subjects-fields"
# a cloud visualization will be added below the content in this file
cloud-fields: site.data.theme.subjects-fields
---

## Browse Subjects

Use this word cloud visualization to browse terms and subjects.
Word size is determined by frequency and all words link to a corresponding collection search.

---
 
## Browse by Location
 
{% assign fields = "location" %}
{% assign min = 1 %}
<div id="cloud-div-location" class="text-center my-4 bg-white border rounded p-2"></div>
{% include js/cloud-js.html id="cloud-div-location" fields=fields min=min %}
 