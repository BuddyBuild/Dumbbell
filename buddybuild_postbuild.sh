#!/bin/bash

PODSPEC_PATH="$BUDDYBUILD_WORKSPACE/Dumbbell.podspec"

bundle install
bundle exec fastlane run version_bump_podspec path:$PODSPEC_PATH

VERSION=`bundle exec fastlane run version_get_podspec path:$PODSPEC_PATH`
echo $VERSION
