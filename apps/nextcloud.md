---
title: Nextcloud
layout: page
parent: Apps
---

## Updates
You may see a notification to update in Nextcloud's admin section. Since updates are centrally managed, this feature is disabled. Your pod will automatically receive updates within 1-2 weeks of their release. We also run any required migration scripts for you. 😇


## Warnings regarding `.well-known` paths
You may see warning regarding `.well-known` paths to CalDAV and CardDAV services in the *Security & setup warnings* section. Those are false positives and those paths will work as expected.


## Adjust PHP Settings
The default maximum upload size is set to 512 MB. You can increase this or adjust other PHP settings by editing the `uploads.ini` file using [SFTP](/faq/#accessing-pod-files-using-sftp). If you increase this value, you may also need to increase the pod's memory allocation. Settings in this file are applied after restarting the pod or changing its resources. See [here](https://www.php.net/manual/en/ini.core.php) for a detailed description of available settings.


## Maintenance Mode
You can enable or disable maintenance mode in the configs, accessible over [SFTP](/faq/#accessing-pod-files-using-sftp). Find the file `config/config.php` and look for a line containing `'maintenance' => false,`. Then change to `true` or `false` as needed.

In rare cases an installation can stay in maintenance mode after an update.
