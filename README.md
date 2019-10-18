# DCore Homebrew Formula [![Build Status](https://travis-ci.org/DECENTfoundation/homebrew-DCore.svg?branch=master)](https://travis-ci.org/DECENTfoundation/homebrew-DCore)

This [Homebrew](http://brew.sh) formula installs the [DCore](https://decent.ch/dcore) node to your system. Just execute in console:

    brew tap decentfoundation/DCore
    brew install dcore

## Homebrew bottle update workflow

* adjust `tag` and `revision` in dcore.rb formula file and push the commit
* create and push release tag (e.g. 1.4.0)
* record `sha256` hashes from Travis build logs
* adjust bottle `sha256` hashes in dcore.rb formula file
* push the commit (use `[travis skip]` in subject) 
