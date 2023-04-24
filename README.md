# [Homebrew](https://brew.sh) Utilities

## Contents

This tap provides some commands:

* `brew cacheclean`

    Remove all downloads and their (broken) symlink files.

* `brew update-log`

    Do `brew update` and create a desktop notification if outdated packages exist.

* `brew update-schedule [<schedule>|stop]`

    Register `brew update-log` scheduler.
    Default schedule is `0 0 * * *` (cron format).

## Install

```
$ brew tap ichizok/utils
```

## License

[BSD 2-clause "Simplified" License](LICENSE.txt)
