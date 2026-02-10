#!/bin/bash

TEMPLATE="template"
TARGET="main.cpp"

if [[ ! -f "$TEMPLATE" ]]; then
	echo "Error: Reference file '$TEMPLATE' not found."
	exit 1
fi

if [[ ! -f "$TARGET" ]]; then
	cp "$TEMPLATE" "$TARGET"
	echo "Created $TARGET from template."
	exit 0
fi

if cmp -s "$TEMPLATE" "$TARGET"; then
	echo "No changes detected. '$TARGET' is already up to date."
else
	echo "Warning: '$TARGET' differs from the template."
	
	read -p "Do you want to overwrite '$TARGET' with the template? (y/N): " choice
	
	case "$choice" in 
		[yY][eE][sS]|[yY]) 
			cp "$TEMPLATE" "$TARGET"
			echo "File overwritten successfully."
			;;
		*)
			echo "Operation cancelled. No changes made."
			;;
	esac
fi