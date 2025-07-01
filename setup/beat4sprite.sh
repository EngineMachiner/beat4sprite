#!/bin/bash
set -e

FALLBACK="Appearance/Themes/_fallback";         SCRIPTS="$FALLBACK/Scripts"

MODULES="Modules"


# Check modules folder.

if [ -d "$FALLBACK/$MODULES" ]; then MODULES="$FALLBACK/$MODULES"; fi


# Clone repository.

REPOSITORY="https://github.com/EngineMachiner/beat4sprite.git"

git clone "$REPOSITORY" "$MODULES/beat4sprite"


# Add to init script.

echo "Checking initialization script...";           TAPLUA="$SCRIPTS/tapLua.lua"

echo "LoadModule(\"beat4sprite/beat4sprite.lua\")" | { grep -xFv -f "$TAPLUA" >> "$TAPLUA" || true; }


# Clone collections.

echo "Clone animations?"

select animations in "OutFox" "Exit" </dev/tty; do

    case $animations in

        "OutFox") ./OutFox.sh; break ;;

        "Exit") break ;;

    esac

done


echo "Done!"

