#!/bin/sh -l

set -e

GITHUB_TOKEN="$INPUT_TOKEN"
export GITHUB_TOKEN

PREVIOUS_RELEASE_TAG_FLAG=
[ -n "$INPUT_PREVIOUS_RELEASE_TAG" ] && PREVIOUS_RELEASE_TAG_FLAG=" --previous-release-tag=$INPUT_PREVIOUS_RELEASE_TAG "

PREVIOUS_RELEASE_VERSION_FLAG=
[ -n "$INPUT_PREVIOUS_RELEASE_VERSION" ] && PREVIOUS_RELEASE_VERSION_FLAG=" --previous-release-tag=$INPUT_PREVIOUS_RELEASE_VERSION "

afr="$(echo "$INPUT_ALLOW_FIRST_RELEASE" | tr '[:upper:]' '[:lower:]')"
[ "true" = "$afr" ] && ALLOW_FIRST_RELEASE_FLAG="--allow-first-release"

cmd="semver-next $GITHUB_REPOSITORY
  --max-bump $INPUT_MAX_BUMP
  --min-bump $INPUT_MIN_BUMP
  $PREVIOUS_RELEASE_TAG_FLAG
  $PREVIOUS_RELEASE_VERSION_FLAG
  $ALLOW_FIRST_RELEASE_FLAG
  "

got="$($cmd)"
echo "::set-output name=next_version::$got"
