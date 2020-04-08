#!/usr/bin/env bash

current_dir=$(cd "$(dirname "$0")" && pwd)
mc_config_dir="${HOME}/.config/mc"

mkdir -p "${mc_config_dir}"

for file in ini hotlist panels.ini; do
    cp -f "${current_dir}/${file}" "${mc_config_dir}/${file}"
done
