---
title: Navidrome
layout: page
parent: App Notes
---

## Advanced Configuration: Using navidrome.toml

Some advanced Navidrome settings, such as custom tag splitters for artist fields, can only be set via a configuration file (`navidrome.toml`) and not through environment variables.

### How to Use a Custom navidrome.toml

1. **Create your `navidrome.toml` file**

   - Example for custom artist splitters:
     ```toml
     [Tags.Artist]
     Split = ["/", " / ", " feat. ", " ft. ", "; "]
     ```
   - For all available options, see the [Navidrome configuration documentation](https://www.navidrome.org/docs/usage/configuration-options/#configuration-file).

2. **Upload the file to your pod**

   - Enable [SFTP access](/manage/files) for your pod.
   - Connect via SFTP and upload your `navidrome.toml` file to the `/data` directory.

3. **Restart your pod**
   - After uploading, restart your Navidrome pod from the PikaPods dashboard to apply the new settings.

**Note:**

- The configuration file must be named `navidrome.toml` and placed directly in the `/data` directory.
- Some settings (like default theme) may only apply to new users or require a fresh login (try incognito mode to test).
- If you encounter issues, double-check the file format and restart the pod again.

## Known Issues

### Performance Issues with Navidrome Pod

Some users have reported performance issues with their Navidrome pods, such as freezing, locking, and unresponsiveness when streaming music. These issues may occur when the default settings are not adjusted for larger music libraries or multiple users.

### Solution

To improve the performance of your Navidrome pod, consider adjusting the scan interval and resource allocation:

1. **Adjust Scan Interval**: Change the default scan interval from `@every 1min` to `@every 60m` to reduce the frequency of scans and alleviate performance issues.

   - Navigate to [**My Pods**](https://www.pikapods.com/pods).
   - Select your **Navidrome Pod**.
   - Click on the **Settings** (gear icon at the bottom left).
   - Go to **ENV VARS** and update the `ND_SCANSCHEDULE` field to `@every 60m`.

2. **Increase Resources**: Consider increasing the RAM and CPU allocation for your pod. Users have found that allocating 1GB of RAM and an additional CPU can improve performance.
