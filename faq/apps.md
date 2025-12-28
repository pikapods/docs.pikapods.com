---
title: Apps & Updates
nav_order: 2
layout: page
parent: FAQ
description: "Questions about app support, file editing, adding new apps and update policies."
---
# Apps & Updates
{: .no_toc }
1. TOC
{:toc}

## Support for Individual Apps
If you have any concerns with your PikaPods account, billing or an offline pod, email to [hello@pikapods.com](mailto:hello@pikapods.com) any time. You will generally receive a response within a few hours on working days.

Beyond this, we can't offer support for individual apps or their features. This is because they are developed, maintained, and distributed by independent third-party authors and communities. We only ever charge you for the resources to host these apps and don't monetize your data or charge for premium features. You can still get help from those sources:

- Many apps have [notes](/apps) that explain setup steps or common issues. You also find them via *See FAQ* in your pod control panel.
- Visit the *Project Page* link of an app and read their documentation.
- When setting up *Env Vars*, you will find a link to the official documentation explaining each setting.
- There may be a forum or chat room for the app to ask questions and get help from other users.
- Sometimes the author will offer commercial support. This is also a great way to support the app's development.
- If you think there is a bug in the app or you have an idea for a new feature, you can raise it to the developers on their Github Issues page.
- For more complex projects, it can make sense to get a professional. Freelancer sites, like [Upwork](https://www.upwork.com/) are good to find expert sysadmins or webdesigners. This works even for smaller tasks.


## Editing app files or source code
At *PikaPods* we deploy all apps as isolated containers. This means all dependencies and source code files are bundled by the app author and distributed as container image. This mean you get the same experience as running the same image directly and can be sure there are no modifications to the app.

Compared to other ways of deploying apps (like putting PHP files on shared hosting space), it's not recommended to make adjustments to any files that aren't explicitly mounted from the image and visible via SFTP. While it may work temporarily, all such changes will be lost during the next update or edit.

In the large majority of cases, you will find that all necessary files are available via SFTP and no further changes are necessary. If you think a new mounted folder should be made available for an app, do get in [touch](mailto:hello@pikapods.com) and it will be reviewed.


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
Providing you with a stable experience is our main priority. As such we don't just automatically apply updates as they are released, but test them in a staging environment before making them available to all pods. Updates should also be for a stable release (in the context of the project) and released for a minimum of 3 days. Generally updates will reach your pod within 1-2 weeks of their release, but often sooner.

For security-related updates, we may do ad-hoc updates of single apps.

For breaking changes (as defined in release logs), we will send a notification by email one week before the update.

For all other updates, you can choose to receive a notification when your pod is updated by changing the setting in *Edit Pod Settings > Basics > Notify me of updates*.

## Missing environment variables
When adding new apps, we will add the most common and useful env vars from the start. Sometimes this doesn't include very specific or newly-added env vars. If you find that an env var you want to use is missing, just send us an email to to [hello@pikapods.com](mailto:hello@pikapods.com) and we will add it right away.
