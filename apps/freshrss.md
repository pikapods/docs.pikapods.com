---
title: FreshRSS
layout: page
parent: Apps
---

## Automatically refresh feeds
To enable automtic updates, set the `CRON_MIN` setting exposed in the pod's *Env Var* settings to a valid Cron minute setting. E.g.:

- `35`: update once every hour, 35 minutes past the hour
- `13,43`: twice an hour at X:13 and X:43
- `*/20`: every 20 minutes

**Note**: the update script won’t update any particular feed more often than once every twenty minutes, so it doesn’t make sense to trigger it much more frequently than that.

More in the [official docs](https://freshrss.github.io/FreshRSS/en/admins/08_FeedUpdates.html) and [Docker docs](https://github.com/FreshRSS/FreshRSS/blob/edge/Docker/README.md#option-1-cron-inside-the-freshrss-docker-image).