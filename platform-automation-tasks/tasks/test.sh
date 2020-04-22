#!/usr/bin/env bash
# code_snippet test-script start bash

echo "Platform Automation for PCF version:"
cat /var/version && echo ""

printf "\\np-automator version:"
p-automator -v

printf "\\nom version:"
om -v

set -eux
p-automator --help
om --help
{ echo "Successfully validated tasks and image!"; } 2> /dev/null
# code_snippet test-script end
