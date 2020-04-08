#!/usr/bin/env bash

current_dir=$(cd "$(dirname "$0")" && pwd)
mpv_config_dir="${HOME}/.config/mpv"

mkdir -p "${mpv_config_dir}"

for file in mpv.conf input.conf scripts script-opts; do
    cp -rf "${current_dir}/${file}" "${mpv_config_dir}/${file}"
done
