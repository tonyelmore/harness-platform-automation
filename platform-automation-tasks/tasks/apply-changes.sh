#!/usr/bin/env bash
# code_snippet apply-changes-script start bash

cat /var/version && echo ""
set -eux

recreate_vms=""
reattach="--reattach"
if [ "${RECREATE}" == "true" ]; then
  recreate_vms="--recreate-vms"
  reattach=""
fi

om --env env/"${ENV_FILE}" apply-changes \
  ${reattach} \
  ${recreate_vms}
# code_snippet apply-changes-script end
