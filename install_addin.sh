#!/usr/bin/env bash
set -eux;
PROJ="${1:-./}";
if [ "$PROJ" = 'space' ]; then (cd "$PROJ";ln -s configure.ac configure.in); fi;
# the prosqlite plugin lib directory must be removed?
if [ "$PROJ" = 'prosqlite' ]; then rm -rf "$PROJ/lib";fi;
swipl -g "pack_rebuild($PROJ)" -t halt;
find "$PROJ" -mindepth 1 -maxdepth 1 ! -name lib ! -name prolog ! -name pack.pl -exec rm -rf {} +;
find "$PROJ" -name .git -exec rm -rf {} +;
