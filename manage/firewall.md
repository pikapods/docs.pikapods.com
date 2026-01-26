---
layout: page
title: Firewall
parent: Pod Management
nav_order: 6
description: Restrict access to your pod using an IP allowlist.
---

# Firewall

The Firewall feature allows you to restrict access to your pod by creating an allowlist of IP addresses. This effectively blocks all connections from IPs not listed in the Firewall tab before they reach your pod.

{: .warning }

> External IPs can change. If you have access issues, confirm your [external IP](https://whatismyipaddress.com/) first.

Our servers support both IPv6 and IPv4. Usually, IPv6 will be preferred by modern networks. If you experience access issues:

1. Confirm you have added both your external IPv4 and IPv6 addresses.
2. Ensure you are only using IPv4 if you only added an IPv4 address.

{: .note }

> Our control panel will always be allowed to run automated health checks on your pod, regardless of firewall settings.

## Support Access

Our support team is not able to disable or bypass the firewall feature. If you need support to inspect your pod, you must disable the feature first.

## Disabling the Firewall

To fully disable the firewall feature, remove all listed IPs in the Firewall tab.
