---
title: Backup
nav_order: 4
layout: page
parent: Pod Management
description: Learn how to perform backups of pod data.
---

## Backup of pod data

Keeping your data safe is very important to us. In addition to redundant drives, there are also daily backups of all databases and mounted files (everything you see over SFTP) pods use. These backups are meant to recover from server-wide failures. While it's also possible to restore individual pod files in emergencies, we currently can't offer this service regularly.

All persistent pod data is available over [SFTP](/pod-management/files#accessing-pod-files-using-sftp). Some pods also use an external database, usually Postgresql or MySQL/MariaDB.

You can make a full pod backup by following the steps:

1. Stop the pod to make sure all data from memory is written to disk (e.g. for SQLite or Mongo databases)
2. Enable [SFTP](/pod-management/files#accessing-pod-files-using-sftp) in the pod's settings.
3. Log into the pod via SFTP and copy all files.
4. Enable [Database access](/pod-management/database#accessing-the-pods-database) in the pod's settings.
5. Log into the pod's database and _Export_ the whole database.
6. Start your pod again

We plan on adding more granular backup- and restore options in the future. See [here](https://feedback.pikapods.com/posts/14/offer-backup-option) for the latest progress.
