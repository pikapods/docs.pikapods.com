---
title: Shlink
layout: page
parent: App Notes
---

Shlink is a self-hosted, open-source URL shortener. It consists of an API server and uses a separate web client for management.

## Accessing the Dashboard

To manage your Shlink instance, use the official web client at [app.shlink.io](https://app.shlink.io):

1.  Click **Add a server**.
2.  **URL**: Enter your PikaPod URL (e.g., `https://your-pod.pikapod.net`).
3.  **API Key**: Use the `INITIAL_API_KEY` found in your pod's **Settings > ENV VARS**.
4.  Click **Create server**.

## Generate new API key

If you need to generate a new API key, you can insert it directly into the [database](/manage/database). Shlink on PikaPods uses MariaDB and stores API keys as **SHA256 hashes**.

To get started, log in to the database GUI (Adminer) and click **SQL command** in the top-left sidebar.

### Requirements
- **Format**: Alphanumeric characters only.
- **Length**: Between 32 and 64 characters.

### Step 1: Generate a SHA256 hash

Pick a secure string for your key and generate its hash using MariaDB:

```sql
SELECT SHA2('your-api-key', 256);
```

### Step 2: Insert into the database

Run the following SQL to create the key:

```sql
INSERT INTO api_keys (
    `key`,
    `name`,
    expiration_date,
    enabled
) VALUES (
    'YOUR_SHA256_HASH_HERE',
    'My Manual Key',
    NULL,  -- Never expires
    1      -- Enabled
);
```

Once inserted, use your plaintext key (`your-api-key`) to connect at [app.shlink.io](https://app.shlink.io).

For more info on configuration, see the [official documentation](https://shlink.io/documentation/).
