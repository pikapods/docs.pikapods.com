---
title: The Lounge
layout: page
parent: App Notes
---

## Managing Users

The Lounge stores user configurations as JSON files, accessible via [SFTP](/manage/files) at `/thelounge/users`.

### Adding a User via JSON

To add a new user manually, you can create a new `.json` file in the users directory.

1.  **Generate a Password Hash**:
    The Lounge uses bcrypt for password hashing. You can generate a hash for your desired password using a 3rd party tool like [bcrypt-generator.com](https://bcrypt-generator.com/). Use a cost (rounds) of 11 if prompted.

2.  **Create the User File**:
    Create a new file named `username.json` (replace `username` with your desired login name) in the users directory using [SFTP](/manage/files). Use the following template:

    ```json
    {
      "password": "YOUR_BCRYPT_HASH_HERE",
      "log": false,
      "sessions": {},
      "clientSettings": {},
      "networks": []
    }
    ```

3.  **Restart the Pod**:
    For the new user file to be recognized, you must restart your pod from the PikaPods control panel.

### Editing User Configuration

You can edit existing user settings by modifying their corresponding `.json` file via [SFTP](/manage/files). Most changes (except for the password, if updated via the UI) require a server restart to take effect.

For more details, refer to the [official documentation](https://thelounge.chat/docs/users#editing-a-user-configuration-file).
