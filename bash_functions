function mkcd () {
    mkdir "$1" && cd "$1"
}

function ckpull () {
    if [[ "$1" =~ ^[0-9]+$ ]]; then
	git fetch upstream pull/"$1"/head && git checkout FETCH_HEAD
    else
	if [ -n "$2" ]; then
	    if [[ "$2" =~ ^[0-9]+$ ]]; then
		git fetch "$1" pull/"$2"/head && git checkout FETCH_HEAD
	    else
		echo "To specify a branch and a PR, do branch first, then PR #"
	    fi
	else
	    echo "Specify PR and branch name"
	fi
    fi
}

function invert () {
    convert $1 -channel RGB -negate $1
}

function av() {
    [[ -r "venv/bin/activate" ]] && . venv/bin/activate && return 0
    [[ -r ".venv/bin/activate" ]] && . .venv/bin/activate && return 0
    echo "No virtual environment found" && return 1
}
