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
