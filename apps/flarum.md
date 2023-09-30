---
title: Flarum
layout: page
parent: App Notes
---

## Send email with SMTP

First login to the Flarum forum as an administrator and then follow these steps:

1. Go to **Administration > Email**.
2. Under **Choose a Driver**, select **SMTP**.
3. Fill in the following settings:
    * **Addresses:** The email address from which the emails will be sent.
    * **Host:** The hostname of your SMTP server.
    * **Port:** The port number of your SMTP server. Typically **465** (for tls) or **587** (for ssl)
    * **Encryption:** The encryption type. Typically **tls** (for port 465) or **ssl** (for port 587).
    * **Username:** The username for your SMTP server.
    * **Password:** The password for your SMTP server.
4. Click the **Save** button.

Once you have completed these steps, Flarum will be able to send its verification emails.

## Changing initial admin user

You MUST add SMTP settings before editing the initial admin user.

## Installing Extensions

Please contact support at `hello@pikapods.com` and we will install the extensions you need for you. They will be kept in a mounted `plugins` folder and will persist container edits and updates.
