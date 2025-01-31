---
title: MediaWiki
layout: page
parent: App Notes
---

## Adjust Settings

Some settings can only be changed in a file called `LocalSettings.php`. You can edit this file for your pod using [SFTP](/manage/files). This file is already populated with some common settings, like database settings. You shouldn't change those, but you can change most other settings. See [here](https://www.mediawiki.org/wiki/Manual:LocalSettings.php#Standard_settings) for a full reference.

## Extensions and Skins Limitations

Due to the way the official MediaWiki Docker image is structured, installing additional extensions or skins through SFTP is not supported. The image only includes pre-installed extensions and skins, and does not provide access to the `extensions` or `skins` directories.

While you can configure existing extensions through `LocalSettings.php`, adding new extensions or custom skins is currently not possible. This is a limitation of using the containerized version of MediaWiki.
