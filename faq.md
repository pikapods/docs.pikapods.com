---
title: FAQ
nav_order: 9
layout: page
description: "Frequently asked questions regarding our PikaPods.com app hosting service. Covers topics like account limits, sending emails or which apps we can add."
---
# Frequently Asked Questions

## Pricing
The cost of running a pod will depend on the resources you choose to allocate to it. All resources have a built-in discount and will get cheaper as you allocate more of them.

The monthly price for a selected combination of compute resources will be shown when adding or editing them. Or on our frontpage under [Pricing](https://www.pikapods.com/#pricing). You can also see the minimum price per month with each [app](https://www.pikapods.com/apps).

You can also stop pods you aren't using. In this case you won't be charged for CPUs or memory, but you will still be charged for allocated storage. There is also a minimum charge of $1 per pod per month, no matter the state.


## Minimum Resource Requirements
Some apps have minimum resource requirements that are optimized to cover a majority of typical use cases. You can always allocate additional resources, if your pod is slow or low on memory.

When adding new apps, we set minimum resource requirements based on several factors:

- The nature of the app and its resource usage
- Recommendations from the app's authors and users
- Our experience with users running the apps on PikaPods

While some apps may work with lower specs initially, they might not provide the best user experience or may cause memory errors or slowness when using certain features. The minimum requirements we set aim to provide a good starting point for most users to ensure a smooth experience.

If you pod runs out of memory multiple times, we will notify you and automatically increase memory to make sure it's stable.


## Account Limits
To ensure system stability, every account is subject to limits on the amount of CPU cores, memory and disk storage it can use. You can view these limits in the control panel under *Account > Account Limits*. To avoid abuse, new accounts start with lower limits. After you make the first top-up to your account, your limits will increase to 10 pods and 2 TB of storage. If you need more than that, please just send an email to [hello@pikapods.com](mailto:hello@pikapods.com).


## Support for Individual Apps
If you have any concerns with your PikaPods account, billing or an offline pod, email to [hello@pikapods.com](mailto:hello@pikapods.com) any time. You will generally receive a response within a few hours on working days.

Beyond this, we can't offer support for individual apps or their features. This is because we only charge you for the resources to host the app and don't monetize your data or charge for premium features. You can still get help from those sources:

- Many apps have [notes](/apps) that explain setup steps or common issues. You also find them via *See FAQ* in your pod control panel.
- Visit the *Project Page* link of an app and read their documentation.
- When setting up *Env Vars*, you will find a link to the official documentation explaining each setting.
- There may be a forum or chat room for the app to ask questions and get help from other users.
- Sometimes the author will offer commercial support. This is also a great way to support the app's development.
- If you think there is a bug in the app or you have an idea for a new feature, you can raise it to the developers on their Github Issues page.
- Our parent company, [Peakford](https://www.peakford.com/), can provide expert support for most apps, including one-off setup or doing more complex and custom deployments.


## Sending emails
Some apps need to send emails to work properly. Currently PikaPods doesn't offer email sending services. Some popular options are [Mailjet](https://www.mailjet.com/), [Mailgun](https://www.mailgun.com/) and [Postmark](https://postmarkapp.com/). If you already have a Google/Gmail Email account, you could [use](https://support.google.com/a/answer/176600?hl=en#gmail-smtp-option) that too.

No matter which provider you use for emails, be sure to use a *submission port*, like port 465 or 587. To prevent spam from our systems port 25 is blocked.


## Editing app files or source code
At *PikaPods* we deploy all apps as isolated containers. This means all dependencies and source code files are bundled by the app author and distributed as container image. This mean you get the same experience as running the same image directly and can be sure there are no modifications to the app.

Compared to other ways of deploying apps (like putting PHP files on shared hosting space), it's not recommended to make adjustments to any files that aren't explicitly mounted from the image and visible via SFTP. While it may work temporarily, all such changes will be lost during the next update or edit.

In the large majority of cases, you will find that all necessary files are available via SFTP and no further changes are necessary. If you think a new mounted folder should be made available for an app, do get in [touch](mailto:hello@pikapods.com) and it will be reviewed.


## Business use and service level
Can you use *PikaPods* for your business apps? The answer is yes! Many of our users already run business-critical apps on our platform. We are also hoping to add more feature in the future to serve this segment better. Here what you can expect in terms of uptime, support and data safety:

- **Uptime and maintenance**: Historically, you can expect an uptime of about 99.95% over a month or better, which translates to about 30 minutes of downtime in a month. This is needed to apply regular app updates, as well as system updates. App updates happen about twice a month and take a few seconds only. System updates need a reboot and last about 15 minutes. They will be scheduled at off-peak hours in their region and happen ever 3 to 6 months. It can take up to 30 minutes for all pods to be back up, since they are started back up in random sequence. (These numbers are historical averages and don't consitute any uptime guarantee or service level agreement.)
- **Support Response Time**: Our support staff works in Asian and EU time zones and you can expect a response in less than an hour during normal business hours.
- **Backups**: We take whole-server offsite backups daily and every server has redundant drives.
- **Testing**: As opposed to doing automatic container updates, all our updates are tested before they reach your pod. This includes dealing with breaking changes and migrations over time.

In the future, we plan on adding a "business" tier to better address the needs of users who rely on their pod for production needs. This would include:

- Contractual service level agreement (SLA)
- Guaranteed support response times
- Per-pod backups/snapshots to e.g. AWS S3 buckets
- Additional app testing
- Monitoring of your apps
- Live migration before reboots to minimize downtime

If you already use *PikaPods* for your business apps and want an additional level of support from the same team, you also look into [Peakford's managed server solutions](https://www.peakford.com/).


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

For breaking changes (as defined in release logs), we will send a notification by email one week before the update.


## Missing environment variables
When adding new apps, we will add the most common and useful env vars from the start. Sometimes this doesn't include very specific or newly-added env vars. If you find that an env var you want to use is missing, just send us an email to to [hello@pikapods.com](mailto:hello@pikapods.com) and we will add it right away.


## IPv6 Support
All our servers are set up to be reachable via IPv6.


## Proxy Headers

Your pod runs behind a proxy, which handles SSL. The following proxy headers are set and can be used by pods to e.g. log the actual IP of visitors:

- `X-Forwarded-For`
- `X-Forwarded-Proto`
- `X-Forwarded-Host`


## Data centers

Depending on the region you choose, most pods will be deployed in the following data center:

- EU region: Hetzner Falkenstein, Germany and Hetzner Finland
- US region: Evocative BOS1 Data Center, Boston, MA and Cyber WURX, Atlanta, GA

Additional data center partners may be added over time, depending on current market conditions and operational needs.


## Time zones
Our servers all run on standard UTC time zone. If you prefer to use a different time zone, you can often adjust it in the app itself or pass a new time zone via the `TZ` env var in your dashboard under *Pod Edit > Env Vars*. See [here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List) for a list of supported time zones. When supported, simply put any value from the *TZ Identifier* column as `TZ` env var. E.g. `EST`, `America/Detroit` or `Etc/GMT+5`.


## Delete your Account

If you are not using your *PikaPods* account to run any pods, there is no cost assosicated with it, so you could just let it sit until you need it again. Any credit you have, including free welcome credit, won't expire and will still be there.

In case you still want to fully remove the account, use those steps:

1. Remove all your pods first.
2. Navigate to [Account > Profile > Remove Account](https://www.pikapods.com/account?tab=profile) to close the account.
3. You will receive an email notification confirming the account closure.

Please note that this can't be undone and to use *PikaPods* again you will need to sign up for a new account.


### Have any other questions? [Email Us!](mailto:hello@pikapods.com)
{: .no_toc }
