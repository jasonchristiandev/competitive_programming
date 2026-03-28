#!/bin/bash

TEMPLATE="template"
TARGET="main.cpp"
BACKUP=".main.cpp"

if [[ ! -f "$TEMPLATE" ]]; then
	echo "Error: Reference file '$TEMPLATE' not found."
	exit 1
fi

if [[ ! -f "$TARGET" ]]; then
	cp "$BACKUP" "$TARGET"
	echo "Created $TARGET from template."
	exit 0
fi

if cmp -s "$TEMPLATE" "$TARGET"; then
	cp "$BACKUP" "$TARGET"
	echo "File recovered successfully."
else
	echo "Warning: '$TARGET' differs from the template."
	echo "Backup created at '$(cat .main.cpp.date)'."
	read -p "Do you want to overwrite '$TARGET' with the backup? (y/N): " choice
	
	case "$choice" in 
		[yY][eE][sS]|[yY]) 
			cp "$BACKUP" "$TARGET"
			echo "File overwritten successfully."
			;;
		*)
			echo "Operation cancelled. No changes made."
			;;
	esac
fi