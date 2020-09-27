#!/bin/bash
apt update && apt install -y wget unzip zip
wget -qq $(wget -qO- https://www.minecraft.net/en-us/download/server/bedrock | grep bin-linux | sed 's| class="btn btn-disabled-outline mt-4 downloadlink" role="button" data-platform="serverBedrockLinux" tabindex="-1">Download </a>||g' | sed 's|<a href=||g' | sed 's| ||g' | sed 's|"||g') -O /tmp/bds.zip
echo "wget status: $?"
unzip -o /tmp/bds.zip -d opt/BDS-Common/
cd opt/*/
rm -rf server.properties worlds permissions.json whitelist.json placehold
ln -s /etc/BDS-Common/server.properties server.properties
ln -s /etc/BDS-Common/worlds worlds
ln -s /etc/BDS-Common/permissions.json permissions.json
ln -s /etc/BDS-Common/whitelist.json whitelist.json