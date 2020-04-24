#!/usr/bin/env bash
# code_snippet configure-authentication-script start bash

cat /var/version && echo ""
set -eux

vars_files_args=("")
for vf in ${VARS_FILES}
do
  vars_files_args+=("--vars-file ${vf}")
done

f=interpolated_files/${AUTH_CONFIG_FILE}
mkdir -p "${f%/*}"
export OM_VARS_ENV=PCF
om interpolate -c ${AUTH_CONFIG_FILE} > $f


# ${vars_files_args[@] needs to be globbed to pass through properly
# shellcheck disable=SC2068
om configure-authentication \
   --config "interpolated_files/${AUTH_CONFIG_FILE}" \
   ${vars_files_args[@]}
# code_snippet configure-authentication-script end
