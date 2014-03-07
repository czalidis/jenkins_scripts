#!/bin/bash

AUTHOR_NAME="$(git show -s --format=%an)" 
AUTHOR_EMAIL="$(git show -s --format=%ae)"
AUTHOR_ID="$AUTHOR_NAME <$AUTHOR_EMAIL>"
COMMIT_MESSAGE="$(git show -s --format=%B HEAD)"

echo $AUTHOR_ID
