---
title: FreeScout
layout: page
parent: App Notes
---

## Reset Password

If you forgot your password and don't have the email feature set up, you can reset the password via the database. Steps:

1. Enable [database access](/manage/database) for the pod.
2. Log into the database from the _PikaPods_ control panel
3. Navigate to the _users_ table
4. Ensure you see the _password_ field. It contains a `bcrypt`-encrypted password
5. Generate a new `bcrypt` hash using your new password. E.g. on [this website](https://bcrypt-generator.com/).
6. Enter the whole new hash in the _password_ field (Do NOT enter the cleartext password!)
7. Save the changes in Adminer and confirm you can log in again.

## Cache Not Clearing After Changes

When making changes in FreeScout, such as updating profile photo sizes, the changes may not take effect immediately due to caching. It's important to clear the cache to see the changes.

### Solution

To clear the FreeScout cache, follow these steps:

1. **Go to Manage > System > Tools.**
2. Click on **Clear Cache**.

This will ensure that any changes you make, such as modifying profile photo sizes, are properly applied.

## Clearing Module Cache

If you've installed a broken module in FreeScout and need to remove it, you can clear the module cache by following these steps:

1. Enable SFTP access to your FreeScout pod via _Pod Settings > Files_ and connect (see [Accessing Pod Files using SFTP](/manage/files#accessing-pod-files-using-sftp))
2. Remove the broken module from `data/Modules/` directory if it's still there
3. Delete all files in these directories:
   - `data/storage/framework/cache/data/*`
   - `data/storage/framework/views/*`
   - `data/storage/framework/sessions/*`
4. Visit `https://your-pod.pikapod.net/tools.php` and enter your APP_KEY (found in `data/config/config.php`) to clear the cache
5. Restart the pod

For more detailed information, see the [official FreeScout cache clearing documentation](https://github.com/freescout-help-desk/freescout/wiki/Clearing-the-Cache).

## Migration Guide

When migrating an existing FreeScout installation to PikaPods, follow these steps:

1. **Prepare Your Data**

   - From your existing installation:
     - Export your database (create a SQL dump)
     - Backup your entire FreeScout directory (contains config files, modules, etc.)
     - For detailed backup instructions, see the [FreeScout backup documentation](https://github.com/freescout-help-desk/freescout/wiki/Backup)
   - Create a new empty FreeScout pod in PikaPods and stop it before proceeding

2. **Database Migration**

   - FreeScout pods use PostgreSQL by default
   - For new pods with empty data, you can request MariaDB 10 instead, email us if you prefer MariaDB
   - If migrating from MySQL/MariaDB:
     - Convert your database to PostgreSQL using [PGLoader](https://github.com/dimitri/pgloader)
   - Import your SQL dump via the [database management interface](/manage/database)

3. **File Migration**

   - Enable [SFTP access](/manage/files) to your pod
   - Copy your modules to `/data/Modules`
     - Important: Modules are licensed to your server name. You'll need to either:
       - Enable a custom domain in your pod settings and point it to your original FreeScout domain, or
       - Deactivate modules on the original server and reactivate them on the pod
   - Copy folders from `/storage/app` to `/data/storage/app`

4. **Post-Migration Steps**
   - Start the pod and verify the login form appears
   - If you encounter any issues, set `APP_DEBUG` to `true` in the pod's environment variables for detailed error messages
   - Update any necessary configuration settings to match your previous setup
   - Note: After migration, mail server connections will need to be reconfigured. For example, Microsoft 365 email fetching won't work until you establish a new connection. Follow the [Microsoft 365 OAuth setup guide](https://github.com/freescout-help-desk/freescout/wiki/Connect-FreeScout-to-Microsoft-365-Exchange-via-oAuth) and manage tokens via [Microsoft Entra](https://entra.microsoft.com). For other mail servers, refer to the [FreeScout mail server documentation](https://github.com/freescout-help-desk/freescout/wiki/Fetching-Emails).

If you continue to experience issues after following these steps, please contact us via email with the following information:

- Detailed steps you've taken during the migration
- Where exactly the process is failing
- Any error messages you're seeing
- Pod logs (see [Check Logs](/manage/debug#check-logs) for instructions)
- Screenshots if applicable
