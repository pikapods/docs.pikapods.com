---
title: Files & Database
nav_order: 2
layout: page
description: Learn how to access pod files using SFTP, manage the pod's database, and perform backups.
---

## Accessing pod files using SFTP

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

## Accessing the Pod's Database

Advanced users can directly access the database of certain apps to make small edits or import/export data.

**Enabling Database Access**

1. Navigate to **Pod Settings > Database**.
2. You will find an "Enable Database Access" switch. Toggle it to enable or disable database access, depending on your needs.
3. Enabling it will display a login link and a password.

> This feature may not be available for all apps. Some apps use SQLite databases, which can be accessed using SFTP to retrieve the database file.

**Security Considerations**

For improved security, it's essential to keep the database access feature disabled when you're not actively using it. This helps protect your data and minimize potential security risks.

## Backup of pod data

Keeping your data safe is very important to us. In addition to redundant drives, there are also daily backups of all databases and mounted files (everything you see over SFTP) pods use. These backups are meant to recover from server-wide failures. While it's also possible to restore individual pod files in emergencies, we currently can't offer this service regularly.

All persistent pod data is available over [SFTP](#accessing-pod-files-using-sftp). Some pods also use an external database, usually Postgresql or MySQL/MariaDB.

You can make a full pod backup by following the steps:

1. Stop the pod to make sure all data from memory is written to disk (e.g. for SQLite or Mongo databases)
2. Enable [SFTP](#accessing-pod-files-using-sftp) in the pod's settings.
3. Log into the pod via SFTP and copy all files.
4. Enable [Database access](#accessing-the-pods-database) in the pod's settings.
5. Log into the pod's database and _Export_ the whole database.
6. Start your pod again

We plan on adding more granular backup- and restore options in the future. See [here](https://feedback.pikapods.com/posts/14/offer-backup-option) for the latest progress.
