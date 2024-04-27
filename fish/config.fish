
if status is-interactive
    fish_add_path /usr/sbin/
    fish_add_path $HOME/.cargo/bin

    set -x PKG_CONFIG_PATH /usr/lib64/pkgconfig

    # alias
    alias rm="rm -i"
    alias la="ls -la"
    # vim key bindings
    fish_vi_key_bindings
    set fish_cursor_insert line
    set -x EDITOR /usr/bin/nvim
end
