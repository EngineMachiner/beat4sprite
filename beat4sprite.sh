#!/bin/bash
set -e

FALLBACK="Themes/_fallback";         MODULES="Modules"

# Check modules folder

if [ -d "Appearance" ]; then

    FALLBACK="Appearance/$FALLBACK";        MODULES="$FALLBACK/$MODULES"

fi

SCRIPTS="$FALLBACK/Scripts"


# Clone repository.

REPOSITORY="https://github.com/EngineMachiner/beat4sprite.git"

git clone "$REPOSITORY" "$MODULES/beat4sprite"


# Add to init script.

echo "Checking initialization script...";           TAPLUA="$SCRIPTS/tapLua.lua"

echo "LoadModule(\"beat4sprite/beat4sprite.lua\")" | { grep -xFv -f "$TAPLUA" >> "$TAPLUA" || true; }


# Clone collections.

function cloneAnimations {

    curl -o beat4sprite-Animations.sh https://raw.githubusercontent.com/EngineMachiner/beat4sprite-Animations/refs/heads/main/setup.sh
    
    ./beat4sprite-Animations.sh;  rm beat4sprite-Animations.sh

}


echo "Clone animations?"

select OPTION in "Yes" "No"; do break; done

if [ "$OPTION" == "Yes" ]; then cloneAnimations; fi
