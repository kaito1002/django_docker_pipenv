#!/bin/bash

if [ "`which python`" != "/django_app/.venv/bin/python" ]; then
    source /django_app/.venv/bin/activate
fi
