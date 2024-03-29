---
title: Debug
nav_order: 5
layout: page
parent: Pod Management
description: Troubleshoot and debug your pod. When something goes wrong, you can look at logs or restart a pod to get it working again.
---

# Debugging a Pod

If a pod shows "Pod is loading..." for more than a few minutes, there is usually an issue with starting it. The causes of this can be varied. Some common ones are a lack of space, wrong env vars or some issue inside the application container. You can follow the below steps to isolate the issue:

## Check Logs

In most cases the detailed error can be found in the pod logs. To view them, just click the _Show Logs_ button and look for obvious errors.

Some apps also write logs to their persistent storage. Those can be accessed via [SFTP](/manage/files).

If the error is still unclear or no log is available, you can also use _Report Issue_, include the logs you got and we'll investigate further.

<img src="/img/pod-show-logs.jpg" width="60%" />


## Recreate Pod

You can fully reset your pod by adjusting either _Resources_ or _Env Vars_ in the _Settings_ tab. This will recreate the application and only your database (if any) and files will remain. Doing so will also resolve any issue that happened _inside_ the application. It won't resolve issues that are related to settings files or wrong env vars.