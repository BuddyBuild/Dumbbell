#!/bin/bash

set -e

chruby 2.3.1

bundle install
bundle exec script/release.rb
