---
title: WordPress
layout: page
parent: App Notes
---

## Change Domain

If you plan on using a custom domain or restoring an existing site, it's best to set the custom domain _before_ completing the WordPress installation assistant.

If you need to change the domain after installation, follow those steps:

1. First change the domain in the `wp_options` table, options `home` and `siteurl` using the pod's [database access](/manage/database) feature.
2. Update the domain in your _PikaPods_ control panel.
3. Finally, some resources, like images may still point to the old domain on pages or posts. Solution is to use a [search and replace plugin](https://wordpress.org/plugins/better-search-replace/) to properly update those references. Otherwise images and files may keep referencing the old domain.

## Adjust PHP Settings

The default upload limit is set to 64 MB. You can increase this or adjust other PHP settings by editing the `uploads.ini` file using [SFTP](/faq/#accessing-pod-files-using-sftp). This file is already populated with some common settings, like upload limits or memory limits.

## Adjust WordPress Settings

You can use the `WORDPRESS_CONFIG_EXTRA` env var in the *PikaPods* Control panel to pass additional settings to `wp-config.php`. E.g. to change the memory limit enter `define('WP_MEMORY_LIMIT', '256M');`. **Note that this setting can potentially break your site.** So if your pod fails to start or shows errors in the logs, try adjusting this setting first.

## Reset Password

You can reset your password using the database. Steps are like this:

1. Enable the pod's [database access](/manage/database) feature
2. Follow the [official WordPress docs](https://wordpress.org/documentation/article/reset-your-password/#through-phpmyadmin) to do the actual reset. Look for the `wp_users` table and then change the `user_pass` field of the user.

## Debugging

For troubleshooting, WordPress debug mode offers detailed error messages. To activate:

1. In **My Pods**, go to Pod `Settings > ENV VARS`.
2. Update the `WORDPRESS_DEBUG` environment variable, setting it to `1`.
3. Save your settings to apply the changes.

Be sure to disable debugging after troubleshooting by setting the `WORDPRESS_DEBUG` variable to `0` or removing it altogether to prevent the display of errors to site visitors.
