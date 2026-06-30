---
title: Forgejo
layout: page
parent: App Notes
---
[Forgejo](https://forgejo.org/) is a self-hosted, community-driven Git service (a Gitea fork) with a web UI, issues, pull requests, and CI via Forgejo Actions. Full documentation is in the [official Forgejo docs](https://forgejo.org/docs/).

## Git over HTTPS only

PikaPods exposes a single **HTTPS** port per pod on its shared infrastructure, so the separate SSH port a Git server would normally listen on can't be reached from the outside. As a result, **SSH access is not available** — this applies to all Git-based apps on PikaPods (Forgejo and Gitea alike). The SSH clone URL shown in the web UI won't work; ignore it.

All Git operations work over HTTPS instead. Clone, pull, and push against your pod's HTTPS URL:

```
git clone https://your-pod.pikapods.net/user/repo.git
```

Authenticate with your username and password, or — recommended — a **personal access token** created under _Settings > Applications_ in Forgejo. Use the token in place of your password when Git prompts for credentials.

There's an open discussion about SSH support on our feedback site: [Fix Gitea SSH](https://feedback.pikapods.com/posts/418/fix-gitea-ssh).
