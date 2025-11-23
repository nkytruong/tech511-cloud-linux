# Managing File Permissions

## Does being the owner of a file mean you have full permissions on that file? Explain.
* No, the owner's actual read (r), write (w), and execute (x) permissions depend on the current settings for the user (owner) category.
* The owner can change the file permissions using `chmod`, and ownership using `chown`

## If you give permissions to the User entity, what does this mean?
* The User entity refers to the owner of the file
* Permissions assigned to the User apply **only to the person who owns the file**
* In the example below, bob (the owner) can read and write; no one else can access it
  ```
  -rw------- 1 bob staff 2048 Oct 14 10:00 secret.txt
  ```

## If you give permissions to the Group entity, what does this mean?
* The Group entity defines permissions for users who belong to the same group as the file's group owner
* If a user is not the owner but is a member of the file's group, they get the Group permissions
* In the example below, all members of the developers group can read the file (but not write), while Bob (the owner) can read and write
  ```
  -rw-r----- 1 bob developers 4096 Oct 14 10:00 code.c
  ```

## If you give permissions to the Other entity, what does this mean?
* The Other entity defines permissions for everyone else - users who are neither the file's owner nor members of the group
* In the example below, anyone on the system (not Bob, not in group *staff*) can read this file, but cannot write to it
  ```
  -rw-r--r-- 1 bob staff 1024 Oct 14 10:00 hello.txt
  ```


## You give the following permissions to a file: User permissions are read-only, Group permissions are read and write, Other permissions are read, write and execute. You are logged in as the user which is owner of the file. What permissions will you have on this file? Explain.
* You'll only have read-only access
* Even though others have more permissions, your access is determined soley by the "user" permissions

## Here is one line from the ls -l. Work everything you can about permissions on this file or directory.
```
-rwxr-xr-- 1 tcboony staff  123 Nov 25 18:36 keeprunning.sh
```

* The first character `-` means it is a regular file (not a directory which would start with `d`)
* rwx - User (tcboony) can read, write, and execute the file
* r-x - Group (staff) can read and execute, but not write (modify the file)
* r-- - Others can only read the file
