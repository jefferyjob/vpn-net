#!/bin/bash

set -e

OVPN_USER_KEYS_DIR=/etc/openvpn/client/keys
EASY_RSA_DIR=/etc/openvpn/easy-rsa/
PKI_DIR=$EASY_RSA_DIR/pki

for user in "$@"
do
  if [ -d "$OVPN_USER_KEYS_DIR/$user" ]; then
    rm -rf $OVPN_USER_KEYS_DIR/$user
    rm -rf  $PKI_DIR/reqs/$user.req
    sed -i '/'"$user"'/d' $PKI_DIR/index.txt
  fi
  cd $EASY_RSA_DIR
  # 生成客户端SSL证书文件
  ./easyrsa build-client-full $user nopass
  # 整理下生成的文件
  mkdir -p  $OVPN_USER_KEYS_DIR/$user
  cp $PKI_DIR/ca.crt $OVPN_USER_KEYS_DIR/$user/   # CA 根证书
  cp $PKI_DIR/issued/$user.crt $OVPN_USER_KEYS_DIR/$user/   # 客户端证书
  cp $PKI_DIR/private/$user.key $OVPN_USER_KEYS_DIR/$user/  # 客户端证书密钥
  cp /etc/openvpn/client/sample.ovpn $OVPN_USER_KEYS_DIR/$user/$user.ovpn # 客户端配置文件
  sed -i 's/client.crt/'"$user".crt'/g' $OVPN_USER_KEYS_DIR/$user/$user.ovpn
  sed -i 's/client.key/'"$user".key'/g' $OVPN_USER_KEYS_DIR/$user/$user.ovpn
  cp $EASY_RSA_DIR/ta.key $OVPN_USER_KEYS_DIR/$user/ta.key  # auth-tls 文件
  cd $OVPN_USER_KEYS_DIR
  zip -r $user.zip $user
done
exit 0