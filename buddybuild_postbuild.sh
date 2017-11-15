#!/bin/bash

## Make sure the script exits as soon as an error occurs
## More info about this on this great blog post:
## https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -e

if [[ ! "$BUDDYBUILD_BRANCH" =~ "auto-release" ]]; then
    echo "Branch is not master/auto-release, aborting!" >&2
    exit 1
fi

## Make sure we are on the proper branch
## Buddybuild checks out the HEAD commit, so when the build start,
## you're in "detached" mode ## https://www.git-tower.com/learn/git/faq/detached-head-when-checkout-commit
git checkout $BUDDYBUILD_BRANCH

## Switch to a recent version of chruby
## Multiple versions of ruby are pre-installed on your buddybuild VM
## Check our docs: https://docs.buddybuild.com/
chruby 2.3.1

## Install the ruby dependencies
bundle install

## Bump the current version of the spec using a tiny ruby script
## It uses cocoapods-core to manipulate the spec, it could have been
## hacked together using bash, script and sed but doing it that way
## is more future-proof (and cooler)
NEW_VERSION=`bundle exec scripts/bump_spec_version.rb`

git add Dumbbell.podspec.json
git commit -m "[skip ci] Release version $NEW_VERSION"
git tag "release/$NEW_VERSION"
# git push --tags

## Big thanks to Kyle Fuller who saved me the time to look for
## the token that cocoadocs uses. Turns out you just have to look into
## you ~/.netrc file. More info available in this blog post:
## https://fuller.li/posts/automated-cocoapods-releases-with-ci/
if [[ -z "${COCOAPODS_TRUNK_TOKEN}" ]]; then
    echo "COCOAPODS_TRUNK_TOKEN is not defined: not pushing to trunk." >&2
    exit 1
else
    echo "Releasing"
fi
