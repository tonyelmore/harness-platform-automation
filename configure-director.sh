docker run -it --rm \
  -v $PWD:/workspace \
  -v $PWD/$SCRIPT_REPO:/automation \
  -w /workspace \
  --env-file $SCRIPT_REPO/vars/director-ops-files.yml \
  --env-file $SCRIPT_REPO/vars/configure-director.yml \
  -e PCF_opsman_password="${PCF_opsman_password}" \
  -e PCF_opsman_decryption_passphrase="${PCF_opsman_decryption_passphrase}" \
  -e PCF_ops_manager_ssh_public_key="${PCF_ops_manager_ssh_public_key}" \
  -e PCF_ops_manager_ssh_private_key="${PCF_ops_manager_ssh_private_key}" \
  -e PCF_ops_manager_iam_user_access_key="${PCF_ops_manager_iam_user_access_key}" \
  -e PCF_ops_manager_iam_user_secret_key="${PCF_ops_manager_iam_user_secret_key}" \
  -e OM_TARGET=${OM_TARGET} \
  -e OM_USERNAME=${OM_USERNAME} \
  -e OM_PASSWORD=${OM_PASSWORD} \
  -e OM_SKIP_SSL_VALIDATION=true \
  -e INTERPOLATION_PATH=$config_repo/environments/$iaas/$foundation/config-director/secrets \
  -e DIRECTOR_CONFIG_FILE=$config_repo/environments/$iaas/$foundation/config-director/templates/director.yml \
  platform-automation-toolkit-image:${TOOLKIT_IMAGE_VERSION} \
    /bin/bash $SCRIPT_REPO/platform-automation-tasks/tasks/configure-director.sh
