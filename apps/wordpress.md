---
title: WordPress
layout: page
parent: Apps
---

# Known Issues

## Change Domain
When changing the domain, some references to the old domain may not get updated in the app's database. Solution is to use a [search and replace plugin](https://wordpress.org/plugins/better-search-replace/) to properly update those references. Otherwise images and files may keep referencing the old domain.

## Import and Export Database
You can use a tool like [Adminer](https://wordpress.org/plugins/pexlechris-adminer/) to import or export the whole database.