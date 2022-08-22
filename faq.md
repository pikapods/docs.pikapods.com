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

### Have any other questions? [Email Us!](mailto:hello@pikapods.com)
{: .no_toc }