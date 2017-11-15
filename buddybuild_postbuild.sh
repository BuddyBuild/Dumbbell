#!/bin/bash

set -ueo pipefail

chruby 2.3.1

bundle install
bundle exec script/release.rb
