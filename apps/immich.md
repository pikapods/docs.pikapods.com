---
title: Immich
layout: page
parent: App Notes
---

## Using external libraries

You can add an existing photo collection using the [External Libraries feature](https://immich.app/docs/features/libraries#external-libraries). To do so, add a new folder via our SFTP feature under `/photos` and then add the same path as library path for that external library. E.g. `/photos/personal-library`.

Also be sure to set the user's external path as mentioned [here](https://immich.app/docs/features/libraries#security-considerations). Otherwise all library paths will be ignored. For single user installations, this can be set to `/photos`.

It can take some time for all photos to be processed, if the library is large. You can see pending import tasks in *Administration > Jobs*.