#!/bin/bash

set -e # fails on error

THIS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function install {
    python -m pip install --upgrade pip
    python -m pip install --editable "$THIS_DIR/[dev]"
}

function build {
    python -m build --sdist --wheel "$THIS_DIR/"
}

function try-load-dotenv {
    if [ -f .env ]; then
        export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
    fi
}

function publish:test {
    try-load-dotenv
    twine upload --repository testpypi dist/* --username=__token__ --password="$TEST_PYPI_TOKEN"
}

function lint {
    pre-commit run --all-files
}

function lint:ci {
    echo "Lint disabled because this is not a real project"
    # SKIP=no-commit-to-branch pre-commit run --all-files
}

function start {
    echo "not implemented"
}

function test {
    echo "not implemented"
}

function default {
    echo "not implemented"
}

function help {
    echo "$0 <task> <args>"
    echo "Tasks:"
    compgen -A function | cat -n
}

TIMEFORMAT="Task completed in %3lR"
time ${@:-default}