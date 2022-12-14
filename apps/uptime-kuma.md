---
title: Uptime Kuma
layout: page
parent: Apps
---

# Known Issues

## IPv6 Ping (ICMP)
Pinging a monitoring host using ICMP6 doesn't currently work due to an issue in our virtualization tool. Connecting to IPv6 hosts DOES work, so you can use TCP port monitoring or HTTP requests.

## Slow Dashboard and Operations
Uptime Kuma uses SQLite to store monitoring data. No other databases are supported. This can make it slow if you monitor at very short intervals and keep the data for a long time. More [here](https://github.com/louislam/uptime-kuma/issues/953) and [here](https://github.com/louislam/uptime-kuma/issues/1397).

Solution is to reduce monitoring history, as described [here](https://github.com/louislam/uptime-kuma/issues/1397#issuecomment-1172847138) or add more CPU cores to the pod.