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