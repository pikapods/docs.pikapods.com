---
title: Uptime Kuma
layout: page
parent: App Notes
---

# Known Issues

## Slow Dashboard and Operations
Uptime Kuma uses SQLite to store monitoring data. No other databases are supported. This can make it slow if you monitor at very short intervals and keep the data for a long time. More [here](https://github.com/louislam/uptime-kuma/issues/953) and [here](https://github.com/louislam/uptime-kuma/issues/1397).

Solution is to reduce monitoring history and frequency, as described [here](https://github.com/louislam/uptime-kuma/issues/1397#issuecomment-1172847138) or add more CPU cores to the pod.

You may see offline monitors while either using the *Shrink Database* feature or reducing the number of days to keep. This can last for 5 to 10 minutes, depending on the data size.


## Monitored site is marked down with `getaddrinfo EAI_AGAIN` error
This error means that a DNS lookup for your monitored site time out for some reason. This is perfectly normal, when doing many thousand monitoring requests a day.

To avoid getting an alert in such cases, be sure to set **Retry** to at least 2 or 3. That way you can be really sure a site is really down before triggering an alert.

PikaPods itself doesn't implement a local DNS cache, but provides popular public resolvers to each pod.


## Reset Password
To reset any user's password:

1. Stop the pod
2. Enable SFTP in *Edit Pod > Files*.
3. Download the current version of the SQLite database. Usually named `kuma.db`. Keep a copy as backup
4. Open the database with any SQLite tool and find the `user` table.
5. Add any bcrypt-hashed password. E.g. this is for just "password": `$2y$10$IWoZl5q9Tvvp1wxROvi4hOul7XP.rfyrvm4xbm7ufVANke1nfvLIu`. (Please change this later in the GUI when using it.)
6. Put your edited database copy back in the same place.
7. Start your pod back up and log in using the new password