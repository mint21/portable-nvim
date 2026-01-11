# portable-nvim

[neovim releases](https://github.com/neovim/neovim/releases)

If on macOS: ``xattr -cr ~/portable-nvim``

``nvim`` will have ``lib``, ``bin``, and ``share``.

```bash
export XDG_CONFIG_HOME=~/portable-nvim/config
export XDG_DATA_HOME=~/portable-nvim/data
export XDG_STATE_HOME=~/portable-nvim/state
export XDG_CACHE_HOME=~/portable-nvim/cache
```

# TODOs

https://github.com/mrcjkb/rustaceanvim
(make sure rust-analyzer is not loaded in lsp, as described)