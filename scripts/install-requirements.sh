#!/bin/bash

echo "Installing Terraform apt"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update > /dev/null && sudo apt-get install terraform unzip

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Install PIP dependencies using pip3"
python3 -m pip install --upgrade -r $script_dir/../requirements.txt > /dev/null

echo "Initialize pre-commit"
pre-commit install --install-hooks

echo "Install TFSec"
OS=linux
ARCH=amd64
LATEST_VERSION=$(curl -s https://api.github.com/repos/aquasecurity/tfsec/releases/latest | grep "browser_download_url.*tfsec-$OS-$ARCH" | cut -d : -f 2,3 | tr -d \")

sudo curl -L $LATEST_VERSION -o /usr/local/bin/tfsec
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
