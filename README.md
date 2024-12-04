# Vim scripts

## vimrc.vim

My favorite settings that I need more often than not on any new system.
Copy/paste as needed.

## lslar.vim -- navigate through results of `ls -laR`

Defines 2 macro commands:

- **&lt;C-Down>** if current line represents a directory entry (starts with `drwxrwxr-x`, or such), find the listing of this directory in the text below
- **&lt;C-Up>** find the listing of the parent directory and position cursor to its entry which represents current directory

## term.vim

Defines `:Term` command, which starts built-in terminal and defines `<C-CR>` mapping which sends current line (or selection) to the terminal window as keystrokes.

Global or window variable `TERMBUF` overrides buffer number where selection is sent to (this is only needed if there is more than one terminal open).

