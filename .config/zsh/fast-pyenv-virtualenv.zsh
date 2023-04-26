#From https://gist.github.com/nolar/ba60ad1c0df936d7b1cd1f708039f337
# FIXME: pyenv-virtualenv is increadibly slow with ~10 virtualenvs.
# FIXME: because of the injection to $PROMPT_COMMAND: _pyenv_virtualenv_hook.
# FIXME: because it calls `pyenv sh-activate` on every prompt, which is slow.
if which pyenv >/dev/null; then eval "$(pyenv init --no-rehash - )"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# This is a replacement hook for the pyenv-virtualenv, which triggers only on demand,
# and stays inactive on other cases -- to save the time on prompt generation.
__pyenv_local_file=.python-version
__pyenv_mtime_file=/tmp/pyenv.mtime
__pyenv_last_cwd=
_pyenv_virtualenv_hook_cached ()
{
    local ret=$?;
    if [[
        ( "$__pyenv_last_cwd" != "$PWD" ) ||
        ( ! -e "$__pyenv_local_file" && -e "$__pyenv_mtime_file" ) ||
        ( -e "$__pyenv_local_file" && ! -e "$__pyenv_mtime_file" ) ||
        ( "$__pyenv_local_file" -nt "$__pyenv_mtime_file" )
    ]] ; then

        # Call the actual hook.
        _pyenv_virtualenv_hook "$@"

        # Store the new stage as the last known, for future checks.
        __pyenv_last_cwd="$PWD"
        if [[ -e "$__pyenv_local_file" ]] ; then
            touch -r "$__pyenv_local_file" "$__pyenv_mtime_file"
        else
            rm -f "$__pyenv_mtime_file"
        fi
    fi
    return $ret
}
PROMPT_COMMAND="${PROMPT_COMMAND//_pyenv_virtualenv_hook;/_pyenv_virtualenv_hook_cached;}"

# Make it clear when the virtualenv is changed, and when it is cached.
#export PYENV_VIRTUALENV_VERBOSE_ACTIVATE=yes

