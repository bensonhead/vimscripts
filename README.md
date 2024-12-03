# Vim scripts

## lslar.vim -- navigate through results of `ls -laR`

Defines 2 macro commands:

- **<C-Down>** if current line represents a directory entry (starts with `drwxrwxr-x`, or such), find the listing of this directory in the text below
- **<C-Up>** find the listing of the parent directory and position cursor to its entry which represents current directory
