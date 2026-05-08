---
title: Uptime Kuma
layout: page
parent: App Notes
---

# Known Issues

## Slow Dashboard and Operations

Older Uptime Kuma pods use SQLite to store monitoring data. This can make them slow if you monitor at very short intervals and keep the data for a long time. More [here](https://github.com/louislam/uptime-kuma/issues/953) and [here](https://github.com/louislam/uptime-kuma/issues/1397).

Solution is to reduce monitoring history and frequency, as described [here](https://github.com/louislam/uptime-kuma/issues/1397#issuecomment-1172847138) or add more CPU cores to the pod.

Pods added after November 2025 use a MySQL database instead of SQLite and can better handle larger amounts of monitoring data. If your Uptime Kuma installation has grown too large and the dashboard or operations remain slow, we suggest migrating to a new MySQL-based pod.

You may see offline monitors while either using the _Shrink Database_ feature or reducing the number of days to keep. This can last for 5 to 10 minutes, depending on the data size.

## Monitored site is marked down with `getaddrinfo EAI_AGAIN` error

This error means that a DNS lookup for your monitored site time out for some reason. This is perfectly normal, when doing many thousand monitoring requests a day.

To avoid getting an alert in such cases, be sure to set **Retry** to at least 2 or 3. That way you can be really sure a site is really down before triggering an alert.

PikaPods itself doesn't implement a local DNS cache, but provides popular public resolvers to each pod.

## Reset Password

To reset any user's password:

First, stop the pod. Then generate a bcrypt hash for the temporary password you want to use.

If you have `htpasswd` installed locally:

```bash
htpasswd -bnBC 10 "" "your-new-password" | tr -d ':\n'
```

If you have Docker installed:

```bash
docker run --rm httpd:2.4-alpine htpasswd -bnBC 10 "" "your-new-password" | tr -d ':\n'
```

You can also use an online bcrypt generator, like [bcrypt-generator.com](https://bcrypt-generator.com/). Set **Rounds (Cost Factor)** to `10` to match the examples above. Only use this for a temporary password and change the password again after logging in.

Then follow the steps for your pod's database type.

### MySQL-based pods

1. Enable [database access](/manage/database) in _Pod Settings > Database_.
2. Open the database and find the `user` table.
3. Add the generated bcrypt hash to the password field.
4. Start your pod back up and log in using the new password.

### Older SQLite-based pods

1. Enable SFTP in _Edit Pod > Files_.
2. Download the current SQLite database, usually named `kuma.db`, and keep a copy as backup.
3. Open the database with any SQLite tool and find the `user` table.
4. Add the generated bcrypt hash to the password field.
5. Put your edited database copy back in the same place.
6. Start your pod back up and log in using the new password.

## Migrating Monitors to a MySQL-based Pod

There is no supported direct database migration from SQLite to MySQL. If you want to move to a new MySQL-based pod, the safest approach is to copy monitor definitions and start with fresh monitoring history.

The example below uses the `kuma` CLI from [BigBoot/AutoKuma](https://github.com/BigBoot/AutoKuma). Download the correct binary for your OS from the [releases page](https://github.com/BigBoot/AutoKuma/releases) and put it on your `PATH`.

- Use `kuma-mac`, `kuma-linux`, or `kuma-windows.exe` for this workflow.
- Do not use `autokuma-mac`, `autokuma-linux`, or `autokuma-windows.exe`. Those are daemon binaries for watching Docker labels and do not support `monitor list` or `monitor add`.

If you see `Invalid config: missing configuration field "kuma.url"`, you are likely running `autokuma-*` instead of `kuma-*`.

The CLI uses the admin username and password from the web UI. Replace `https://SOURCE`, `https://TARGET`, `admin`, and `PASS` in the examples with your own pod URLs and login details.

### Export monitors

```bash
kuma --url https://SOURCE \
  --username admin --password 'PASS' \
  monitor list > monitors.json
```

### Import monitors

`monitor add` consumes one JSON object per file, so split the export first with `jq`. This example removes IDs, tags, and notification references so the monitors can be imported into a fresh pod without source-only foreign keys:

```bash
mkdir -p out
for id in $(jq -r 'keys[]' monitors.json); do
  jq --arg id "$id" \
    '.[$id] | del(.id, .tags, .notificationIDList)' \
    monitors.json > "out/$id.json"
done

kuma --url https://TARGET \
  --username admin --password 'PASS' \
  monitor add out/*.json
```

### Notifications and tags

Each monitor can reference notifications and tags by numeric ID. Those IDs only exist on the source pod. On the target pod, they will be different or missing. If you keep those references during import, you may see a database error about `monitor_tag_tag_id_foreign` or another missing foreign key.

The import example above removes these references to keep the basic migration short and reliable.

Notifications and tags can also be exported and imported with the same CLI using `kuma notification list`, `kuma notification add`, `kuma tag list`, and `kuma tag add`, but they must exist on the target pod before monitors referencing them are imported.

Status pages and other settings can also be migrated separately, but this gets more involved. For most large installations, copying monitors, notifications, and tags is enough to move to a new MySQL-based pod.
