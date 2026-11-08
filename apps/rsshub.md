---
title: RSSHub
layout: page
parent: App Notes
---
# RSSHub

RSSHub is an open-source tool that generates RSS feeds for websites that don’t offer them. Running [RSSHub on PikaPods](https://www.pikapods.com/apps/rsshub)? These notes cover a few things worth knowing. Full documentation is in the [official RSSHub docs](https://docs.rsshub.app/).

## Adding additional Configuration
Only the most important configuration settings are exposed as environment variables. To add additional configuration, connect via [SFTP](/manage/files) and edit the `.env` file already in the folder. Some SFTP client may not show hidden files (dotfiles) by default.

See [here](https://github.com/DIYgod/RSSHub/tree/master/website/docs/install#configuration-3) for available configuration.

You have to *Restart* the pod to apply configuration changes.

