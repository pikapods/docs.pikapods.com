---
title: Flarum
layout: page
parent: App Notes
---

## Installing Extensions

You can manage extensions using the [Extension Manager](https://github.com/flarum/extension-manager) extension, which comes pre-installed with all Flarum pods on *PikaPods*. Navigate to *Administration > Features > Extension Manager* in your Flarum pod to enable and use it.

To persist extensions during pod updates and edits, you also need to add the `vendor/package-name` in the file `/data/extensions/list`. This file can be accessed via [SFTP](/faq/#accessing-pod-files-using-sftp). Be sure to have a new line at the end of the file. (We are [working](https://github.com/crazy-max/docker-flarum/issues/103) to get rid of this step.)


## Send email with SMTP

First login to the Flarum forum as an administrator and then follow these steps:

1. Go to **Administration > Email**.
2. Under **Choose a Driver**, select **SMTP**.
3. Fill in the following settings:
   - **Addresses:** The email address from which the emails will be sent.
   - **Host:** The hostname of your SMTP server.
   - **Port:** The port number of your SMTP server. Typically `465` (for SSL) or `587` (for TLS)
   - **Encryption:** The encryption type. Typically `ssl` (for port 465) or `tls` (for port 587).
   - **Username:** The username for your SMTP server.
   - **Password:** The password for your SMTP server.
4. Click the **Save** button.

Once you have completed these steps, Flarum will be able to send its verification emails.

> If you receive an error message when sending the test email, please check your SMTP settings carefully and make sure that they are correct.

## Changing initial admin user

You MUST setup [email with SMTP](#send-email-with-smtp) before editing the initial admin user.

**Step 1: Change username**

1. Go to **Administration > Users**.
2. Click the **Edit** button next to the user `flarum` (default admin user).
3. In the new popup, change the username to the desired one.
4. Click **Save Changes**.

**Step 2: Change email**

1. Go to **Profile > Settings**.
2. Under **Account**, click **Change Email**.
3. In the popup, change the email in the first field, and enter the account password (default `flarum`) in the second field.
4. Click **Save Changes**.
5. You will now receive a confirmation email to the new email address. Click the link in the email to verify the changes.

**Step 2: Change password**

1. Go to **Profile > Settings**.
2. Under **Account**, click **Change Password**.
3. In the popup, click **Send Password Reset Email** and check email.
4. You will now receive a password reset email to your account email. Click the link in the email to reset password.

