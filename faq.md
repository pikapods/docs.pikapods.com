---
title: FAQ
nav_order: 9
layout: page
description: "Common errors and frequently asked questions"
---
# Frequently Asked Questions


## Sending emails
Some apps need to send emails to work properly. Currently PikaPods doesn't offer email sending services. Some popular and proven options are [Mailjet](https://www.mailjet.com/), [Mailgun](https://www.mailgun.com/) and [Postmark](https://postmarkapp.com/). If you already use Amazon AWS, there is also [SES](https://aws.amazon.com/ses/).


## Support for individual apps
If you have any concerns with your PikaPods account, billing or with running apps, email to [hello@pikapods.com](mailto:hello@pikapods.com) any time. You will generally receive a response within a few hours on working days.

For well-defined, one-off setup tasks (like setting up email), we can sometimes help, if your account has seen a minimum of $50 in top-ups.

Unfortunately we don't have the resources to help deal with specific app issues. You may find help in a community forum or similar for that app. Please don't file a Github issue, unless it is a genuine bug report. This is to avoid overloading the app author with support requests.


## Using custom domains
If you already pay for your own domain, you can map a subdomain to your pod. So your pod will be reachable as e.g. 'status.my-domain.com'. This is done by adding a CNAME record and giving your pod subdomain as target. We will also apply for a SSL certificate for this domain using ACME http-01 verification. So it can take a few minutes before the pod is reachable from the new domain. Precise steps for setting a CNAME record vary by provider, but roughly you should check the following:

1. Take note of your pod's `xxx.pikapod.net` domain
2. Ensure no CAA records are set that may prevent us from applying for a SSL certificate. If you already use CAA, please also add `sectigo.com`, as mentioned [here](https://zerossl.com/help/troubleshoot/caa-records/).
3. Add a CNAME record that points to your pod. E.g.
   `wiki.mydomain.com. 3600 IN CNAME xxx.pikapod.net`
4. Use a tool like [DNS Checker](https://dnschecker.org/) to ensure the record on your domains shows your `pikapod.net` domain
5. Finally, add the new domain on PikaPod's control panel

After adding a domain, we will periodically check if DNS is still set up correctly. If there is any issue you will receive a notification.


## Accessing pod files using SFTP
SFTP is a way to securely access remote files. It's similar to FTP, but uses encryption. To access your pod's files, first enable SFTP in the pod's settings on the **Pod Settings > SFTP** tab. This will display the hostname, username and password to use.

Then use any SFTP client to connect to the displayed hostname. Some popular SFTP clients:

- [WinSCP](https://winscp.net/eng/index.php): free, Windows
- [Cyberduck](https://cyberduck.io/): free, macOS
- [Rclone](https://rclone.org/sftp/): free, Unix command line, good for larger transfers
- [OpenSSH SFTP](https://man.openbsd.org/sftp): free, Unix command line, included with OpenSSH

To connect to a pod, you need the following details, which will be displayed in the *SFTP* tab of your pod:

- Hostname: This is the `.pikapod.net` domain of your pod. E.g. `eager-beaver.pikapod.net`
- Port: This is always 22, which is the default port for SFTP
- Username: Usually something like `p9999`
- Password: A randomly generated password

The first time you may be prompted to verify the server signature. So you can be certain to connect to the correct server in the future.


### Have any other questions? [Email Us!](mailto:hello@pikapods.com)
{: .no_toc }