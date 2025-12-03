# Developer Environment Bootstrap Script

A fast, parallel, developer-focused setup script for Ubuntu.\
Installs essential apt packages and development Snap applications using:

-   Parallel installation (4 jobs at once)
-   Clean, atomic logging with no overlapping output
-   Automatic retry logic for Snap installs
-   Safe and repeatable bootstrap flow

## Features

### APT Packages Installed

-   curl
-   wget
-   git
-   make
-   jq
-   htop
-   vim

### Snap Packages Installed

-   VS Code
-   Sublime Text
-   Android Studio
-   Flutter
-   PyCharm Professional
-   WebStorm
-   GoLand
-   CLion
-   Postman
-   Docker
-   LXD
-   Discord

### Script Capabilities

-   Atomic, synchronized output via flock
-   Non-overlapping status lines
-   Retries (3 attempts per Snap)
-   Fast parallel installer

## Usage

``` bash
chmod +x dev-installer.sh
./dev-installer.sh
```

## Example Output

    [start] code
    [start] sublime-text
    [ ok ] code
    ...
    done

## Customization

Edit snaps, apt packages, retry count, or parallelism in the script.

## Requirements

-   Ubuntu 22.04 / 24.04 / 25.x
-   Snap enabled
-   Sudo privileges
