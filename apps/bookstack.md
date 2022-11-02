---
title: Bookstack
layout: page
parent: Apps
---

## Sending emails
Bookstack doesn't always require emails, but uses it for select features, like forgotten passwords. To enable sending email, add your SMTP details to `/config/www/.env` using [SFTP](/faq/#accessing-pod-files-using-sftp). This path already contains a pre-populated settings file. Available options can be found [here](https://www.bookstackapp.com/docs/admin/email-webhooks/). If you can't see the file, please make sure your FTP client shows hidden files, also known as dotfiles.