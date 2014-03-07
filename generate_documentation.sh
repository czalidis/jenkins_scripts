#!/bin/bash

export REPOS_FILE=$JENKINS_HOME/repos_data/repos.yaml
export PUBLIC_DIR=$JENKINS_HOME/public_html/api

source /opt/ros/hydro/setup.bash

$WORKSPACE/jenkins_scripts/generate_doc.py $REPO_NAME $WORKSPACE/doc 
