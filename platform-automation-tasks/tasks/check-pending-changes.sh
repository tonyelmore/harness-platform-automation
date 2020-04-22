#!/usr/bin/env bash
# code_snippet check-pending-changes-script start bash

cat /var/version && echo ""
set -eux

if [ "$ALLOW_PENDING_CHANGES" == "false" ]; then
  export CHECK="--check"
else
  export CHECK=""
fi

om --env env/"${ENV_FILE}" pending-changes \
   ${CHECK}
# code_snippet check-pending-changes-script end
