#!/bin/sh -l

set -e

GITHUB_TOKEN="$INPUT_TOKEN"
export GITHUB_TOKEN

cmd="semver-next $GITHUB_REPOSITORY --max-bump $INPUT_MAX_BUMP --min-bump $INPUT_MIN_BUMP"

got="$($cmd)"
echo "::set-output name=next_version::$got"
