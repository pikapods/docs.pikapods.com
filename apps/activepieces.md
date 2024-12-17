---
title: Activepieces
layout: page
parent: App Notes
---

## Known Session Issue

Users may encounter a **401 Unauthorized** error when trying to access the Activepieces pod. This error often indicates that the session token has expired, preventing users from logging in or accessing certain features.

### Solution

To resolve the 401 error, follow these steps:

1. **Clear your browser cookies and cache**:

   - This can help reset any expired session tokens.

   **OR**

   **Clear application data**:

   - Open the browser's developer tools (usually by pressing `F12` or right-clicking and selecting "Inspect").
   - Navigate to the **Application** tab.
   - Clear the application data to remove any stored session information.

2. **Refresh the page**:

   - After clearing the data, refresh the page to initiate a new session.

3. **Log in again**:
   - Use your credentials to log back into the Activepieces pod.

### Additional Information

We have created a [GitHub issue](https://github.com/activepieces/activepieces/issues/6022) regarding this problem, but it has not been addressed by the developers. Users experiencing this issue should follow the steps above to mitigate the problem until a permanent fix is implemented.
