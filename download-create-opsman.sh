docker run -it --rm \
  -v $PWD:/workspace \
  -v $PWD/harness-platform-automation:/automation \
  -w /workspace \
  --env-file harness-platform-automation/vars/download-create-opsman.yml \
  -e STATE_FILE=telmore/environments/aws/sbx/state/state.yml \
  -e OPSMAN_CONFIG_FILE=telmore/environments/aws/sbx/config-director/templates/opsman.yml \
  -e REPO=harness-platform-automation \
  platform-automation-toolkit-image:${TOOLKIT_IMAGE_VERSION} \
    /bin/bash ./harness-platform-automation/platform-automation-tasks/tasks/create-vm.sh
