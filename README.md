# DCore Homebrew Formula

This [Homebrew](http://brew.sh) formula installs the [DCore](https://decent.ch/dcore) node to your system. Just execute in console:

    brew tap decentfoundation/DCore
    brew install DCore

## Homebrew bottle update workflow

* adjust `tag` and `revision` in DCore.rb formula file
* push the commit and record `sha256` hashes from Travis build logs
* adjust bottle `sha256` hashes in DCore.rb formula file
* push the commit (use `[travis skip]` in subject) and create release tag
