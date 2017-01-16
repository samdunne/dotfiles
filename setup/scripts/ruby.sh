#!/usr/bin/env bash
set -eo pipefail

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -sSL https://get.rvm.io | bash -s stable --ruby --with-gems="bundler serverspec rails_best_practises awesome_print knife-block"

bundle config build.nokogiri --use-system-libraries