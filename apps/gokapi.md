---
title: Gokapi
layout: page
parent: App Notes
---

## SSL Configuration Issue

Users may encounter an error stating "Client sent an HTTP request to an HTTPS server" when trying to access the Gokapi pod after initial setup. This issue arises from an SSL configuration conflict.

### Solution

To properly set up Gokapi on PikaPods and avoid SSL conflicts:

1. **Initial Setup**:

   - Navigate to your Gokapi pod's setup page by visiting `<your-pod-url>/setup`.
   - Follow the setup instructions, keeping most settings at their default values.
   - **Important**: Do not enable the HTTPS setting. Ensure it is kept disabled since SSL is already handled by PikaPods.

2. **Post-Setup Access**:
   - After completing the setup, you might be redirected to an incorrect URL due to the SSL settings.
   - Instead, manually navigate to `<your-pod-url>/login` to log in with the admin credentials you created during setup.

## Updating Domain Configuration

If you've added a custom domain to your pod and Gokapi is still generating links with the old subdomain, you need to update the `ServerUrl` setting in the configuration file.

1. Stop the pod.
2. Access your pod files via SFTP. (Refer to [this page](/manage/files) for accessing pod files using SFTP.)
3. Open `config/config.json`.
4. Find the `ServerUrl` setting and update it to your new domain (e.g., `https://yourdomain.com`).
5. Save the file and start the pod again.

Gokapi stores the domain in a configuration file rather than environment variables, so when you change your pod domain, this setting needs to be updated manually.
