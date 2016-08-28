#!/bin/bash

PHP_INSTALL_CMD="apache-version"

# This is an apache container, assume the user never wants to exit immediately.
# If a command isn't supplied, provide one to keep the container up.
if [ -z "$1" ]
then
  CONTAINER_CMD="tail -f /var/log/apache2/*"
fi

host=$(hostname)

if [ -z "$PHP_VERSION" ]
then
  echo "PHP version was not specified."
  echo "This container will stay up, but apache will not start until you select a version."
  echo " => run e.g. \"docker exec $host prophusion apache-version 7.0.0\""
fi

echo
echo
echo "To:"
echo "    Stop this container: \"docker stop $host\""
echo "    Select a PHP version: \"docker exec $host prophusion apache-version 7.0.0\""
echo
echo

. /prophusion-base-entrypoint.sh
