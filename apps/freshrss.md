---
title: FreshRSS
layout: page
parent: App Notes
---
# FreshRSS

FreshRSS is a self-hosted RSS and Atom feed aggregator that is lightweight, fast, and easy to customize. Running [FreshRSS on PikaPods](https://www.pikapods.com/apps/freshrss)? These notes cover a few things worth knowing. Anything else is covered in the [official FreshRSS docs](https://freshrss.github.io/FreshRSS/).

## Automatically refresh feeds
Containers are set up to refresh feeds twice an hour, at 7 and 37 minutes past the hour.

## Change domain
This app saves the domain name during setup. If you decide to change it later, please also edit the option `base_url` in `data/config.php` using SFTP.

## Extensions
You can find the `extensions` folder via [SFTP](/manage/files). To add an extension just extract it locally and then upload it to this folder. For more details and a list of extensions see the [official FreshRSS extension repository](https://github.com/FreshRSS/Extensions?tab=readme-ov-file#freshrss-extensions)
