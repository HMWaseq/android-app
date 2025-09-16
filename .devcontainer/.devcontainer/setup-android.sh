#!/usr/bin/env bash
set -eux

SDK_ROOT="/opt/android-sdk"
mkdir -p "$SDK_ROOT/cmdline-tools"

curl -fsSL https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -o /tmp/cmdtools.zip
unzip -q /tmp/cmdtools.zip -d /tmp/cmdtools
mv /tmp/cmdtools/cmdline-tools "$SDK_ROOT/cmdline-tools/latest"
rm -rf /tmp/cmdtools /tmp/cmdtools.zip

yes | $SDK_ROOT/cmdline-tools/latest/bin/sdkmanager --licenses

$SDK_ROOT/cmdline-tools/latest/bin/sdkmanager \
  "platform-tools" \
  "build-tools;34.0.0" \
  "platforms;android-34" \
  "cmdline-tools;latest"
