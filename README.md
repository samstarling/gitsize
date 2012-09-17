gitsize
=======

What is this?
-------------

It's a web-app that scans a Github repository for
files that are over a certain size, and flags them
up. It uses ActiveRecord, so it doesn't have to keep
hammering the Github API.

For example, it could flag up all CSS files in a 
directory that are over 10kb in size.

Limitations
-----------

* It only works on Github-hosted repositories
* It can't recursively scan through directories

TODO
----

* Show a histogram of sizes of a particular file, so trends can be seen
* Scan multiple directories, with different limits for each filetype
