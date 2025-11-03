---
title: Mattermost
layout: page
parent: App Notes
---

## Initial Setup

The `MM_TEAMSETTINGS_ENABLEOPENSERVER` environment variable determines if users can register on your Mattermost pod. You should set it to `true` until registering the first admin user.

After the pod is created, open it via _Open Pod_ and follow those steps to create an admin user and team:

1. Choose _View in browser_ to skip downloading an app
2. Then _Don't have an account?_ to add the initial admin account
3. Choose an email, username and password
4. Then create a team

That's it! You should now be in your team's workspace. You can then go to the _System Console_ or add more teams via the menus in the top-left.

**Also be sure to disable open registrations, if appropriate, by setting the `MM_TEAMSETTINGS_ENABLEOPENSERVER` env var to `false` in your _PikaPods_ control panel.**

## Sending emails

Mattermost doesn't always require emails, but uses it for select features, like forgotten passwords. To enable sending email, add your SMTP details as described [here](https://docs.mattermost.com/configure/smtp-email.html). You can use your existing email service or a service recommended in our [email section](/faq/#sending-emails).

## Using Custom Plugins

To enable integrations in Mattermost with custom plugins, follow these steps:

1. Use SFTP to access your server. (Refer to [this page](/manage/files) for accessing pod files using SFTP.)
2. Locate the `config.json` file inside the `config` folder.
3. Manually set `PluginSettings > EnableUploads` to `true` in the `config.json` file. By default, this setting is `false`.
4. Save the changes and restart your Mattermost server.

Enabling this configuration change allows you to upload custom plugins, expanding Mattermost's functionality with external resources.

## Troubleshooting

### Server fails to start after update: archived channels error

After updating to newer Mattermost versions (e.g., 11.0.1), some pods may fail to start with an error similar to:

```
failed to load configuration: failed to create store: unable to load on store creation: invalid config: Config.IsValid: Hiding archived channels is no longer supported. Make these channels private and remove members instead.
```

To fix this, set `ExperimentalViewArchivedChannels` to `true` in your `config.json`.

Steps:

1. Access your pod files via SFTP. (Refer to [this page](/manage/files) for accessing pod files using SFTP.)
2. Open `config/config.json`.
3. In the `TeamSettings` section, ensure `ExperimentalViewArchivedChannels` is set to `true`. If it's missing, add it:
   ```json
   "TeamSettings": {
       ...
       "ExperimentalViewArchivedChannels": true,
       ...
   }
   ```
4. Save the file and restart the pod.

Reference: [Mattermost issue #34084](https://github.com/mattermost/mattermost/issues/34084).
