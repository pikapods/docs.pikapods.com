---
title: Immich
layout: page
parent: App Notes
---
# Immich

Immich is a high-performance, self-hosted photo and video backup solution with mobile apps and a web UI. Running [Immich on PikaPods](https://www.pikapods.com/apps/immich)? These notes cover a few things worth knowing. Refer to the [official Immich docs](https://immich.app/docs) for complete documentation.

## Using external libraries

You can add an existing photo collection using the [External Libraries feature](https://github.com/imagegenius/docker-immich?tab=readme-ov-file#add-existing-libraries). The `/libraries` folder is already available in your pod for this purpose - simply connect via [SFTP](/manage/files) to upload your photos there. Then add the same path as library path in Immich (e.g. `/libraries/personal-library`).

It can take some time for all photos to be processed, if the library is large. You can see pending import tasks in _Administration > Jobs_.
