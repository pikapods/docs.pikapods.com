---
title: Listmonk
layout: page
parent: App Notes
---

## Customize System Templates

System templates for emails and public pages are available for editing via [SFTP](/manage/files), as described [here](https://listmonk.app/docs/templating/#system-templates). You find them in the `static` folder. It may be necessary to restart the pod to apply changes.

You can also update those templates by grabbing the latest version from [Github](https://github.com/knadh/listmonk/tree/master/static).

## Reset Password

If you need to reset a user's password, you can do so by connecting to the database via [Database Access](/manage/database). In Adminer:

1. Select the "SQL command" option
2. Enter the following query:

```sql
UPDATE users SET password = CRYPT('your-new-password', GEN_SALT('bf')) WHERE username='your-username';
```

Replace `your-new-password` with your desired password and `your-username` with the username whose password you want to reset.
