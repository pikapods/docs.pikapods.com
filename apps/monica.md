---
title: Monica
layout: page
parent: App Notes
---
Monica is a personal CRM for keeping track of the people in your life, from contacts to conversations and reminders. Here are a few tips and fixes for [Monica](https://www.pikapods.com/apps/monica) pods hosted on PikaPods. Refer to the [official Monica docs](https://docs.monicahq.com/) for complete documentation.

## Sending emails
Configure an email service by setting the available environment variables in your pod's settings, as described in the [official docs](https://github.com/monicahq/docker/blob/main/.examples/maxsize/.env#L23) and our [email section](/faq/technical#sending-emails).

After applying new env vars, your pod will be restarted. After it's back online, you can test the email service by e.g. inviting a new user. If there is an issue (like a wrong password), you should see a summary of the error.


## Sending reminders
All pods are set up to send pending reminders every 2 hours. This needs a working email configuration (see above).
