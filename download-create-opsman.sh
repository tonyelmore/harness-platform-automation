docker run -it --rm \
  -v $PWD:/workspace \
  -v $PWD:/workspace/config \
  -v $PWD:/workspace/state \
  -w /workspace \
  --env-file create-vm.vars \
  -e STATE_FILE=telmore/environments/aws/sbx/state/state.yml \
  -e OPSMAN_CONFIG_FILE=telmore/environments/aws/sbx/config-director/templates/opsman.yml \
  platform-automation-toolkit-image:${TOOLKIT_IMAGE_VERSION} \
    /bin/bash ./harness-platform-automation/platform-automation-tasks/tasks/create-vm.sh
