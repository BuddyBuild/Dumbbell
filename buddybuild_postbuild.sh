#!/bin/bash

## Make sure the script exits as soon as an error occurs
## More info about this on this great blog post:
## https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -e

## Switch to a recent version of chruby
##
chruby 2.3.1
chruby

bundle install
bundle exec scripts/bump_spec_version.rb

