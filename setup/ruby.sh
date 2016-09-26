#!/usr/bin/env bash
set -eo pipefail

gem install serverspec \
  maid chunky_png whenever \
  exifr rsense rails_best_practices \
  awesome_print

berks configure
