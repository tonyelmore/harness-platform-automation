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
  platform-automation-toolkit-image:${TOOLKIT_IMAGE_VERSION} \
    /bin/bash $SCRIPT_REPO/platform-automation-tasks/tasks/configure-authentication.sh
