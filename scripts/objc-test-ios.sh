#!/bin/bash
# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#
# Script used to run iOS tests.
# If no arguments are passed to the script, it will only compile
# the RNTester.
# If the script is called with a single argument "test", we'll
# also run the RNTester integration test (needs JS and packager):
# ./objc-test-ios.sh test

set -ex

SCRIPTS=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ROOT=$(dirname "$SCRIPTS")

cd "$ROOT"

# shellcheck disable=SC1091
source "scripts/.tests.env"

export TEST_NAME="iOS"
export SCHEME="RNTester"
export SDK="iphonesimulator"
export DESTINATION="platform=iOS Simulator,name=${IOS_DEVICE},OS=${IOS_TARGET_OS}"

# If there's a "test" argument, pass it to the test script.
./scripts/objc-test.sh $1
