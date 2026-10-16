---
title: Umami
layout: page
parent: App Notes
---

## No Analytics after Update

After your pod was updated to version v1.39.4 on Nov 2, 2022, you may see a blank analytics page. This is due to authentication changes and can be resolved easily by logging out and back in again, as mentioned [here](https://github.com/umami-software/umami/issues/1598).

## Clear Old Analytics Data

Umami does not currently include a built-in option to automatically purge old analytics data. Large installations can therefore grow over time, especially in the `website_event` and `session` tables. If revenue tracking, heatmaps or session replay are enabled, `revenue`, `heatmap_event` and `session_replay` can also grow.

{: .warning }
If your pod is using excessive database storage, we may remove analytics data older than 3 months if we cannot reach the pod owner. You can also do this yourself from [database access](/manage/database) using Adminer.

Before deleting data, make sure you have a backup or are comfortable permanently removing old analytics history. The following examples remove data older than 3 months. Session replay recordings are much larger, so they are removed after 1 month, except for replays saved in Umami.

Optional: preview how many rows would be removed:

```sql
SELECT 'event_data' AS table_name, COUNT(*) AS rows
FROM event_data
WHERE website_event_id IN (
  SELECT event_id
  FROM website_event
  WHERE created_at < NOW() - INTERVAL '3 months'
)
UNION ALL
SELECT 'website_event', COUNT(*)
FROM website_event
WHERE created_at < NOW() - INTERVAL '3 months'
UNION ALL
SELECT 'session_data', COUNT(*)
FROM session_data
WHERE created_at < NOW() - INTERVAL '3 months'
UNION ALL
SELECT 'revenue', COUNT(*)
FROM revenue
WHERE created_at < NOW() - INTERVAL '3 months'
UNION ALL
SELECT 'heatmap_event', COUNT(*)
FROM heatmap_event
WHERE created_at < NOW() - INTERVAL '3 months'
UNION ALL
SELECT 'session_replay', COUNT(*)
FROM session_replay
WHERE created_at < NOW() - INTERVAL '1 month'
  AND visit_id NOT IN (SELECT visit_id FROM session_replay_saved)
UNION ALL
SELECT 'session', COUNT(*)
FROM "session"
WHERE created_at < NOW() - INTERVAL '3 months';
```

Delete analytics data older than 3 months in the correct order:

```sql
BEGIN;

DELETE FROM event_data
WHERE website_event_id IN (
  SELECT event_id
  FROM website_event
  WHERE created_at < NOW() - INTERVAL '3 months'
     OR session_id IN (
       SELECT session_id
       FROM "session"
       WHERE created_at < NOW() - INTERVAL '3 months'
     )
);

DELETE FROM website_event
WHERE created_at < NOW() - INTERVAL '3 months'
   OR session_id IN (
     SELECT session_id
     FROM "session"
     WHERE created_at < NOW() - INTERVAL '3 months'
   );

DELETE FROM session_data
WHERE created_at < NOW() - INTERVAL '3 months'
   OR session_id IN (
     SELECT session_id
     FROM "session"
     WHERE created_at < NOW() - INTERVAL '3 months'
   );

DELETE FROM revenue
WHERE created_at < NOW() - INTERVAL '3 months'
   OR session_id IN (
     SELECT session_id
     FROM "session"
     WHERE created_at < NOW() - INTERVAL '3 months'
   );

DELETE FROM heatmap_event
WHERE created_at < NOW() - INTERVAL '3 months';

DELETE FROM "session"
WHERE created_at < NOW() - INTERVAL '3 months';

COMMIT;
```

Session replay recordings can be very large, so remove them in batches. Run this repeatedly until it reports `DELETE 0`:

```sql
DELETE FROM session_replay
WHERE ctid IN (
  SELECT ctid
  FROM session_replay
  WHERE created_at < NOW() - INTERVAL '1 month'
    AND visit_id NOT IN (SELECT visit_id FROM session_replay_saved)
  LIMIT 20000
);
```

Note that the delete can take a while on large databases. If your database is larger than about 20 GB, contact support and we can run the cleanup for you. PostgreSQL does not return the freed space to disk right away, but it reuses it for new data, so the database stops growing.
