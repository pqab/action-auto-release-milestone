#!/bin/bash
set -u

# Check name is 'milestone'
if [ "$GITHUB_EVENT_NAME" != "milestone" ]; then
    echo "::debug::The event name was '$GITHUB_EVENT_NAME'"
    exit 0
fi

event_type=$(jq --raw-output .action $GITHUB_EVENT_PATH)

# Check milestone was closed
if [ $event_type != 'close' ]; then
    echo "::debug::The event type was '$event_type'"
    exit 0
fi

# Get milestone name
milestone_name=$(jq --raw-output .milestone.title $GITHUB_EVENT_PATH)

echo "::set-output name=release-url::http://example.com"

exit 0
