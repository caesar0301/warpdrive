# Emacs Configuration

>Jessica Hamrick - jhamrick@berkeley.edu (<=2013)  
>Xiaming Chen - chenxm35@gmail.com (2014)

**Tested on versions:**
> GNU Emacs 24.4 (Mac OS X) of 2015-01-10  
> GNU Emacs 24.4 (Linux x86_64) of 2015-01-10
> GNU Emacs 24.5 (Linux x86_64) of 2016-05-10

## Installing

Clone this repository, and then run the `bootstrap.sh` script. This
will copy all of the necessary files to `~/.emacs` and
`~/.emacs.d`. Note that if these files exist for you already, **this
will overwrite those files**.

After installation, change `.emacs` to meet your own requirements:

    (setq enable-xxxxx t|nil)

## Dependencies

For some of the plugins to work, you will need to have some external
dependencies installed, such as Python, IPython, git, etc. If the
installation gives you an error, it might mean you are missing
required dependency that melpa requires.

Basic dependencies required on Mac OS X are listed below (you can install them via
`brew install xxx` or in alternative ways):

* [aspell](http://www.emacswiki.org/emacs/InteractiveSpell)
* [livedown](https://github.com/shime/emacs-livedown)
* Version control systems: `git`, `bzr`, `hg` and `cvs`

## Emacs plugins

This configuration installs several plugins using[`malpa`](http://melpa.org/).
These plugins are specified in `.emacs.d/settings/melpa-settings.el`,
some of which are also listed below:

* `auctex` -- LaTeX plugin
* `auto-complete` -- auto completion
* `color-theme-solarized` -- the [solarized](http://ethanschoonover.com/solarized) color theme
* `ess` -- Emacs speaks statistics
* `helm-descbinds` -- describe keybindings using helm
* `helm` -- [completion and selection](https://github.com/emacs-helm/helm) narrowing framework
* `jedi` -- general Python support
* `magit` -- git plugin
* `markdown-mode` -- support for [Markdown](http://daringfireball.net/projects/markdown/) files
* `multi-web-mode` -- auto select major mode for HTML files
* `pig-mode` -- Apache Pig syntax
* `popup` -- visual popup (e.g., for auto completion)
* `pydoc-info` -- Python documentation
* `scss-mode` -- support for [SCSS](http://sass-lang.com/) files
* `zotelo` -- Zotero citation management

## Toubleshooting

Here are some issues I or others have run into when installing this configuration. For debug reporting, please visit the
[project issue page](https://github.com/caesar0301/emacs-config/issues).

#### Trouble building AUCTeX

If you get the following error:

`error: el-get: ./autogen.sh el-get could not build auctex [./autogen.sh]`

There are a few possible causes. Try these steps:

1. Make sure you have `automake` and `texlive-full` installed (if you are on Ubuntu) or MacTeX (if you are on Mac).
2. Try running emacs from the command line (it could be an issue with not finding the right path).
3. If that doesn't work, run emacs from the command line with the `--debug-init` flag. This will give you more information about the error, and possibly point you towards the solution.

#### Tramp timing out

If you get the error `tramp ssh: connect to host c port 22: Operation timed out` and you are running OS X Mavericks with Emacs installed using Homebrew, then this is probably due to the Mavericks upgrade. Try reinstalling Emacs through Homebrew and remove the folder `~/.emacs.d/el-get` (note: this will remove all your el-get plugins, and they will need to be reinstalled).
