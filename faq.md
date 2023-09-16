---
title: FAQ
nav_order: 9
layout: page
description: "Common errors and frequently asked questions"
---
# Frequently Asked Questions

## Account Limits
To ensure system stability, every account is subject to limits on the amount of CPU cores, memory and disk storage it can use. You can view these limits in the control panel under *Account > Account Limits*. To avoid abuse, new accounts start with lower limits. After you make the first top-up to your account, your limits will increase to 10 pods and 2 TB of storage. If you need more than that, please just send an email to [hello@pikapods.com](mailto:hello@pikapods.com).


## Sending emails
Some apps need to send emails to work properly. Currently PikaPods doesn't offer email sending services. Some popular and proven options are [Mailjet](https://www.mailjet.com/), [Mailgun](https://www.mailgun.com/) and [Postmark](https://postmarkapp.com/). If you already use Amazon AWS, there is also [SES](https://aws.amazon.com/ses/).

No matter which provider you use for emails, be sure to use a *submission port*, like port 465 or 587. To prevent spam from our system port 25 is blocked.


## Using custom domains
Moved to [Custom Domains](/pod-management/custom-domains).

## Accessing pod files using SFTP
Moved to [Files](/pod-management/files).

## Accessing the pod's database
Moved to [Database](/pod-management/database).


## Adding new apps
New apps are regularly being added. If your favorite app isn't available yet, you can suggest or vote for it on our [feedback](https://feedback.pikapods.com/) page. For an app to be suitable for PikaPods, it should roughly match those criteria:

- Be a web application and use one HTTPS port only
- Not use large amounts of CPU or bandwith by design (e.g. video encoding)
- Not have a potential for abuse or impact on other pods (e.g. proxies or VPNs)
- Have a license that allows self-hosting
- Not compete with the author's own paid hosting service, unless alternative hosting options are actively promoted.
- Have an official (or semi-official) Docker image available
- Be actively developed and security issues are adressed


## Updating apps
Providing you with a stable experience is our main priority. As such we don't just automatically apply updates as they are released, but test them in a staging environment before making them available to all pods. Updates should also be for a stable release (in the context of the project) and released for a minimum of 3 days. Generally updates will reach your pod within 1-2 weeks of their release.

For security-related updates, we may do ad-hoc updates of single apps.


## Missing environment variables
When adding new apps, we will add the most common and useful env vars from the start. Sometimes this doesn't include very specific or newly-added env vars. If you find that an env var you want to use is missing, just send us an email to to [hello@pikapods.com](mailto:hello@pikapods.com) and we will add it right away.


## Backup of pod data
Moved to [Backup](/pod-management/backup).

## Debugging a Pod
Moved to [Debugging](/pod-management/debugging).


## IPv6 Support
We fully support IPv6 as of May 2023. Before this, IPv6 worked over TCP, but possibly not ICMP. If your pod was created before May 2023, you may need to recreate it. This will happen automatically during updates or when you change resources or env vars.


## Support for individual apps
If you have any concerns with your PikaPods account, billing or with running apps, email to [hello@pikapods.com](mailto:hello@pikapods.com) any time. You will generally receive a response within a few hours on working days.

For well-defined, one-off setup tasks (like setting up email), we can sometimes help, if your account has seen a minimum of $50 in top-ups.

Unfortunately we don't have the resources to help deal with specific app issues. You may find help in a community forum or similar for that app. Please don't file a Github issue, unless it is a genuine bug report. This is to avoid overloading the app author with support requests.


### Have any other questions? [Email Us!](mailto:hello@pikapods.com)
{: .no_toc }