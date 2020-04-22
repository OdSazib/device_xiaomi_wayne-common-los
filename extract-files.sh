#!/bin/bash
#
# Copyright (C) 2018-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

export DEVICE_COMMON=sdm660-common
export DEVICE_SPECIFIED_COMMON_DEVICE="jasmine_sprout wayne"

./../../$VENDOR/$DEVICE_COMMON/extract-files.sh "$@"

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

AOSP_ROOT="$MY_DIR"/../../..
DEVICE_BLOB_ROOT="$AOSP_ROOT"/vendor/"$VENDOR"/"$DEVICE_SPECIFIED_COMMON"/proprietary

sed -i "s|/system/etc/firmware|/vendor/firmware\x0\x0\x0\x0|g" "$DEVICE_BLOB_ROOT"/vendor/lib64/libgf_ca.so
