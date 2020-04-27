docker run -it --rm \
  -v $PWD:/workspace \
  -v $PWD/$SCRIPT_REPO:/automation \
  -w /workspace \
  --env-file $SCRIPT_REPO/vars/director-ops-files.yml \
  --env-file $SCRIPT_REPO/vars/configure-director.yml \
  -e OM_TARGET=${OM_TARGET} \
  -e OM_USERNAME=${OM_USERNAME} \
  -e OM_PASSWORD=${OM_PASSWORD} \
  -e OM_SKIP_SSL_VALIDATION=true \
  -e DIRECTOR_SECRETS=$config_repo/environments/$iaas/$foundation/config-director/secrets/director.yml \
  -e DIRECTOR_CONFIG_FILE=$config_repo/environments/$iaas/$foundation/config-director/templates/director.yml \
  platform-automation-toolkit-image:${TOOLKIT_IMAGE_VERSION} \
    /bin/bash $SCRIPT_REPO/platform-automation-tasks/tasks/configure-director.sh
