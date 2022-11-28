---
title: PhotoPrism
layout: page
parent: Apps
---

## Connect to WebDAV Storage (e.g. Nextcloud)

It's possible to import pictures from a remote WebDAV location, which e.g. Nextcloud (also available on PikaPods) can provide. Here the steps:

1. Add PhotoPrism pod (make sure to config name and password)
2. Log in as admin with "admin" and password that you just generated
3. Click on the user profile avatar in the bottom left
4. Navigate to the "services" tab and click "connect"
5. Create new tab and log into your previously set up Nextcloud page
6. Click on user profile in top right 
7. Navigate to security tab
8. At bottom type "photoprism" into "app name" and click "create app password" (save these for later)
9. Navigate to files tab in Nextcloud
10. In bottom left click on "Files settings"
11. Copy WebDAV address
12. Head back to photoprism tab and paste in WebDAV URL, user, and password
13. Enable Directory sync by clicking the little sync button on the remote. Chose appropriate folder and interval
14. Give the server a couple hours to copy and index all files.
