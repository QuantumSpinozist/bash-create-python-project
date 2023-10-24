#!/bin/bash

#create and activate venv
python -m venv venv
source ./venv/bin/activate

# pip installs
pip install pytest

pip freeze > requirements.txt


#create directories
mkdir code
mkdir tests

#create main file
printf "if __name__ ==  "main.py":\n    pass" > code/main.py
#create test file
printf "import pytest" > tests/test.py

# create local git repo
'venv' > .gitignore

git init
git add .
git commit -m "initial commit"





