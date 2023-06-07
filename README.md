# filestack.vim
navigate jumplist a file at a time
`FilestackBack` works like `<c-o>` except that it will navigate through the jumplist until the file changes.
`FilestackForward` works like `<c-i>` except that it will navigate through the jumplist until the file changes.
These are useful for navigating backwards and forwards after using commands such as `gf` and goto-definition in LSP.

## Example Lazy setup
```lua
require("lazy").setup({
    {
        "jake-stewart/filestack.vim",
        config = function()
            local opts = {silent = true}
            vim.keymap.set('n', '<m-o>', vim.fn.FilestackBack, opts)
            vim.keymap.set('n', '<m-i>', vim.fn.FilestackForward, opts)
        end
    },
    ...
```
