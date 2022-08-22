---
title: FAQ
nav_order: 9
layout: page
description: "Common errors and frequently asked questions"
---
# Frequently Asked Questions

## Sending Emails
Some apps need to send emails to work properly. Currently PikaPods doesn't offer email sending services. We recommend [Mailjet](https://www.mailjet.com/), which has a free tier.

## Using custom domains (CNAME)
If you already pay for your own domain, you can map a subdomain to your pod. This is done by adding a CNAME record and giving your pod subdomain as target. We will also apply for a SSL certificate for this domain using ACME http-01 verification. So it can take a few minutes before the pod is reachable from the new domain.

## Accessing pod files using SFTP
SFTP is a way to securely access remote files. It's similar to FTP, but uses encryption. To access your pod's files, first enable SFTP in the pod's settings on the *SFTP* tab. This will display the hostname, username and password to use.

Then use any SFTP client to connect to the displayed hostname. Some popular SFTP clients:

- [WinSCP](https://winscp.net/eng/index.php): free, Windows
- [Cyberduck](https://cyberduck.io/): free, macOS
- [Rclone](https://rclone.org/sftp/): free, Unix command line, good for larger transfers
- [OpenSSH SFTP](https://man.openbsd.org/sftp): free, Unix command line, included with OpenSSH

### Have any other questions? [Email Us!](mailto:hello@pikapods.com)
{: .no_toc }