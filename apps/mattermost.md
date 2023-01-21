---
title: Mattermost
layout: page
parent: Apps
---

## Initial Setup

The `MM_TEAMSETTINGS_ENABLEOPENSERVER` environment variable determines if users can register on your Mattermost pod. You should set it to `true` until registering the first admin user.

After the pod is created, open it via *Open Pod* and follow those steps to create an admin user and team:

1. Choose *View in browser* to skip downloading an app
2. Then *Don't have an account?* to add the initial admin account
3. Choose an email, username and password
4. Then create a team

That's it! You should now be in your team's workspace. You can then go to the *System Console* or add more teams via the menus in the top-left.

**Also be sure to disable open registrations, if appropriate, by setting the `MM_TEAMSETTINGS_ENABLEOPENSERVER` env var to `false` in your *PikaPods* control panel.**


## Sending emails

Mattermost doesn't always require emails, but uses it for select features, like forgotten passwords. To enable sending email, add your SMTP details as described [here](https://docs.mattermost.com/configure/smtp-email.html). You can use your existing email service or a service recommended in our [email section](/faq/#sending-emails).