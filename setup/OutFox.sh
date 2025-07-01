#!/bin/bash
set -e

FALLBACK="Appearance/Themes/_fallback";         MODULES="Modules"

DIRECTORY="beat4sprite-OutFox"


# Check modules folder.

if [ -d "$FALLBACK/$MODULES" ]; then MODULES="$FALLBACK/$MODULES"; fi


# Clone repository.

REPOSITORY="https://github.com/EngineMachiner/beat4sprite-OutFox.git"

git clone "$REPOSITORY" "$DIRECTORY"


echo "Moving files...";             cp -r "$DIRECTORY/BGAnimations" "./"

cp -r "$DIRECTORY/Modules" "$MODULES"


rm -rf "$DIRECTORY"
