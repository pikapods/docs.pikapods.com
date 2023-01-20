---
title: Etherpad
layout: page
parent: Apps
---

## Manage Users/Authentication

By default, anyone can add new pads, but can't list and find existing pads. If you need authentication for your Etherpad, set the env var `REQUIRE_AUTHENTICATION` to `true` and add a password for the user with username `user`. This will make the Etherpad instance private and only you can use it and add new pads.

The official Docker image we use has no real way of managing users. Editing the config isn't an option because the image is configured with env vars and ships with a standard config file.


## Installing Plugins

We found plugins to be extremely slow and buggy, with some breaking a pod. So the `admin` user is currently disabled in our setup.
