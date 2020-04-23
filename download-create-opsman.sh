docker run -it --rm \
  -v $PWD:/workspace \
  -v $PWD/$SCRIPT_REPO:/automation \
  -w /workspace \
  --env-file $SCRIPT_REPO/vars/download-create-opsman.yml \
  -e STATE_FILE=$config_repo/environments/$iaas/$foundation/state/state.yml \
  -e OPSMAN_CONFIG_FILE=$config_repo/environments/$iaas/$foundation/config-director/templates/opsman.yml \
  -e SECRET_CONFIG_FILE=$config_repo/environments/$iaas/$foundation/config-director/secrets/director.yml \
  -e SCRIPT_REPO=$SCRIPT_REPO \
  platform-automation-toolkit-image:${TOOLKIT_IMAGE_VERSION} \
    /bin/bash $SCRIPT_REPO/platform-automation-tasks/tasks/create-vm.sh
