set -o nounset
set -o errexit
set -o pipefail


# ===== Utilities


function echo_stderr() {
    echo "$@" >&2
}


function error_out() {
    local exit_code="$1"
    local exit_message="$2"

    echo_stderr "$exit_message"
    exit "$exit_code"
}


function exec_and_return_code {
    local command="$@"

    local return_code=0
    $@ >> /dev/null 2>&1 || return_code=$?
    echo "${return_code}"
}
