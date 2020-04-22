docker run -it --rm \
  -v $PWD:/workspace \
  -v $PWD:/workspace/config \
  -v $PWD:/workspace/state \
  -w /workspace \
  --env-file create-vm.vars \
  -e STATE_FILE=telmore/environments/aws/sbx/state/state.yml \
  -e OPSMAN_CONFIG_FILE=telmore/environments/aws/sbx/config-director/templates/opsman.yml \
  platform-automation-image:${TOOLKIT_IMAGE_VERSION} \
    /bin/bash ./scripts/platform-automation-tasks/create-vm.sh
