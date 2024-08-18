---
title: FreshRSS
layout: page
parent: App Notes
---

## Automatically refresh feeds
Containers are set up to refresh feeds twice an hour, at 7 and 37 minutes past the hour.

## Change domain
This app saves the domain name during setup. If you decide to change it later, please also edit the option `base_url` in `data/config.php` using SFTP.

## Extensions
You can find the `extensions` folder via [SFTP](/manage/files). To add an extension just extract it locally and then upload it to this folder. For more details and a list of extensions see the [official FreshRSS extension repository](https://github.com/FreshRSS/Extensions?tab=readme-ov-file#freshrss-extensions)