#!/usr/bin/env bash

set -e
cmd="$@"

# 仮想環境構築
pipenv run sync
source /django_app/.venv/bin/activate

# DB接続のチェック(DBコンテナ構築まで遅延する)
python manage.py check > /dev/null
STATUS_CODE=$?

until [ $STATUS_CODE = "0" ]; do
    python manage.py check 2>/dev/null
    STATUS_CODE=$?
    echo "STATUS_CODE is ""$STATUS_CODE"
    sleep 1
done

# Django Dev Server の起動
pipenv run migrate
exec $cmd
