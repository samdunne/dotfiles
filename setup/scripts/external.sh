#!/usr/bin/env bash

if mount | grep "/Volumes/bumble-drive"; then
  /bin/bash /Volumes/bumble-drive/sensitive/setup

  if [[ $$WORK_COMPUTER = "y" ]] || [[ $$WORK_COMPUTER = "Y" ]]; then
    /bin/bash /Volumes/bumble-drive/work/setup
  fi
fi