#!/usr/bin/env bash
# code_snippet configure-director-script start bash

cat /var/version && echo ""
set -eux

vars_files_args=("")
for vf in ${VARS_FILES}
do
  vars_files_args+=("--vars-file ${vf}")
done

ops_files_args=("")
for of in ${OPS_FILES}
do
  ops_files_args+=("--ops-file ${of}")
done

# f=interpolated_files/${DIRECTOR_SECRETS}
# mkdir -p "${f%/*}"
# export OM_VARS_ENV=PCF
# om interpolate -c ${DIRECTOR_SECRETS} > $f

files=$(find $INTERPOLATION_PATH -type f -name '*.yml' -follow)
export OM_VARS_ENV=PCF
for file in $files; do
  echo "interpolating files/$file"
  mkdir -p interpolated-files/"$(dirname "$file")"
  om interpolate -c ${file} > interpolated-files/$file
  # credhub interpolate --prefix "$PREFIX" \
  # --file files/"$file" > interpolated-files/"$file"
done

# ${vars_files_args[@] needs to be globbed to pass through properly
# ${ops_files_args[@] needs to be globbed to pass through properly
# shellcheck disable=SC2068
om configure-director \
   --config "${DIRECTOR_CONFIG_FILE}" \
   ${vars_files_args[@]} \
   ${ops_files_args[@]}
# code_snippet configure-director-script end
