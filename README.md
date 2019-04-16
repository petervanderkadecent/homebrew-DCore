# DCore Homebrew Formula

This [Homebrew](http://brew.sh) formula installs the [DCore](https://decent.ch/dcore) node to your system. Just execute in console:

    brew tap decentfoundation/DCore
    brew install DCore

## Homebrew bottle update workflow

* adjust `tag` and `revision` in DCore.rb formula file
* push the commit and record `sha256` hashes from build logs
* adjust bottle `sha256` hashes in formula file
* push the commit and add '[travis skip]' to subject
