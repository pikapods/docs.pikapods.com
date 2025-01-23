---
title: PocketBase
layout: page
parent: App Notes
---

## First-time Admin Setup

Starting with PocketBase version 0.23.x, the initial admin setup process has changed. To create your first superuser account, follow these steps:

1. After creating your PocketBase pod, go to [Pod > More > Show Logs](https://docs.pikapods.com/manage/debug#check-logs)
2. Look for a line containing a URL that starts with `http://0.0.0.0:8090/_/#/pbinstal/` followed by a JWT token

   ![PocketBase setup token in logs](/img/pocketbase-token-logs.png)

3. Copy this URL and replace `http://0.0.0.0:8090` with your pod's URL (`https://<YOUR_POD_SLUG>.pikapod.net`)
4. Open the modified URL in your browser to access the setup page
5. Follow the on-screen instructions to create your admin account
