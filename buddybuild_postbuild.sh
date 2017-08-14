#!/bin/bash

mkdir buddybuild_artifacts

swiftlint --reporter junit | tee buddybuild_artifacts/swiftlint.xml || true
