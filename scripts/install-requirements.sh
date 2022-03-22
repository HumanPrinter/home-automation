#!/bin/bash

echo "Installing Terraform apt"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update > /dev/null && sudo apt-get install terraform unzip

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Install PIP dependencies using pip3"
python3 -m pip install --upgrade -r $script_dir/../requirements.txt > /dev/null

echo "Initialize pre-commit"
pre-commit install

echo "Ensuring all pre-commit plugins are up to date"
pre-commit autoupdate

echo "Install TFSec"
VERSION=v1.13.0
OS=linux
ARCH=amd64
sudo curl -L https://github.com/aquasecurity/tfsec/releases/download/$VERSION/tfsec-$OS-$ARCH -o /usr/local/bin/tfsec
sudo chmod +x /usr/local/bin/tfsec

echo "Install TFLint"
curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

echo "Initialize TFLint for all Terraform projects..."
current_dir=$(pwd)
work_dir=$script_dir/..

for project in terraform/*/
do
  project=$(basename $project)
  [[ $project =~ ^(shared)$ ]] && continue
  cd $work_dir/terraform/$project
  tflint --init
done

cd $current_dir
