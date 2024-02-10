#!/usr/bin/env bash

set -euo pipefail

MARKETNAME=""
CODENAMES="${DEVICE}"
GH_REPO=""
SE_STATUS="Enforcing"

case "${DEVICE}" in
    "viva")
        MARKETNAME="Redmi Note 11 Pro (4G)"
        CODENAMES="viva,vida"
        GH_REPO="xiaomi-mt6781-devs/android_device_xiaomi_viva"
        ;;
    "oxygen")
        MARKETNAME="Mi Max 2 (4g)"
        CODENAMES="oxygen"
        GH_REPO="sounddrill31/android_device_xiaomi_oxygen-3"
esac

echo "LineageOS ${LINEAGE_VER} for ${MARKETNAME} (${CODENAMES}) ${BUILD_DATE}"

echo "## Changelog"
echo ""
if [ "$INIT" == "true" ]; then
    echo "* First build"
else
    # Todo: Implement changelog generation
    echo "*"
fi
echo ""
echo "## Bugs"
echo ""
echo "No known bugs"
echo ""

echo "## Notes"
echo ""
echo "* SELinux is **${SE_STATUS}**"
echo "* Only LineageOS Recovery is supported"
echo "* Custom kernels are **NOT** supported"
echo "* OTA Updates are suppored"
echo ""

echo "## Credits"
echo ""
echo "* [Contributors](https://github.com/${GH_REPO}/contributors)"
echo ""

echo "## Checksums (SHA256)"
pushd "upload" >/dev/null
cat << EOF
\`\`\`
$(sha256sum *)
\`\`\`
EOF
popd >/dev/null

