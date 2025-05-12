---
title: Actual Budget
layout: page
parent: App Notes
---

## OIDC Authentication with Custom Domains

When setting up OpenID Connect (OIDC) authentication with a [custom domain](/manage/custom-domains) in Actual Budget, follow these steps to ensure proper functionality:

1. **Configure Environment Variables**  
   First, set the required OIDC environment variables in your pod settings:

   - `ACTUAL_OPENID_SERVER_HOSTNAME`: Your Actual Server URL (e.g., `https://budget.example.com`)
   - Additional OIDC-related variables as specified in the [Actual Budget OAuth documentation](https://actualbudget.org/docs/experimental/oauth-auth/).

2. **Enable OIDC via UI**  
   After setting the environment variables, log in to your Actual Budget pod and enable OIDC through the [user interface](https://actualbudget.org/docs/experimental/oauth-auth/#configuring-openid-using-the-ui).

3. **Verify Custom Domain Configuration**  
   Ensure your custom domain is correctly configured in PikaPods with a CNAME record pointing to your PikaPods URL. Test the setup by attempting to log in via the custom domain. If you encounter a redirect error, double-check the `ACTUAL_OPENID_SERVER_HOSTNAME` value matches your custom domain exactly.

### Troubleshooting

- **Redirect Errors**: If OIDC works with the PikaPods URL but fails with the custom domain, verify that all OIDC-related environment variables are correctly set and that the custom domain is properly configured in both PikaPods and your DNS provider.
- **Mixed Configuration**: Avoid mixing UI and environment variable configurations. If issues persist, reset the OIDC settings and reconfigure them using only environment variables or only the UI, not both.

For further assistance, refer to the [Actual Budget Discord](https://discord.gg/8JfAXSgfRf) channel.

## Migrating Actual Budget to PikaPods

When migrating an existing Actual Budget installation to PikaPods, follow these steps:

1. **Prepare Your Data**

   - From your existing installation:
     - Export your database (create a SQL dump)
     - Backup your entire FreeScout directory (contains config files, modules, etc.)
     - For detailed backup instructions, see the [FreeScout backup documentation](https://github.com/freescout-help-desk/freescout/wiki/Backup)
   - Create a new empty Actual Budget pod in PikaPods and stop it before proceeding

2. **Database Migration**

   - FreeScout pods use PostgreSQL by default
   - For new pods with empty data, you can request MariaDB 10 instead, email us if you prefer MariaDB
   - If migrating from MySQL/MariaDB:
     - Convert your database to PostgreSQL using [PGLoader](https://github.com/dimitri/pgloader)
   - Import your SQL dump via the [database management interface](/manage/database)

3. **File Migration**

   - Enable [SFTP access](/manage/files) to your pod
   - Copy your modules to `/data/Modules`
     - Important: Modules are licensed to your server name. You'll need to either:
       - Enable a custom domain in your pod settings and point it to your original FreeScout domain, or
       - Deactivate modules on the original server and reactivate them on the pod
   - Copy folders from `/storage/app` to `/data/storage/app`

4. **Post-Migration Steps**
   - Start the pod and verify the login form appears
   - If you encounter any issues, set `APP_DEBUG` to `true` in the pod's environment variables for detailed error messages
   - Update any necessary configuration settings to match your previous setup
   - Note: After migration, mail server connections will need to be reconfigured. For example, Microsoft 365 email fetching won't work until you establish a new connection. Follow the [Microsoft 365 OAuth setup guide](https://github.com/freescout-help-desk/freescout/wiki/Connect-FreeScout-to-Microsoft-365-Exchange-via-oAuth) and manage tokens via [Microsoft Entra](https://entra.microsoft.com). For other mail servers, refer to the [FreeScout mail server documentation](https://github.com/freescout-help-desk/freescout/wiki/Fetching-Emails).

If you continue to experience issues after following these steps, please contact us via email with the following information:

- Detailed steps you've taken during the migration
- Where exactly the process is failing
- Any error messages you're seeing
- Pod logs (see [Check Logs](/manage/debug#check-logs) for instructions)
- Screenshots if applicable
