---
title: Files
nav_order: 2
layout: page
parent: Pod Management
description: With PikaPods, all data is under your control. Here you learn how to directly access your files using SFTP.
---

# Manage Pod Files

Pods can also use permanent file stores, called *volumes*. Volumes live outside your pod and persist across updates and configuration changes. E.g. a photo app will usually keep the pictures you upload in such a volume. This has the benefit that you can easily upload or download those files.


## Accessing Pod Files Using SFTP

SFTP is a way to securely access remote files. It's similar to FTP, but uses encryption. To access your pod's files, first enable SFTP in the pod's settings on the **Pod Settings > SFTP** tab. This will display the hostname, username and password to use.

Then use any SFTP client to connect to the displayed hostname. Some popular SFTP clients:

- [WinSCP](https://winscp.net/eng/index.php): free, Windows
- [Cyberduck](https://cyberduck.io/): free, macOS
- [Rclone](https://rclone.org/sftp/): free, Unix command line, good for larger transfers
- [OpenSSH SFTP](https://man.openbsd.org/sftp): free, Unix command line, included with OpenSSH

To connect to a pod, you need the following details, which will be displayed in the _SFTP_ tab of your pod:

- Hostname: This is the `.pikapod.net` domain of your pod. E.g. `eager-beaver.pikapod.net`
- Port: This is always 22, which is the default port for SFTP
- Username: Usually something like `p9999`
- Password: A randomly generated password

The first time you may be prompted to verify the server signature. So you can be certain to connect to the correct server in the future.

Also note that you can only _write_ to subfolders, like `data` or `music` that you may see. You can **not** add files in the top folder, since those wouldn't be accessible in your pod.

Files starting with a dot (like `.config`) may be hidden in your SFTP client. If you don't see any files, try changing the setting to show hidden files.
