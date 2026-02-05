---
title: Ghost
layout: page
parent: App Notes
---

## Sending email

A working email configuration is required to send newsletters and account emails for new users. There are two kinds of emails and corresponding settings:

### Bulk emails

Those are used for sending newsletters. Currently **only Mailgun is supported**. To set up bulk emails, simply add your Mailgun (sub)domain and _private API key_ or a domain's _Sending API key_ in _Settings > Newsletter_. More [here](https://ghost.org/docs/faq/mailgun-newsletters/).

### Transactional emails

Used to e.g. send a welcome email or reset a user's password. You can use any SMTP service for this. Since we need Mailgun for bulk emails anyway, here the steps for using Mailgun:

1. Log into your Mailgun control panel
2. Find the domain's _SMTP Credentials_ tab, as described [here](https://help.mailgun.com/hc/en-us/articles/203380100-Where-Can-I-Find-My-API-Key-and-SMTP-Credentials-#01GAJ2K1WS5GSWGKQ82TSVQSNV)
3. Add a new SMTP user. The password will be shown in a grey box at the bottom-right
4. Go back to _PikaPods_ and open the pods settings (or add those settings in the config file via [SFTP](/faq/#accessing-pod-files-using-sftp))
5. Under _Env Vars_ fill in the below details as shown [here](https://forum.ghost.org/t/failed-to-send-magic-link-email-error-when-trying-to-sign-up/31035/14)
   - `mail__transport`: `SMTP`
   - `mail__from`: `noreply@EXAMPLE.COM`
   - `mail__options__service`: `Mailgun`
   - `mail__options__host`: `smtp.mailgun.org` or `smtp.eu.mailgun.org` (for US or EU server location, as shown in _SMTP Settings_ on Mailgun)
   - `mail__options__port`: `587`
   - `mail__options__secure`: `false` (or `true` when using port 465)
   - `mail__options__auth__user`: `postmaster@mg.EXAMPLE.com` (Or any other user you added in Mailgun. Be sure that the supplied user can send using the address given in `mail__from`.)
   - `mail__options__auth__pass`: The password shown in the grey box on Mailgun
6. Now you should be able to send transactional emails. If you still get an error, check the pod's logs in _PikaPods_'s control panel. It will show the detailed error.

## Editing `config.json`

The upstream image currently [doesn't support](https://github.com/docker-library/ghost/issues/73) editing or persisting configuration files. All configuration is done via env vars. We already support many different Ghost options. If you need more added, please get in touch.

## Customizing robots.txt

To customize the robots.txt file for your Ghost site:

1. Download your current theme from the Ghost admin panel
2. Add your custom `robots.txt` file to the root directory of your theme (e.g., `themes/your-theme/robots.txt`)
3. Upload the modified theme back through _Settings > Design > Change Theme_
4. Verify the changes by visiting `yourdomain.com/robots.txt`

Example `robots.txt` content:

```txt
User-agent: *
```

## Casper theme missing

When using the default _Casper_ theme, in rare cases the site may look broken after a pod restart. This is due to a [known issue](https://github.com/docker-library/ghost/issues/230) with Docker adding a broken symlink. If you experience this issue, go to _Settings > Design > Change Theme_ and reinstall the desired theme.

You can also upload and customize your own theme via [SFTP](/manage/files).

## Using MinIO Storage

Ghost can use MinIO (an S3-compatible storage service) for storing images and other media files. To set this up, you'll need to:

1. Install the MinIO storage adapter:
   - Connect to your pod via [SFTP](/manage/files)
   - Navigate to the `content` directory
   - Create the path `adapters/storage/minio` if it doesn't exist
   - Upload the contents of [ghost-minio](https://github.com/captbrogers/ghost-minio) repository into this directory

2. Configure the storage adapter in pod `Settings > ENV VARS` with your MinIO credentials:
   - `storage__active`: `minio`
   - `storage__minio__accessKey`: Your MinIO access key
   - `storage__minio__secretKey`: Your MinIO secret key
   - `storage__minio__bucket`: Your bucket name
   - `storage__minio__endPoint`: Your MinIO server endpoint (without http/https)
   - `storage__minio__port`: MinIO server port (optional, defaults to 9000)
   - `storage__minio__useSSL`: Set to `true` if using HTTPS (optional)

After configuring these settings, Ghost will store all new media uploads in your MinIO bucket instead of the local filesystem.

## Adding Analytics (Umami)

Umami is a privacy-friendly, self-hosted alternative to Google Analytics or Plausible. We also offer [Umami analytics in PikaPods](https://www.pikapods.com/pods?run=umami). You can easily add it to your Ghost site:

1. Log into your Umami dashboard and add your website to get the tracking script.
2. In Ghost Admin, go to **Settings > Code Injection**.
3. Paste the tracking script into the **Site Header** section.
   Example: `<script defer src="https://<pod-url>.pikapod.net/script.js" data-website-id="YOUR_SITE_ID"></script>`
4. Click **Save**.

Your Ghost site will now start sending analytics to your Umami instance.

## Adding Analytics (Plausible)

Plausible is another popular privacy-focused analytics platform. Integrating it with Ghost is just as simple:

1. Log into your Plausible dashboard and add your website to get the tracking script.
2. In Ghost Admin, go to **Settings > Code Injection**.
3. Paste the tracking script into the **Site Header** section.
4. Click **Save**.

## Two-Factor Authentication (2FA)

Ghost has introduced two-factor authentication for staff accounts. By default, this security feature is enabled and requires staff members to verify new devices when logging in.

If you prefer to disable this feature, you can do so by:

1. Go to your pod settings in the PikaPods control panel
2. Navigate to the "ENV VARS" section
3. Set the following environment variable:
   - `security__staffDeviceVerification`: `false`

If you wish to keep 2FA enabled, you must set up [Transactional emails](#transactional-emails) as described above, as these are required for sending verification codes.

For more information about Ghost's 2FA feature, see the [official changelog](https://ghost.org/changelog/2fa/).
