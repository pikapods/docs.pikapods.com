---
title: Etherpad
layout: page
parent: App Notes
---

## Manage Users/Authentication

When adding a new Etherpad pod, you need to set an admin password using the env var `ADMIN_PASSWORD`. This allows you to access the path `/admin` to manage the Etherpad pod. You can then add more users in `/admin/settings` by editing the `users` section of the JSON file.

By default, anyone can add new pads, but can't list and find existing pads. If you need authentication for your Etherpad, set the env var `REQUIRE_AUTHENTICATION` to `true` and add a password for the user with username `user`. This will make the Etherpad instance private and only you can use it and add new pads.

The official Docker image we use has no real way of managing users. Editing the config isn't an option because the image is configured with env vars and ships with a standard config file.


## Installing Plugins

You can install plugins by visiting the admin interface under `/admin/plugins`.