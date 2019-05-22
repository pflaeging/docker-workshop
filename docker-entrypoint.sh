#! /bin/sh
set -e

# make passwd entry for arbitrary running user (openshift / kubernetes)
if ! whoami &> /dev/null; then
    if [ -w /etc/passwd ]; then
        echo "${USER_NAME:-app}:x:$(id -u):0:${USER_NAME:-app} user:/opt/app:/sbin/nologin" >> /etc/passwd
    fi
fi

export HOME=/opt/app

exec "$@"