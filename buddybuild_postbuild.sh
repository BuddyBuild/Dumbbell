#!/bin/bash

mkdir buddybuild_artifacts

swiftlint --reporter junit > buddybuild_artifacts/swiftlint.xml || true
