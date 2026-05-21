---
title: Umami
layout: page
parent: App Notes
---

## No Analytics after Update

After your pod was updated to version v1.39.4 on Nov 2, 2022, you may see a blank analytics page. This is due to authentication changes and can be resolved easily by logging out and back in again, as mentioned [here](https://github.com/umami-software/umami/issues/1598).

## Clear Old Analytics Data

Umami does not currently include a built-in option to automatically purge old analytics data. Large installations can therefore grow over time, especially in the `website_event` and `session` tables. If revenue tracking or session replay is enabled, `revenue`, `session_replay`, and `session_replay_saved` can also grow.

If your pod is using excessive database storage, we may remove analytics data older than 13 months if we cannot reach the pod owner. You can also do this yourself from [database access](/manage/database) using Adminer.

Before deleting data, make sure you have a backup or are comfortable permanently removing old analytics history. The following examples remove data older than 13 months.

Optional: preview how many rows are older than 13 months:

```sql
SELECT 'event_data' AS table_name, COUNT(*) AS rows
FROM event_data
WHERE website_event_id IN (
  SELECT event_id
  FROM website_event
  WHERE created_at < NOW() - INTERVAL '13 months'
)
UNION ALL
SELECT 'website_event', COUNT(*)
FROM website_event
WHERE created_at < NOW() - INTERVAL '13 months'
UNION ALL
SELECT 'session_data', COUNT(*)
FROM session_data
WHERE created_at < NOW() - INTERVAL '13 months'
UNION ALL
SELECT 'revenue', COUNT(*)
FROM revenue
WHERE created_at < NOW() - INTERVAL '13 months'
UNION ALL
SELECT 'session_replay', COUNT(*)
FROM session_replay
WHERE created_at < NOW() - INTERVAL '13 months'
UNION ALL
SELECT 'session_replay_saved', COUNT(*)
FROM session_replay_saved
WHERE created_at < NOW() - INTERVAL '13 months'
UNION ALL
SELECT 'session', COUNT(*)
FROM "session"
WHERE created_at < NOW() - INTERVAL '13 months';
```

Delete rows older than 13 months in the correct order:

```sql
BEGIN;

DELETE FROM event_data
WHERE website_event_id IN (
  SELECT event_id
  FROM website_event
  WHERE created_at < NOW() - INTERVAL '13 months'
     OR session_id IN (
       SELECT session_id
       FROM "session"
       WHERE created_at < NOW() - INTERVAL '13 months'
     )
);

DELETE FROM website_event
WHERE created_at < NOW() - INTERVAL '13 months'
   OR session_id IN (
     SELECT session_id
     FROM "session"
     WHERE created_at < NOW() - INTERVAL '13 months'
   );

DELETE FROM session_data
WHERE created_at < NOW() - INTERVAL '13 months'
   OR session_id IN (
     SELECT session_id
     FROM "session"
     WHERE created_at < NOW() - INTERVAL '13 months'
   );

DELETE FROM revenue
WHERE created_at < NOW() - INTERVAL '13 months'
   OR session_id IN (
     SELECT session_id
     FROM "session"
     WHERE created_at < NOW() - INTERVAL '13 months'
   );

DELETE FROM session_replay
WHERE created_at < NOW() - INTERVAL '13 months'
   OR session_id IN (
     SELECT session_id
     FROM "session"
     WHERE created_at < NOW() - INTERVAL '13 months'
   );

DELETE FROM session_replay_saved
WHERE created_at < NOW() - INTERVAL '13 months';

DELETE FROM "session"
WHERE created_at < NOW() - INTERVAL '13 months';

COMMIT;
```

Note that the delete can take a while on large databases. PostgreSQL may not immediately return the freed space to disk, autovacuum will usually clean up over time.
