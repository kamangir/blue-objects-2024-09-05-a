#! /usr/bin/env bash

function blue_objects() {
    local task=$(abcli_unpack_keyword $1 help)

    if [ $task == "help" ]; then
        blue_objects version
        return
    fi

    abcli_generic_task \
        plugin=blue_objects,task=$task \
        "${@:2}"
}

function blue_objects_action_git_before_push() {
    [[ "$(abcli_git get_branch)" == "main" ]] &&
        blue_objects pypi build
}

python3 -m blue_objects version \
    --show_icon 1

source $(dirname "$(realpath "${BASH_SOURCE[0]}")")/download.sh
source $(dirname "$(realpath "${BASH_SOURCE[0]}")")/file.sh
source $(dirname "$(realpath "${BASH_SOURCE[0]}")")/objects.sh
source $(dirname "$(realpath "${BASH_SOURCE[0]}")")/publish.sh
source $(dirname "$(realpath "${BASH_SOURCE[0]}")")/select.sh
source $(dirname "$(realpath "${BASH_SOURCE[0]}")")/upload.sh
