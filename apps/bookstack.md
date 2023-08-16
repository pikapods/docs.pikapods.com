---
title: Bookstack
layout: page
parent: App Notes
---

## Edit advanced settings
Many Bookstack settings are configured via its `.env` file. To edit this file, find it in `/config/www/.env` using [SFTP](/faq/#accessing-pod-files-using-sftp). This path already contains a pre-populated settings file. If you can't see the file, please make sure your FTP client shows hidden files, also known as dotfiles.

## Sending emails
Bookstack doesn't always require emails, but uses it for select features, like forgotten passwords. Available options can be found [here](https://www.bookstackapp.com/docs/admin/email-webhooks/) and you can add them to the `.env` file, as described above.

## Failures when uploading images
If you see errors when uploading images, check the pod's Nginx logs for memory errors. They can be found in `config/log/nginx/error.log` after enabling [SFTP](/faq/#accessing-pod-files-using-sftp). If you see something like `PHP Fatal error:  Allowed memory size of 134217728 bytes exhausted`, it can help to increase the pod's internal memory limit, which is separate from the pod's limit.

To do so enable [SFTP](/faq/#accessing-pod-files-using-sftp) and add this line at the end of `config/php/php-local.ini`:

```
memory_limit = 512M
```

Then restart the pod to apply the new setting.