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

Run the following SQL to create the key:

```sql
INSERT INTO api_keys (
    `key`,
    `name`,
    expiration_date,
    enabled
) VALUES (
    SHA2('YourSecureApiKey', 256),  -- Your plaintext API key
    'Dashboard access key',         -- Any unique label for this key
    NULL,                           -- Never expires
    1                               -- Enabled
);
```

Replace `YourSecureApiKey` with your own API key. A 32 to 64 character alphanumeric key is recommended, but shorter keys will also work.

Once inserted, use the plaintext key you chose to connect at [app.shlink.io](https://app.shlink.io). Since no roles are added here, this creates an admin API key.

For more info on configuration, see the [official documentation](https://shlink.io/documentation/).
