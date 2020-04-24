echo "Starting docker run"
echo $SCRIPT_REPO
echo $OM_TARGET
echo $OM_USERNAME
echo $OM_PASSWORD
echo $iaas
echo $foundation
echo $PCF_opsman_password
echo $PCF_opsman_decryption_passphrase
echo $PCF_ops_manager_iam_user_access_key
echo $PCF_ops_manager_iam_user_secret_key
echo $PCF_ops_manager_ssh_public_key
echo $PCF_ops_manager_ssh_private_key
echo ${TOOLKIT_IMAGE_VERSION}

docker run -it --rm \
  -v $PWD:/workspace \
  -v $PWD/$SCRIPT_REPO:/automation \
  -w /workspace \
  --env-file $SCRIPT_REPO/vars/config-auth.yml \
  -e OM_TARGET=${OM_TARGET} \
  -e OM_USERNAME=${OM_USERNAME} \
  -e OM_PASSWORD=${OM_PASSWORD} \
  -e OM_SKIP_SSL_VALIDATION=true \
  -e AUTH_CONFIG_FILE=$config_repo/environments/$iaas/$foundation/config-director/secrets/auth.yml \
  -e PCF_opsman_password=${PCF_opsman_password} \
  -e PCF_opsman_decryption_passphrase=${PCF_opsman_decryption_passphrase} \
  -e PCF_ops_manager_iam_user_access_key=${PCF_ops_manager_iam_user_access_key} \
  -e PCF_ops_manager_iam_user_secret_key=${PCF_ops_manager_iam_user_secret_key} \
  -e PCF_ops_manager_ssh_public_key=${PCF_ops_manager_ssh_public_key} \
  -e PCF_ops_manager_ssh_private_key=${PCF_ops_manager_ssh_private_key} \
  platform-automation-toolkit-image:${TOOLKIT_IMAGE_VERSION} \
    /bin/bash $SCRIPT_REPO/platform-automation-tasks/tasks/configure-authentication.sh
