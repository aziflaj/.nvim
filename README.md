# dotnvim

My Ruby-oriented Neovim config, which works surprisigly well with Go, JavaScript/TypeScript and Terrorfarm, err... Terraform.

## Prerequisites

- Install [Neovim](https://github.com/neovim/neovim), obviously
- Install [packer](https://github.com/wbthomason/packer.nvim)
- Install [fzf](https://github.com/junegunn/fzf)

## But wait, what does it look like?

It looks great, I tell ya.

<details>
<summary>Check out this moving screenshot</summary>

https://user-images.githubusercontent.com/5219775/194038362-8f18fd36-fadb-40ec-8e94-f066e49447ea.mov
</details>

- Jumping to files: `<C-p>` opens a [Telescope](https://github.com/nvim-telescope/telescope.nvim) window for you to jump to a file (it supports searching by regex)
- Jumping to a class: `gf` jumps to the file that defines the class under the cursor (think of it as a mnemonic for "Goto File")
- Jumping to definitions: `gd` highlights the usages of the token (variable, function, word, etc.) under the cursor
- Jumping to a test file: `:A` jumps to the test file corresponding to the source file where the cursor is, and vice versa
- Jumping back: `<C-o>` jumps back to the file/line you were before jumping
- Jumping front: `<C-i>`, like `<C-o>` but forward
- Running tests:
  - `<Leader>s` to run the test **S**urrounding the cursor
  - `<Leader>l` to run the **L**ast test
  - `<Leader>t` to run the whole **T**est file
  - `<Leader>a` to ~~rule~~ run them **A**ll
- Selecting/deleting blocks: `var`/`vaf` selects the text around a Ruby block/function, and `d` after that deletes the selection
- Opening terminal: `\e` opens a [floating terminal](https://github.com/voldikss/vim-floaterm), and `\e` ~~closes~~ hides it.
- Spliting the screen: `<C-v>`/`<C-s>` splits the screen vertically/horizontally
- Moving between split sections: `<C-h>`/`<C-j>`/`<C-k>`/`<C-l>` to go left/down/up/right
- ...and a lot more...
