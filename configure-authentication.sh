docker run -it --rm \
  -v $PWD:/workspace \
  -v $PWD/harness-platform-automation:/automation \
  -w /workspace \
  --env-file harness-platform-automation/vars/config-auth.yml \
  -e ENV_FILE=secrets/env.yml \
  -e AUTH_CONFIG_FILE=secrets/auth.yml \
  platform-automation-toolkit-image:${TOOLKIT_IMAGE_VERSION} \
    /bin/bash ./harness-platform-automation/platform-automation-tasks/tasks/configure-authentication.sh
