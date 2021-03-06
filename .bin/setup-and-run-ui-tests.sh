#!/bin/bash
set -e # Exit with nonzero exit code if anything fails
TIMESTAMP=$(date +%s)
SHOP_SYSTEM="prestashop"
NGROK_SUBDOMAIN="${RANDOM}${TIMESTAMP}-${SHOP_SYSTEM}-${PRESTASHOP_VERSION}"
export NGROK_URL="http://${NGROK_SUBDOMAIN}.ngrok.io"

bash .bin/start-ngrok.sh SUBDOMAIN="${NGROK_SUBDOMAIN}"

#start shopsystem and demoshop
bash .bin/start-shopsystem.sh NGROK_URL="${NGROK_URL}" \
  SHOP_VERSION="${PRESTASHOP_VERSION}" \
  PHP_VERSION="${TRAVIS_PHP_VERSION}" \
  IS_LATEST_EXTENSION_RELEASE="${IS_LATEST_EXTENSION_RELEASE}" \
  LATEST_RELEASED_SHOP_EXTENSION_VERSION="${LATEST_RELEASED_SHOP_EXTENSION_VERSION}"

bash .bin/run-ui-tests.sh NGROK_URL="${NGROK_URL}" \
  SHOP_SYSTEM="${SHOP_SYSTEM}" \
  SHOP_VERSION="${PRESTASHOP_VERSION}" \
  GIT_BRANCH="${TRAVIS_BRANCH}" \
  TRAVIS_PULL_REQUEST="${TRAVIS_PULL_REQUEST}" \
  BROWSERSTACK_USER="${BROWSERSTACK_USER}" \
  BROWSERSTACK_ACCESS_KEY="${BROWSERSTACK_ACCESS_KEY}"
