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
