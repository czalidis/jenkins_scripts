#!/bin/sh

PUBLIC_REPO=pandora_ros_pkgs
REPO_DIR=upstream
REPO_NAME="$(git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//')"  
AUTHOR_NAME="$(git show -s --format=%an)" 
AUTHOR_EMAIL="$(git show -s --format=%ae)"
AUTHOR_ID="$AUTHOR_NAME <$AUTHOR_EMAIL>"
COMMIT_MESSAGE="$(git show -s --format=%B HEAD)"

mkdir $REPO_DIR
find . -maxdepth 1 -mindepth 1 -not -name $JENKINS_SCRIPTS -not -name $REPO_DIR -exec mv '{}' $REPO_DIR \;

git clone git@github.com:pandora-auth-ros-pkg/$PUBLIC_REPO.git
cd $PUBLIC_REPO

rm -rf $REPO_NAME
mkdir $REPO_NAME
find $WORKSPACE/$REPO_DIR -maxdepth 1 -mindepth 1 -not -name .git -exec cp -r '{}' $REPO_NAME \;

git add -A
git commit --author="$AUTHOR_ID" -m "$COMMIT_MESSAGE"
git push origin hydro-devel
