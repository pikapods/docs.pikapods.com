---
title: Custom Domains
nav_order: 1
layout: page
parent: Pod Management
description: Learn about using custom domains, common errors, and frequently asked questions.
---

## Using custom domains

If you already pay for your own domain, you can map a sub- or root domain to your pod. So your pod will be reachable as e.g. `status.my-domain.com` or `my-domain.com`. This is done by adding a `CNAME` or `ALIAS` record and setting your pod's pikapod.net domain as target. We will also apply for a SSL certificate for this domain. So it can take a few minutes before the pod is reachable from the new domain. Steps to use a custom domain:

1. Open _Pod Settings_ and then the _Domain_ tab.
2. Enable _Custom Domain_. Take note of your pod's `xxx-yyy.pikapod.net` subdomain
3. Ensure no CAA records are set that may prevent us from applying for a SSL certificate. If you already use CAA, please also add `sectigo.com`, as mentioned [here](https://zerossl.com/help/troubleshoot/caa-records/) **and** `letsencrypt.org` as mentioned [here](https://letsencrypt.org/docs/caa/).
4. Then, depending on if you want to map a subdomain (e.g. `status.my-domain.com`) or root (apex) domain (e.g. `my-domain.com`):

   `CNAME` record for subdomains: `status.my-domain.com. 3600 IN CNAME xxx-yyy.pikapod.net`

   `ALIAS` record for root domains: `@ 3600 IN ALIAS xxx-yyy.pikapod.net`

5. Use a tool like [DNS Checker](https://dnschecker.org/) to ensure the record on your domains shows your `pikapod.net` domain or the same IP.
6. Finally, add the new domain on PikaPod's control panel. If the setup is correct, it will be verified and saved.

> If you are using Cloudflare, please ensure that you activate Full SSL encryption (by default, it is set to Flexible SSL, which will cause an infinite loop) or disable the proxy and switch to DNS-only mode.

After adding a domain, we will periodically check if DNS is still set up correctly. If there is any issue you will receive a notification.

Only **one custom domain** can be mapped per pod. If you need additional alias domains, you will need to set up redirects with your DNS provider or a service like [Freedirector](https://freedirector.io/lite) (free, no signup needed) or [redirect.pizza](https://redirect.pizza/) (free tier).
