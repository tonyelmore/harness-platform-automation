docker run -it --rm \
  -v $PWD:/workspace \
  -v $PWD/$SCRIPT_REPO:/automation \
  -w /workspace \
  --env-file $SCRIPT_REPO/vars/download-create-opsman.yml \
  -e STATE_FILE=$config_repo/environments/$iaas/$foundation/state/state.yml \
  -e OPSMAN_CONFIG_FILE=$config_repo/environments/$iaas/$foundation/config-director/templates/opsman.yml \
  -e SECRET_CONFIG_FILE=$config_repo/environments/$iaas/$foundation/config-director/secrets/director.yml \
  -e SCRIPT_REPO=$SCRIPT_REPO \
  -e PCF_opsman_password=${PCF_opsman_password} \
  -e PCF_opsman_decryption_passphrase=${PCF_opsman_decryption_passphrase} \
  -e PCF_ops_manager_iam_user_access_key=${PCF_ops_manager_iam_user_access_key} \
  -e PCF_ops_manager_iam_user_secret_key=${PCF_ops_manager_iam_user_secret_key} \
  -e PCF_ops_manager_ssh_public_key=${PCF_ops_manager_ssh_public_key} \
  -e PCF_ops_manager_ssh_private_key=${PCF_ops_manager_ssh_private_key} \
  platform-automation-toolkit-image:${TOOLKIT_IMAGE_VERSION} \
    /bin/bash $SCRIPT_REPO/platform-automation-tasks/tasks/create-vm.sh
