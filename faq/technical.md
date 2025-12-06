---
title: Technical Details
nav_order: 3
layout: page
parent: FAQ
description: "Technical questions about email, IPv6, proxy headers, data centers and time zones."
---
# Technical Details
{: .no_toc }
1. TOC
{:toc}

## Sending emails
Some apps need to send emails to work properly. Currently PikaPods doesn't offer email sending services. Some popular options are [Mailjet](https://www.mailjet.com/), [Mailgun](https://www.mailgun.com/) and [Postmark](https://postmarkapp.com/). If you already have a Google/Gmail Email account, you could [use](https://support.google.com/a/answer/176600?hl=en#gmail-smtp-option) that too.

No matter which provider you use for emails, be sure to use a *submission port*, like port 465 or 587. To prevent spam from our systems port 25 is blocked.


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
