---
title: Uptime Kuma
layout: page
parent: Apps
---

# Known Issues

## Slow Dashboard and Operations
Uptime Kuma uses SQLite to store monitoring data. No other databases are supported. This can make it slow if you monitor at very short intervals and keep the data for a long time. More [here](https://github.com/louislam/uptime-kuma/issues/953) and [here](https://github.com/louislam/uptime-kuma/issues/1397).

Solution is to reduce monitoring history and frequency, as described [here](https://github.com/louislam/uptime-kuma/issues/1397#issuecomment-1172847138) or add more CPU cores to the pod.

You may see offline monitors while either using the *Shrink Database* feature or reducing the number of days to keep. This can last for 5 to 10 minutes, depending on the data size.


## Monitored site is marked down with `getaddrinfo EAI_AGAIN` error
This error means that a DNS lookup for your monitored site time out for some reason. This is perfectly normal, when doing many thousand monitoring requests a day.

To avoid getting an alert in such cases, be sure to set **Retry** to at least 2 or 3. That way you can be really sure a site is really down before triggering an alert.

PikaPods itself doesn't implement a local DNS cache, but provides popular public resolvers to each pod.