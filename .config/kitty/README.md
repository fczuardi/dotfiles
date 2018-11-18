To make CTRL+L, pager and other stuff work on remote servers, do this:

```
kitty +kitten ssh myserver
```

This will copy terminfo to the remote server, see https://sw.kovidgoyal.net/kitty/faq.html#i-get-errors-about-the-terminal-being-unknown-or-opening-the-terminal-failing-when-sshing-into-a-different-computer
