---
title: Billing & Account
nav_order: 1
layout: page
parent: FAQ
description: "Questions about pricing, account limits, business use and account management."
---
# Billing & Account
{: .no_toc }
1. TOC
{:toc}

## Pricing
The cost of running a pod will depend on the resources you choose to allocate to it. All resources have a built-in discount and will get cheaper as you allocate more of them.

The monthly price for a selected combination of compute resources will be shown when adding or editing them. Or on our frontpage under [Pricing](https://www.pikapods.com/#pricing). You can also see the minimum price per month with each [app](https://www.pikapods.com/apps).

You can also stop pods you aren't using. In this case you won't be charged for CPUs or memory, but you will still be charged for allocated storage. There is also a minimum charge of $1 per pod per month, no matter the state.

We may adjust pricing for new pods to better reflect the current price of compute resources. For existing pods, the pricing valid at the time of creation will still apply.


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


## Delete your Account

If you are not using your *PikaPods* account to run any pods, there is no cost assosicated with it, so you could just let it sit until you need it again. Any credit you have, including free welcome credit, won't expire and will still be there.

In case you still want to fully remove the account, use those steps:

1. Remove all your pods first.
2. Navigate to [Account > Profile > Remove Account](https://www.pikapods.com/account?tab=profile) to close the account.
3. You will receive an email notification confirming the account closure.

Please note that this can't be undone and to use *PikaPods* again you will need to sign up for a new account.
