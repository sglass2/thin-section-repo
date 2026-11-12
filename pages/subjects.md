---
title: Subjects
layout: page
permalink: /subjects.html
# Default subject page is configured in "_data/theme.yml"
# leave cloud-fields as "site.data.theme.subjects-fields"
# a cloud visualization will be added below the content in this file
cloud-fields: site.data.theme.subjects-fields
---

## Browse Subjects

Browse the collection by location, parent material, soil horizon, and micromorphological features!

---
 
## Location
 
{% assign fields = "location" %}
{% assign min = 1 %}
<div id="cloud-div-location" class="text-center my-4 bg-white border rounded p-2"></div>
{% include js/cloud-js.html id="cloud-div-location" fields=fields min=min %}

---
 
## Parent Material
 
{% assign fields = "parentmaterial" %}
{% assign min = 1 %}
<div id="cloud-div-parentmaterial" class="text-center my-4 bg-white border rounded p-2"></div>
{% include js/cloud-js.html id="cloud-div-parentmaterial" fields=fields min=min %}

---

## Horizon
 
{% assign fields = "horizon" %}
{% assign min = 1 %}
<div id="cloud-div-horizon" class="text-center my-4 bg-white border rounded p-2"></div>
{% include js/cloud-js.html id="cloud-div-horizon" fields=fields min=min %}

---

## Microstructure
 
{% assign fields = "microstructure;intrapedal_structure" %}
{% assign min = 1 %}
<div id="cloud-div-microstructure" class="text-center my-4 bg-white border rounded p-2"></div>
{% include js/cloud-js.html id="cloud-div-microstructure" fields=fields min=min %}
---

## Related Distribution Pattern
 
{% assign fields = "related_distribution_pattern" %}
{% assign min = 1 %}
<div id="cloud-div-related_distribution_pattern" class="text-center my-4 bg-white border rounded p-2"></div>
{% include js/cloud-js.html id="cloud-div-related_distribution_pattern" fields=fields min=min %}

---

## b-Fabric
 
{% assign fields = "b-fabric" %}
{% assign min = 1 %}
<div id="cloud-div-b-fabric" class="text-center my-4 bg-white border rounded p-2"></div>
{% include js/cloud-js.html id="cloud-div-b-fabric" fields=fields min=min %}

---

## Pedofeatures
 
{% assign fields = "pedofeatures" %}
{% assign min = 1 %}
<div id="cloud-div-pedofeatures" class="text-center my-4 bg-white border rounded p-2"></div>
{% include js/cloud-js.html id="cloud-div-pedofeatures" fields=fields min=min %}

