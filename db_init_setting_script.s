#!/bin/bash

echo "== 시작: db_init_setting_script.sh =="

sleep 5
# 1. system 계정으로 memento 사용자 생성 및 권한 부여
echo "▶️ 사용자 memento 생성 및 권한 부여"
sqlplus -s system/oracle <<EOF
WHENEVER SQLERROR EXIT SQL.SQLCODE
CREATE USER memento IDENTIFIED BY memento;
grant connect,resource to memento;
EXIT
EOF

# 2. memento 계정으로 테이블 생성 SQL 실행
echo "▶️ memento 계정으로 테이블 생성 시작"
sqlplus -s memento/memento @/docker-entrypoint-initdb.d/table_create.sql

echo "✅ 완료: db_init_setting_script.sh"
