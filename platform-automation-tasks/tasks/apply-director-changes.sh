#!/usr/bin/env bash
# code_snippet apply-director-changes-script start bash

cat /var/version && echo ""
set -eux
om --env env/"${ENV_FILE}" apply-changes \
   --skip-deploy-products --reattach
# code_snippet apply-director-changes-script end
