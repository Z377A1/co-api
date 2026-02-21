#!/bin/bash
# update-submodules.sh

echo "🔄 Updating all submodules to latest main branch..."

# Initialize submodules if not done
git submodule update --init --recursive

# Update each submodule
git submodule foreach '
    echo "📦 Updating $name"
    git checkout main
    git pull origin main
'

echo "✅ All submodules updated!"