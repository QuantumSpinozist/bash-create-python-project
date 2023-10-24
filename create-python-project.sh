#!/bin/bash

# Packages flag
# Initialize variables
packages=()

# Process command-line arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -p|--packages)
            shift 1
            while [[ "$1" != "" && ! "$1" =~ ^-.*$ ]]; do
                packages+=("$1")
                shift 1
            done
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done


# Project creation
# create and activate venv
python -m venv venv
source ./venv/bin/activate

# pip installs
pip install pytest

# Install the specified packages from the flag
for package in "${packages[@]}"; do
    pip install "$package"
done

pip freeze > requirements.txt


#create directories
mkdir code
mkdir tests

#create main file
printf "if __name__ ==  "__main__":\n    pass" > code/main.py
#create test file
printf "import pytest" > tests/test.py

# create local git repo
printf "venv/" > .gitignore

git init
git add .
git commit -m "initial commit"





