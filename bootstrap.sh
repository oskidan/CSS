#!/usr/bin/env bash

# Installs the prerequisites. They are requried for unit testing.

npm install playwright

# To install npx run the following command:
# ```
# sudo npm install -g npx
# ```
npx playwright install chromium