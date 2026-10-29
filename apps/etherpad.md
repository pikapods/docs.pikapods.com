---
title: Etherpad
layout: page
parent: App Notes
---

## Manage Users/Authentication

When adding a new Etherpad pod, you need to set an admin password using the env var `ADMIN_PASSWORD`. This allows you to access the path `/admin` to manage the Etherpad pod. You can then add more users in `/admin/settings` by editing the `users` section of the JSON file.

By default, anyone can add new pads, but can't list and find existing pads. If you need authentication for your Etherpad, set the env var `REQUIRE_AUTHENTICATION` to `true` and add a password for the user with username `user`. This will make the Etherpad instance private and only you can use it and add new pads.

The official Docker image we use has no real way of managing users. Editing the config isn't an option because the image is configured with env vars and ships with a standard config file.

## Env Vars and the Settings File

Etherpad's settings page (`/admin/settings`), which edits `settings.json`, and env vars overlap. If an env var is set for a section of the settings, it replaces that whole section of the settings file. The two are not merged, so any values you set in the file for that section are ignored.

## Installing Plugins

You can install plugins by visiting the admin interface under `/admin/plugins`.

## Storing Images on S3

With the `ep_images_extended` plugin, you can store uploaded images in an S3-compatible bucket (Amazon S3, Backblaze B2, Cloudflare R2, etc.). The configuration comes from two places: the AWS S3 library (the `AWS_*` vars) and the plugin itself (the `EP__*` vars). You need to set all of the following:

| Env var | Description | Example |
|---|---|---|
| `AWS_ENDPOINT_URL_S3` | The S3 API endpoint of your storage provider. Leave empty for Amazon S3. | `https://s3.eu-central-003.backblazeb2.com` |
| `AWS_ACCESS_KEY_ID` | The access key ID used to upload images to your bucket. | `003a1b2c3d4e5f60000000001` |
| `AWS_SECRET_ACCESS_KEY` | The secret key that goes with the access key ID. | `K003xYz...` |
| `EP__ep_images_extended__storage__bucket` | The name of the bucket where images are stored. | `etherpad-images` |
| `EP__ep_images_extended__storage__region` | The region of your bucket. Cloudflare R2 uses `auto`. | `eu-central-003` |
| `EP__ep_images_extended__storage__publicURL` | The base URL that pads use to load images from your bucket. It must end with a slash. | `https://etherpad-images.s3.eu-central-003.backblazeb2.com/` |