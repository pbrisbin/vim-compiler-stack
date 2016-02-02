A vim compiler that uses [`stack ghc`][stack].

## Installation

Use [Vundle][] and add:

```vim
Plugin 'pbrisbin/vim-compiler-stack'
```

## Usage

Run `:make` in a Haskell file. Move through errors with `:cn`/`:cp`,
view them in a list with `:copen`.

[stack]: http://docs.haskellstack.org/en/stable/README.html
[vundle]: https://github.com/VundleVim/Vundle.vim
