---
title: Ghost
layout: page
parent: App Notes
---

## Sending email
A working email configuration is required to send newsletters and account emails for new users. There are two kinds of emails and corresponding settings:

### Bulk emails
Those are used for sending newsletters. Currently **only Mailgun is supported**. To set up bulk emails, simply add your Mailgun (sub)domain and *private API key* or a domain's *Sending API key* in *Settings > Newsletter*. More [here](https://ghost.org/docs/faq/mailgun-newsletters/).

### Transactional emails
Used to e.g. send a welcome email or reset a user's password. You can use any SMTP service for this. Since we need Mailgun for bulk emails anyway, here the steps for using Mailgun:

1. Log into your Mailgun control panel
2. Find the domain's *SMTP Credentials* tab, as described [here](https://help.mailgun.com/hc/en-us/articles/203380100-Where-Can-I-Find-My-API-Key-and-SMTP-Credentials-#01GAJ2K1WS5GSWGKQ82TSVQSNV)
3. Add a new SMTP user. The password will be shown in a grey box at the bottom-right
4. Go back to *PikaPods* and open the pods settings (or add those settings in the config file via [SFTP](/faq/#accessing-pod-files-using-sftp))
5. Under *Env Vars* fill in the below details as shown [here](https://forum.ghost.org/t/failed-to-send-magic-link-email-error-when-trying-to-sign-up/31035/14)
    - `mail__transport`: `SMTP`
    - `mail__from`: `noreply@EXAMPLE.COM`
    - `mail__options__service`: `Mailgun`
    - `mail__options__host`: `smtp.mailgun.org` or `smtp.eu.mailgun.org` (for US or EU server location, as shown in *SMTP Settings* on Mailgun)
    - `mail__options__port`: `587`
    - `mail__options__secure`: `false` (or `true` when using port 465)
    - `mail__options__auth__user`: `postmaster@mg.EXAMPLE.com` (Or any other user you added in Mailgun. Be sure that the supplied user can send using the address given in `mail__from`.)
    - `mail__options__auth__pass`: The password shown in the grey box on Mailgun
6. Now you should be able to send transactional emails. If you still get an error, check the pod's logs in *PikaPods*'s control panel. It will show the detailed error.

## Editing `config.json`
The upstream image currently [doesn't support](https://github.com/docker-library/ghost/issues/73) editing or persisting configuration files. All configuration is done via env vars. We already support many different Ghost options. If you need more added, please get in touch.

## Casper theme missing
When using the default *Casper* theme, in rare cases the site may look broken after a pod restart. This is due to a [known issue](https://github.com/docker-library/ghost/issues/230) with Docker adding a broken symlink. If you experience this issue, go to *Settings > Design > Change Theme* and reinstall the desired theme.

You can also upload and customize your own theme via [SFTP](/manage/files).