# Managing File Ownership

- [Managing File Ownership](#managing-file-ownership)
  - [Why is Managing File Ownership important?](#why-is-managing-file-ownership-important)
  - [What is the command to view file ownership?](#what-is-the-command-to-view-file-ownership)
  - [What permissions are set when a user creates a file or directory? Who does file or directory belong to?](#what-permissions-are-set-when-a-user-creates-a-file-or-directory-who-does-file-or-directory-belong-to)
  - [Why does the owner, by default, not receive X permissions when they create a file?](#why-does-the-owner-by-default-not-receive-x-permissions-when-they-create-a-file)
  - [What command is used to change the owner of a file or directory?](#what-command-is-used-to-change-the-owner-of-a-file-or-directory)


## Why is Managing File Ownership important?
* Security & least privilege: Ownership + permissions determine which users/processes can read, write or execute files. Wrong ownership can let attackers or unprivileged processes access sensitive data (or conversely prevent legitimate services from working).
* Service/functionality: Many services require files to be owned by a specific user (eg, web server content owned by www-data or nginx, application processes writing logs must own or have write permission).
Misowned files commonly cause 103 errors, logging failures, failed deploys.
* Accountability & forensics: Owner information helps you determine which user or process created or modified files during incident investigation.
* Multi-user & shared mounts: On NFS/EFS/FS or container volumes, ownership and UID/GID mapping decide who can access shared files -common cause of support tickets (e.g., root squash, numeric UID mismatches in containers).
* Automation & CI/CD: Cl jobs sometimes create files as root or Cl user; the app user may then fail to access those files in production. Proper ownership avoids brittle post-deploy

## What is the command to view file ownership?
* `ls -l` - quick, human-readable listing (shows owner and group).
* `ls -ln` — numeric uid/gid (useful when user/group name not available).
* `namei -l /path/to/file` - shows owner/perm of each path component (handy when you can't cd to a directory because a parent directory lacks x/traverse

## What permissions are set when a user creates a file or directory? Who does file or directory belong to?
* Unix uses default modes that are modified by the process umask
* Conceptual defaults:
  * New files start with mode 666 (rw-rw-rw-) before umask is applied.
  * New directories start with mode 777 (rwxrwxrwx) before umask is applied.
  * Then umask subtracts bits (it's a mask of bits to remove)

Who does the file/directory belong to?
* File owner = the user who created the file (UID of the creating process).
* File group = the creating process's effective primary group (usually the user's primary group), unless special things are in place

## Why does the owner, by default, not receive X permissions when they create a file?
* Because execute is not meaningful/safe for arbitrary new regular files. The kernel and userland adopt the convention that:
  * default file mode is 666 (rw for owner-/group/other) without execute bits
  * the execute bit is reserved and MUST be set by the user or build/install tools
  * this is because executing some random file is extremely unsafe


## What command is used to change the owner of a file or directory?
* `chown` changes owner and optionally group
* `chgrp` changes only the group