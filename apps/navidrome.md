---
title: Navidrome
layout: page
parent: App Notes
---

# Known Issues

## Performance Issues with Navidrome Pod

Some users have reported performance issues with their Navidrome pods, such as freezing, locking, and unresponsiveness when streaming music. These issues may occur when the default settings are not adjusted for larger music libraries or multiple users.

### Solution

To improve the performance of your Navidrome pod, consider adjusting the scan interval and resource allocation:

1. **Adjust Scan Interval**: Change the default scan interval from `@every 1min` to `@every 60m` to reduce the frequency of scans and alleviate performance issues.

   - Navigate to [**My Pods**](https://www.pikapods.com/pods).
   - Select your **Navidrome Pod**.
   - Click on the **Settings** (gear icon at the bottom left).
   - Go to **ENV VARS** and update the `ND_SCANSCHEDULE` field to `@every 60m`.

2. **Increase Resources**: Consider increasing the RAM and CPU allocation for your pod. Users have found that allocating 1GB of RAM and an additional CPU can improve performance.
