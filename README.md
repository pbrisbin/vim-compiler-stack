A vim compiler that uses [`stack ghc`][stack].

## Installation

1. Add `pbrisbin/vim-compiler-stack` to your preferred plugin manager

   Example:

   ```vim
   Plug 'pbrisbin/vim-compiler-stack'
   ```

1. Set the `compiler`, probably in a `FileType` hook

   ```vim
   autocmd FileType haskell compiler ghc
   ```

   *TODO: do this automatically in an after plugin.*

## Usage

Run `:make` in a Haskell file. Move through errors with `:cn`/`:cp`,
view them in a list with `:copen`.

## GHC Configuration

The compilation process will respect `{.,~}/ghci`, so any required settings
should be added there (e.g. language extensions). This makes it trivial to have
global and project-local settings.

## Extra Configuration

I *don't* recommend triggering compilation on every write. This plugin doesn't
aim to do anything fancy to avoid the UI freeze while `ghc` is doing its thing.
Therefore, I recommend `map`ping it to an explicit action instead:

```vim
map <Leader>c :silent :make<CR>
```

The following will automatically open and close the QuickFix window when errors
are found or resolved, which is handy in general (e.g. `:grep`):

```vim
autocmd QuickFixCmdPost    l* nested lwindow
autocmd QuickFixCmdPost [^l]* nested cwindow
```

[stack]: http://docs.haskellstack.org/en/stable/README.html
