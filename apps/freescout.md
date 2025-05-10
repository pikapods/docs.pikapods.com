---
title: FreeScout
layout: page
parent: App Notes
---


## Reset Password

If you forgot your password and don't have the email feature set up, you can reset the password via the database. Steps:

1. Enable [database access](/manage/database) for the pod.
2. Log into the database from the *PikaPods* control panel
3. Navigate to the *users* table
4. Ensure you see the *password* field. It contains a `bcrypt`-encrypted password
5. Generate a new `bcrypt` hash using your new password. E.g. on [this website](https://bcrypt-generator.com/).
6. Enter the whole new hash in the *password* field (Do NOT enter the cleartext password!)
7. Save the changes in Adminer and confirm you can log in again.


## Cache Not Clearing After Changes

When making changes in FreeScout, such as updating profile photo sizes, the changes may not take effect immediately due to caching. It's important to clear the cache to see the changes.

### Solution

To clear the FreeScout cache, follow these steps:

1. **Go to Manage > System > Tools.**
2. Click on **Clear Cache**.

This will ensure that any changes you make, such as modifying profile photo sizes, are properly applied.
