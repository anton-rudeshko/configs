#!/usr/bin/env bash

current_dir=$(cd "$(dirname "$0")" && pwd)

cp -f "${current_dir}/streamlinkrc" "${HOME}/.streamlinkrc"
