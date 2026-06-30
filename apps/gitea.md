---
title: Gitea
layout: page
parent: App Notes
---
[Gitea](https://about.gitea.com/) is a lightweight, self-hosted Git service with a web UI, issues, pull requests, and a built-in package registry. Full documentation is in the [official Gitea docs](https://docs.gitea.com/).

## Git over HTTPS only

PikaPods exposes a single **HTTPS** port per pod on its shared infrastructure, so the separate SSH port a Git server would normally listen on can't be reached from the outside. As a result, **SSH access is not available** — this applies to all Git-based apps on PikaPods (Gitea and Forgejo alike). The SSH clone URL shown in the web UI won't work; ignore it.

All Git operations work over HTTPS instead. Clone, pull, and push against your pod's HTTPS URL:

```
git clone https://your-pod.pikapods.net/user/repo.git
```

Authenticate with your username and password, or — recommended — a **personal access token** created under _Settings > Applications_ in Gitea. Use the token in place of your password when Git prompts for credentials.

There's an open discussion about SSH support on our feedback site: [Fix Gitea SSH](https://feedback.pikapods.com/posts/418/fix-gitea-ssh).
