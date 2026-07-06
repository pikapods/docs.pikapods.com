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


## Prune old executions automatically

Execution history grows over time and can eventually slow n8n down or cause problems when it updates. To keep it in check, enable automatic pruning. These are available under _Env Vars_ in your pod settings:

* `EXECUTIONS_DATA_PRUNE` — set to `true` to automatically delete old executions.
* `EXECUTIONS_DATA_MAX_AGE` — how long (in hours) to keep finished executions. For example, `186` keeps roughly a week of history.

With pruning enabled, n8n removes old execution records on its own, keeping the database small and the instance responsive.

> **Note:** pruning only removes **finished** executions. It keeps history from building up over time, but it won't clear a backlog that has already accumulated — use *Clearing the backlog* above for that.


## High CPU From a Large Execution Backlog

A backlog of stored executions usually builds up when an active workflow triggers far more runs than n8n can handle — a short-interval schedule or polling trigger, or a webhook being called repeatedly. The runs get stuck in the database and n8n keeps trying to process them.

### Symptoms

n8n needs a long time to start and you may notice:

* CPU usage stays high, often pinned at the pod's limit.
* The logs repeat `Execution is already being resumed by another process` many times.
* The logs may also show `timeout exceeded when trying to connect` errors, even though your database is running fine.
* The instance feels slow, and the number of stored executions does not go down on its own.

### Confirm it in the database

Connect to your pod's PostgreSQL database (for example with Adminer) and run:

```sql
SELECT status, count(*) FROM execution_entity GROUP BY status ORDER BY 2 DESC;
```

If you see a very large number (tens of thousands or more) of executions in the `new` status, that is the backlog causing the problem. For example:

```
status      count
new         100000
canceled    20000
crashed     13000
success     171
error       138
```

### Resolve it

Clear the stored executions, then restart your pod:

```sql
TRUNCATE execution_entity RESTART IDENTITY CASCADE;
```

After running this, restart the n8n pod from your dashboard. With the backlog gone, CPU usage should return to normal and the repeated log messages should stop.

> **What is deleted:** only your **execution history** — the logs of past, failed, and pending workflow runs. Your **workflows and credentials are not affected**; they are stored separately and remain intact. The pending runs that are removed were stuck and would not have completed anyway.

## Calling one workflow from another on the same instance

If a workflow needs to trigger another workflow running on the same n8n instance, use the built-in **Execute Workflow** node instead of an HTTP Request node calling the webhook's URL.

Calling your own instance's public URL via HTTP Request routes the request out through DNS and back in over the network, adding unnecessary latency and an extra point of failure. The Execute Workflow node calls the target workflow directly within the same n8n process, with no network round-trip involved.
