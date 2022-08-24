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
If you already pay for your own domain, you can map a subdomain to your pod. So your pod will be reachable as e.g. 'status.my-domain.com'. This is done by adding a CNAME record and giving your pod subdomain as target. We will also apply for a SSL certificate for this domain using ACME http-01 verification. So it can take a few minutes before the pod is reachable from the new domain. Precise steps for setting a CNAME record vary by provider, but roughly you should check the following:

1. Take note of your pod's `xxx.pikapod.net` domain
2. Ensure no CAA records are set that may prevent us from applying for a SSL certificate. If you already use CAA, please also add `sectigo.com`, as mentioned [here](https://zerossl.com/help/troubleshoot/caa-records/).
3. Add a CNAME record that points to your pod. E.g.
   `wiki.mydomain.com. 3600 IN CNAME xxx.pikapod.net`
4. Use a tool like [DNS Checker](https://dnschecker.org/) to ensure the record on your domains shows your `pikapod.net` domain
5. Finally, add the new domain on PikaPod's control panel

After adding a domain, we will periodically check if DNS is still set up correctly. If there is any issue you will receive a notification.


## Accessing pod files using SFTP
SFTP is a way to securely access remote files. It's similar to FTP, but uses encryption. To access your pod's files, first enable SFTP in the pod's settings on the *SFTP* tab. This will display the hostname, username and password to use.

Then use any SFTP client to connect to the displayed hostname. Some popular SFTP clients:

- [WinSCP](https://winscp.net/eng/index.php): free, Windows
- [Cyberduck](https://cyberduck.io/): free, macOS
- [Rclone](https://rclone.org/sftp/): free, Unix command line, good for larger transfers
- [OpenSSH SFTP](https://man.openbsd.org/sftp): free, Unix command line, included with OpenSSH


### Have any other questions? [Email Us!](mailto:hello@pikapods.com)
{: .no_toc }