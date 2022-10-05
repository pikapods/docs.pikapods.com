---
title: WordPress
layout: page
parent: Apps
---

## Change Domain
When changing the domain, some references to the old domain may not get updated in the app's database. Solution is to use a [search and replace plugin](https://wordpress.org/plugins/better-search-replace/) to properly update those references. Otherwise images and files may keep referencing the old domain. Also be sure to add the right domain in the `wp_options` table, options `home` and `siteurl`. Adminer (below) or a similar tool can be used to edit the database.

## Import, export or edit Database
You can use a tool like [Adminer](https://wordpress.org/plugins/pexlechris-adminer/) to import or export the whole database.

## Adjust PHP Settings
The default upload limit is set to 64 MB. You can increase this or adjust other PHP settings by editing the `uploads.ini` file using [SFTP](/faq/#accessing-pod-files-using-sftp).