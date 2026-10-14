## Uploading attachments and avatars

[Kan](https://kan.bn/) only supports file uploads (card attachments and user avatars) through external S3-compatible object storage. Unlike other apps, it can't store files on the pod's disk, and PikaPods doesn't include built-in S3 storage. You need to bring your own bucket from a provider such as Cloudflare R2, Backblaze B2 or AWS S3.

Until storage is configured, any upload fails with:

> Upload failed: Failed to upload attachment. Please try again.

### Configure S3 storage

Once you have a bucket, open your pod's settings, go to _Edit Pod Settings_ > _Env Vars_ and set:

* `S3_ENDPOINT` — your S3 endpoint URL.
* `S3_REGION` — your S3 region, for example `auto` or `eu-central-1`.
* `S3_ACCESS_KEY_ID` — your S3 access key ID.
* `S3_SECRET_ACCESS_KEY` — your S3 secret access key.
* `S3_FORCE_PATH_STYLE` — set to `true` if your provider uses path-style URLs.
* `NEXT_PUBLIC_STORAGE_URL` — the public base URL where uploads are served from.
* `NEXT_PUBLIC_STORAGE_DOMAIN` — the storage hostname without scheme or port, for example `storage.example.com`.
* `NEXT_PUBLIC_AVATAR_BUCKET_NAME` — the bucket name for avatars.
* `NEXT_PUBLIC_ATTACHMENTS_BUCKET_NAME` — the bucket name for attachments.

Saving changes to environment variables automatically restarts your pod.

### Larger attachments

The default upload size limit is 1 MB. To upload larger files, also set `NEXT_API_BODY_SIZE_LIMIT`, for example to `50mb`.

For more details, see the upstream [S3 documentation](https://docs.kan.bn/guides/self-hosting/s3) and the [Kan README](https://github.com/kanbn/kan/blob/main/README.md).
