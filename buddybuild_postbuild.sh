#!/bin/bash

set -e

chruby 2.3.1

bundle install
bundle exec scripts/release.rb
