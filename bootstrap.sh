#!/bin/bash
set -e

# Download osx-cookbook
if [ ! -d "~/osx-cookbook/" ]; then
  echo "Download osx-cookbook"
  git clone https://github.com/SammyLin/osx-cookbook.git ~/osx-cookbook
  cd ~/osx-cookbook
else
  cd ~/osx-cookbook
  echo "Directory ~/osx-cookbook already exists"
fi