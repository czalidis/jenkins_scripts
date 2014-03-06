#!/bin/bash

export REPOS_FILE=~/repos_data/repos.yaml
export PUBLIC_DIR=~/public_html/api

source /opt/ros/hydro/setup.bash

../jenkins_scripts/generate_doc.py . $WORKSPACE/doc 
