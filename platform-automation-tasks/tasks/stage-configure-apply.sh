#!/usr/bin/env bash
# code_snippet stage-configure-apply-script start bash

cat /var/version && echo ""
set -eux
platform-automation-tasks/tasks/check-pending-changes.sh
platform-automation-tasks/tasks/stage-product.sh
platform-automation-tasks/tasks/configure-product.sh

recreate_vms=""
if [ "${RECREATE}" == "true" ]; then
  recreate_vms="--recreate-vms"
fi

product_name="$(om product-metadata \
  --product-path product/*.pivotal \
  --product-name)"

om --env env/"${ENV_FILE}" \
   apply-changes \
   --product-name "$product_name" \
   ${recreate_vms}
# code_snippet stage-configure-apply-script end
