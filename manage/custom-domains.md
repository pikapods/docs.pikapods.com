---
title: Custom Domains
nav_order: 1
layout: page
parent: Pod Management
description: Learn about using custom domains, common errors, and frequently asked questions.
---

# Custom Domains

If you already own a domain, you can use it with your pod in an instant. So it will be reachable as e.g. `status.my-domain.com` or `my-domain.com`.

If you don't have a domain yet, it's also easy to register one. [Domaintyper](https://domaintyper.com/) is a good starting point to find available domains. To compare prices, we like [TLDes](https://tldes.com/cheapest-domains). (no affiliation)


## Using Custom Domains

To use your own domain, you need to add a `CNAME` or `ALIAS` record and set your pod's `pikapod.net` domain as target.

> We will also apply for a free SSL certificate for each mapped domain. This ensures all data going to your pod is encrypted. It can take a few minutes before the pod is reachable from the new domain. You may see an error before this.

Steps to use a custom domain:

1. Open _Pod Settings_ and then the _Domain_ tab.
2. Enable _Custom Domain_. Take note of your pod's `xxx-yyy.pikapod.net` subdomain
3. Ensure no CAA records are set that may prevent us from applying for a SSL certificate. If you already use CAA, please also add `sectigo.com`, as mentioned [here](https://zerossl.com/help/troubleshoot/caa-records/) **and** `letsencrypt.org` as mentioned [here](https://letsencrypt.org/docs/caa/).
4. Then, depending on if you want to map a subdomain (e.g. `status.my-domain.com`) or root (apex) domain (e.g. `my-domain.com`):

   `CNAME` record for subdomains: `status.my-domain.com. 3600 IN CNAME xxx-yyy.pikapod.net`

   `ALIAS` record for root domains: `@ 3600 IN ALIAS xxx-yyy.pikapod.net`

5. Use a tool like [DNS Checker](https://dnschecker.org/) to ensure the record on your domains shows your `pikapod.net` domain or the same IP.
6. Finally, add the new domain on PikaPod's control panel. If the setup is correct, it will be verified and saved.

After adding a domain, we will periodically check if DNS is still set up correctly. If there is any issue you will receive a notification.

Only **one custom domain** can be mapped per pod. If you need additional alias domains, you will need to set up redirects with your DNS provider or a service like [Freedirector](https://freedirector.io/lite) (free, no signup needed) or [redirect.pizza](https://redirect.pizza/) (free tier).


## Cloudflare

It's possible to run a pod behind Cloudflare's proxy after it's set up. This will send all user requests to Cloudflare first and then to *PikaPods*. The setup can be useful for pods that get many outside visitors, but will make your experience slower for private pods that are only used after the user logged in.

When first adding a custom domain via Cloudflare, ensure the *Proxy* feature is **disabled**. Else we can't verify the DNS settings of your domain. You can enable proxying again after adding the custom domain.

Also ensure that you activate [**Full SSL encryption**](https://developers.cloudflare.com/ssl/origin-configuration/ssl-modes/#available-encryption-modes) (by default, it is set to Flexible SSL, which will cause an infinite loop) or disable the proxy and switch to DNS-only mode.

