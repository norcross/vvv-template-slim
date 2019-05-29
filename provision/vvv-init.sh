#!/usr/bin/env bash
# Provision WordPress Stable

DOMAIN=`get_primary_host "${VVV_SITE_NAME}".test`
DOMAINS=`get_hosts "${DOMAIN}"`

# Nginx Logs
echo -e "\nCreating error log folder and files"
mkdir -p ${VVV_PATH_TO_SITE}/log
touch ${VVV_PATH_TO_SITE}/log/error.log
touch ${VVV_PATH_TO_SITE}/log/access.log
echo -e "\n Log file operations done.\n\n"


# Add my assets folder
if [[ ! -f "${VVV_PATH_TO_SITE}/assets" ]]; then

  echo "Creating assets folder..."

  # Create my MU plugins folder
  mkdir -p "${VVV_PATH_TO_SITE}/assets"

fi

cp -f "${VVV_PATH_TO_SITE}/provision/vvv-nginx.conf.tmpl" "${VVV_PATH_TO_SITE}/provision/vvv-nginx.conf"
sed -i "s#{{DOMAINS_HERE}}#${DOMAINS}#" "${VVV_PATH_TO_SITE}/provision/vvv-nginx.conf"
