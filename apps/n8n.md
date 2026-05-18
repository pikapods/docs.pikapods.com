---
title: n8n
layout: page
parent: App Notes
---

## Reset Password

If SMTP is configured, use n8n's **Forgot password** option on the login page.

If SMTP is not configured and you are locked out, you can reset the password through [database access](/manage/database). n8n stores user passwords as bcrypt hashes.

1. Generate a bcrypt hash for a temporary password.

   If you have `htpasswd` installed locally:

   ```bash
   htpasswd -bnBC 10 "" "your-new-password" | cut -d: -f2
   ```

   You can also use [bcrypt-generator.com](https://bcrypt-generator.com/). Set **Rounds (Cost Factor)** to `10`.

2. Enable [database access](/manage/database) for the pod and open Adminer.
3. In Adminer, select the n8n database and open **SQL command**.
4. Run the following SQL, replacing the email address and bcrypt hash:

```sql
UPDATE "user"
SET "password" = 'YOUR_BCRYPT_HASH'
WHERE "email" = 'you@example.com';
```

5. Log in with the temporary password and change it immediately in n8n.

For future password resets, configure SMTP for n8n. See our [email FAQ](/faq/technical#sending-emails) and the [official n8n user management docs](https://docs.n8n.io/hosting/configuration/user-management-self-hosted/).
