#!/usr/bin/env bash
# code_snippet test-interpolate-script start bash

cat /var/version && echo ""
set -eux

vars_files_args=("")
for vf in ${VARS_FILES}
do
  vars_files_args+=("--vars-file ${vf}")
done

if [ "$SKIP_MISSING" == "true" ]; then
  export SKIP_MISSING="--skip-missing"
else
  export SKIP_MISSING=""
fi

# ${vars_files_args[@] needs to be globbed to pass through properly
# shellcheck disable=SC2068
om interpolate --config "config/$CONFIG_FILE" $SKIP_MISSING ${vars_files_args[@]}
# code_snippet test-interpolate-script end
