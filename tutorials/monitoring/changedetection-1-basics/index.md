---
title: Changedetection Basics
description: Learn the basic features of Changedetection, including monitoring websites and receiving notifications.
layout: page
parent: Monitoring
grand_parent: Tutorials
---

# Getting Started

Changedetection is an open-source app that lets you monitor website changes. You can automate the entire process. From simply monitoring website pages that have a change (such as watching prices, restock notification), to deep inspection such as PDF text support, JSON and XML monitoring and extensive text triggers. Here is our step-by-step guide on how you can set up website monitoring.

_[Watch the video tutorial](https://www.youtube.com/watch?v=gszKMag4cUc) for a visual demonstration._

For more comprehensive details, refer to the [official tutorials](https://changedetection.io/tutorials).

# How to add and monitor a website?

<video controls loop muted preload="none" src="1-add-monitor-website.mp4" poster="1-add-monitor-website.webp">
</video>

You can monitor any website for changes. You can track changes for the entire website, or track only one page. You can also monitor for out of stock items. Here are the steps to adding website that you want to track:

1. **Copy the URL** that you want to monitor for changes.
2. **Paste the URL** in the empty field.
3. **Add the tag** or label.
4. Click on **Watch**.
5. Click on **Recheck** to force the website check.
6. Click on **Diff** to see website changes.

# How to edit monitoring settings?

<video controls loop muted preload="none" src="2-edit-settings.mp4" poster="2-edit-settings.webp">
</video>

You can adjust monitoring settings for each website that you are tracking. You can edit how often you want to check for changes, where you want to receive notifications, and more. Here are the steps:

1. Click **Edit** next to the website URL.
2. Under **General**, you can edit the URL, title, group tag, and adjust the time between checks.
3. Under **Notifications**, you can set up where you want to receive notifications (Discord, Telegram, Email).
4. Click **Save** to save your preferences.

# How to set notifications in Discord?

<video controls loop muted preload="none" src="3-add-discord-notifications.mp4" poster="3-add-discord-notifications.webp">
</video>

Changedetection lets you receive website changes notifications in Discord. You can receive notifications for all websites that you are tracking. Here are the steps:

1. Open your Discord account and create a new server (your personal server).
2. Right-click on your server and select **Server Settings** > **Integrations**.
3. Click **View Webhooks** and then **New Webhook**.
4. Rename the webhook and pick a channel in your server where you want to receive notifications.
5. Copy the webhook URL.
6. Go back to the Changedetection app and click **Settings** in the upper menu.
7. Under **Notifications**, paste the webhook URL and edit the URL. Start with `discord://`.
8. Click **Send Test Notification** to check if your connection is working.
9. Click **Save** at the bottom of your screen.
10. Check your Discord for notifications.
