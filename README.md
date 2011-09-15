# Missing Tomboy

Missing tomboy collects notes from your backup area and lets you restore or delete them.

## Requirements

Tomboy must be installed and you should have some files in the backup dir.

Ruby 1.9.x & Rubygems should be installed.

Install the following gems with command:
$ gem install sinatra rack-flash haml shotgun

Note: shotgun is optional, it helps if you have to make changes.

## Starting server

$ shotgun missing_tomboy.rb

Open browser at http://localhost:9393