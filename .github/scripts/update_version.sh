#!/bin/bash

# Define project file path
PROJECT_FILE="MediQuiz.xcodeproj/project.pbxproj"

# Ensure the file exists
if [ ! -f "$PROJECT_FILE" ]; then
  echo "Error: project.pbxproj not found at $PROJECT_FILE"
  exit 1
fi

# Get current values
CURRENT_VERSION=$(grep -o 'MARKETING_VERSION = [0-9.]*' "$PROJECT_FILE" | head -1 | awk '{print $3}')
CURRENT_BUILD=$(grep -o 'CURRENT_PROJECT_VERSION = [0-9]*' "$PROJECT_FILE" | head -1 | awk '{print $3}')

# Use input values or auto-increment build number
NEW_VERSION=${1:-$CURRENT_VERSION}

if [ $NEW_VERSION != $CURRENT_VERSION ]; then
  NEW_BUILD=1
else 
  NEW_BUILD=${2:-$((CURRENT_BUILD + 1))}
fi

# Update project.pbxproj
sed -i '' "s/MARKETING_VERSION = $CURRENT_VERSION/MARKETING_VERSION = $NEW_VERSION/g" "$PROJECT_FILE"
sed -i '' "s/CURRENT_PROJECT_VERSION = $CURRENT_BUILD/CURRENT_PROJECT_VERSION = $NEW_BUILD/g" "$PROJECT_FILE"

echo "✅ Updated project.pbxproj: Version=$NEW_VERSION, Build=$NEW_BUILD"
