#!/bin/bash

echo "Installing Terraform apt"
curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update > /dev/null && sudo apt-get install terraform unzip

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Install PIP dependencies using pip3"
python3 -m pip install --upgrade -r $script_dir/../requirements.txt > /dev/null

echo "Initialize pre-commit"
pre-commit install

echo "Ensuring all pre-commit plugins are up to date"
pre-commit autoupdate

echo "Install TFSec"
OS=linux
ARCH=amd64
LATEST_BINARY=$(curl -s https://api.github.com/repos/aquasecurity/tfsec/releases/latest | grep "browser_download_url.*tfsec-$OS-$ARCH\"" | cut -d : -f 2,3 | tr -d \")
sudo curl -L $LATEST_BINARY -o /usr/local/bin/tfsec
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
