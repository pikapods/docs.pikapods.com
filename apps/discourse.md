---
title: Discourse
layout: page
parent: App Notes
---

## Installing Extensions

You can enable, disable and manage extension settings in the admin interface under _Admin > Plugins_.

To install new plugins:

1. Get the plugin source code from the plugin's GitHub repository. Either by cloning it or downloading the code as a zip via _Code > Download ZIP_.
2. Upload the plugin folder via [SFTP](/manage/files) into `/plugins`.
3. Restart the pod. This will detect the plugin and compile related web assets.
4. Now the new plugin should show up in _Admin > Plugins_. (Restarting Discourse can take a few minutes.)

## Email Configuration

To set up email for your Discourse pod:

1. Configure SMTP-related fields (`SMTP_*`) in your pod settings by going to the [PikaPods dashboard](https://www.pikapods.com/pods), clicking the settings icon (gear icon) at the bottom left of your pod's card, and navigating to the "ENV VARS" section in pod settings.

2. After configuring SMTP, you must also update the email settings in the Discourse admin panel:
   - Go to _Admin > Site Settings_
   - Search for "notification email" to find the setting
   - Update this setting to match your sending domain
   - This setting controls the domain used in the "From" address for outgoing emails

If you encounter relay errors like "Relay not permitted" or "You can only send using [yourdomain.com]", make sure both your SMTP settings and the notification email address in Discourse settings match your authorized sending domain.
