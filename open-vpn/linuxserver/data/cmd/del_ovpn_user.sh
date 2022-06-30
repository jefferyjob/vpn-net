#!/bin/bash

set -e
OVPN_USER_KEYS_DIR=/etc/openvpn/client/keys
EASY_RSA_DIR=/etc/openvpn/easy-rsa/
for user in "$@"
do
  cd $EASY_RSA_DIR
  echo -e 'yes\n' | ./easyrsa revoke $user
  ./easyrsa gen-crl
  # 吊销掉证书后清理客户端相关文件
  if [ -d "$OVPN_USER_KEYS_DIR/$user" ]; then
    rm -rf $OVPN_USER_KEYS_DIR/${user}*
  fi
  systemctl restart openvpn@server
done
exit 0