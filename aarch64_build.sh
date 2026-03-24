#!/bin/bash

set -e

if [ -z "$PSDK_DIR" ]; then
    echo 'Не найдена переменная окружения `PSDK_DIR`, пожалуйста укажите в ней путь до директории с установленным Aurora PSDK';
    exit 1;
fi


CURRENT_DIR="$(pwd)";
TARGET=aarch64-unknown-linux-gnu

aurora_psdk="$PSDK_DIR/sdk-chroot"
PKG_VERSION="$(cargo pkgid | cut -d '#' -f 2)"

mkdir -p RPMS/

cross build --release --target $TARGET
# cargo generate-rpm -a aarch64 --target $TARGET -o RPMS/

# Копируем бинарь и собираем с помощью PSDK
cp target/$TARGET/release/{{project-name}} ./{{org_domain}}.{{project-name}}
$aurora_psdk mb2 --target AuroraOS-5.2.0.75-base-aarch64 build

# Удаляем артефакты сборки
rm ./{{org_domain}}.{{project-name}}
rm documentation.list

$aurora_psdk rpmsign-external sign -k $PSDK_DIR/../../certs/regular_key.pem -c $PSDK_DIR/../../certs/regular_cert.pem "$CURRENT_DIR/RPMS/{{org_domain}}.{{project-name}}-$PKG_VERSION-1.aarch64.rpm"
$aurora_psdk rpm-validator -p regular "$CURRENT_DIR/RPMS/{{org_domain}}.{{project-name}}-$PKG_VERSION-1.aarch64.rpm"
