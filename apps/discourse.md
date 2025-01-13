---
title: Discourse
layout: page
parent: App Notes
---

## Installing Extensions

You can enable, disable and manage extension settings in the admin interface under *Admin > Plugins*.

To install new plugins:

1. Get the plugin source code from the plugin's Github repository. Either by cloning it or downloading the code as zip via *Code > Download ZIP*.
2. Upload the plugin folder via [SFTP](/manage/files). The plugin folder should be in `data/plugins`.
3. Restart the pod. This will detect the plugin and compile related web assets.
4. Now the new plugin should show up in *Admin > Plugins*. (Restarting Discourd can take a few minutes.)