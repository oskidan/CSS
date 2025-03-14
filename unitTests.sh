#!/usr/bin/env bash

# You can add `--verbose` flag to get more output if anything goes wrong.
swift run carton test --headless --environment browser $*
