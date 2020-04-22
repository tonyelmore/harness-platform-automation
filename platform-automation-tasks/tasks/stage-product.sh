#!/usr/bin/env bash
# code_snippet stage-product-script start bash

cat /var/version && echo ""
set -eux

product_name="$(om product-metadata \
  --product-path product/*.pivotal \
  --product-name)"
product_version="$(om product-metadata \
  --product-path product/*.pivotal \
  --product-version)"

om --env env/"${ENV_FILE}" stage-product \
   --product-name "$product_name" \
   --product-version "$product_version"
# code_snippet stage-product-script end
