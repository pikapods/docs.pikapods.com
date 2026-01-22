---
title: Listmonk
layout: page
parent: App Notes
---

## Customize System Templates

System templates for emails and public pages can be customized via [SFTP](/manage/files) in the `static` folder. On older pods, this includes `email-templates` and `public` subfolders. Newer pods use built-in defaults and the `static` folder may be empty.

{: .warning }
A pod restart is always required to apply template changes.

Outdated templates can cause **Internal Server Error** (e.g., related to Captcha). To resolve this, [update your templates from GitHub](https://github.com/knadh/listmonk/tree/master/static) or delete the contents of the `static` folder to revert to the latest built-in defaults.

## Reset Password

If you need to reset a user's password, you can do so by connecting to the database via [Database Access](/manage/database). In Adminer:

1. Select the "SQL command" option
2. Enter the following query:

```sql
UPDATE users SET password = CRYPT('your-new-password', GEN_SALT('bf')) WHERE username='your-username';
```

Replace `your-new-password` with your desired password and `your-username` with the username whose password you want to reset.
