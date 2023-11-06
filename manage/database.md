---
title: Database
nav_order: 3
layout: page
parent: Pod Management
description: Databases are like the brain of an app. While it's not usually needed, at PikaPods you always have the option to edit, import or export the app's database directly.
---

# Managing Databases

Many apps we offer need a database to keep settings and user data. *PikaPods* provides a local database to each pod that needs it. This gives the best speed, while still allowing us to take daily backups for you.

## Edit the Pod's Database

Advanced users can directly access the database of certain apps to make small edits or import/export data.

**Enabling Database Access**

1. Navigate to **Pod Settings > Database**.
2. You will find an "Enable Database Access" switch. Toggle it to enable or disable database access, depending on your needs.
3. Enabling it will display a login link and a password.

> This feature may not be available for all apps. Some apps use SQLite databases, which can be accessed using SFTP to retrieve the database file.

**Security Considerations**

For improved security, it's essential to keep the database access feature disabled when you're not actively using it. This helps protect your data and minimize potential security risks.

## Import and Export the Pod's Database

After enabling database access, you can use Adminer's import and export features to replace the whole database, if needed. Be sure the pod is stopped when doing this.