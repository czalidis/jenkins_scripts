#!/bin/bash

REPO_DIR=upstream
export REPO_NAME="$(git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//')"
export REPOS_FILE=$JENKINS_HOME/repos_data/repos.yaml
export PUBLIC_DIR=$JENKINS_HOME/public_html/api

mkdir $REPO_DIR

find . -maxdepth 1 -mindepth 1 -not -name $JENKINS_SCRIPTS -not -name $REPO_DIR -exec mv '{}' $REPO_DIR \;

source /opt/ros/hydro/setup.bash
$WORKSPACE/jenkins_scripts/generate_doc.py $REPO_DIR $WORKSPACE/doc 
