---
title: Monica
layout: page
parent: App Notes
---

## Sending emails
Configure an email service by setting the available environement variables in your pod's settings, as described in the [official docs](https://github.com/monicahq/docker/blob/main/.examples/maxsize/.env#L23) and our [email section](/faq/#sending-emails).

After applying new env vars, your pod will be restarted. After it's back online, you can test the email service by e.g. inviting a new user. If there is an issue (like wrong password), you shold see a summary of the error.