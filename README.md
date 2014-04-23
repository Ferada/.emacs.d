Guess what, this is my emacs configuration.  I'm in the process of
cutting down the untrolled growth in my previous .emacs file and also
getting the configuration to load on multiple systems, possibly with
missing packages (if I can't be bothered to download every single
package) and on different operating systems.

There is also the color theme included, which I've now used for the past
five years, migrating it from gvim; see
[here](http://macrolet.net/emacs/grey-blue-theme.png) for a screenshot.

## USAGE

Use GNU stow to install symlinks to your home directory, e.g. to install
.emacs.d use:

    stow emacs
