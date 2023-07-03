#!/usr/bin/env bash

yabai -m query --spaces --display | \
    jq -re 'map(select(."is-native-fullscreen" == false)) | length > 1' \
    && yabai -m query --spaces | \
    jq -re 'map(select(."windows" == [] and ."has-focus" == false).index) | reverse | .[] ' | \
    xargs -I % sh -c 'yabai -m space % --destroy' && \
    osascript -e 'tell application id "tracesOf.Uebersicht" to refresh widget id "simple-bar-index-jsx"'
