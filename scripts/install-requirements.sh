#!/bin/bash

echo "Installing Terraform apt"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update > /dev/null && sudo apt-get install terraform unzip

echo "Install Ansible, Ansible-Lint, Yamllint using pip3"
python3 -m pip install ansible ansible-lint yamllint > /dev/null

echo "Install TFLint"
curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

echo "Initialize TFLint for all Terraform projects..."
current_dir=$(pwd)
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
work_dir=$script_dir/..

for project in terraform/*/
do
  project=$(basename $project)
  [[ $project =~ ^(shared)$ ]] && continue
  cd $work_dir/terraform/$project
  tflint --init
done

cd $current_dir
