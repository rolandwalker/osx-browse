[![Build Status](https://secure.travis-ci.org/rolandwalker/osx-browse.png)](http://travis-ci.org/rolandwalker/osx-browse)

Overview
========

Web browsing helpers for Emacs on OS X.

Quickstart
----------

```lisp
(require 'osx-browse)
 
(osx-browse-mode 1)
 
;; ⌘-b      ; browse to URL in foreground
;; C-- ⌘-b  ; browse to URL in background
 
;; ⌘-i      ; search Google in foreground
;; C-- ⌘-i  ; search Google in background
 
;; position cursor on a URL
;; ⌘-b
 
;; select a region
;; ⌘-i
 
;; to turn off confirmations
(setq browse-url-dwim-always-confirm-extraction nil)
```

Explanation
-----------

This package helps Emacs run [Safari](http://www.apple.com/safari), [Google Chrome](http://www.google.com/chrome), and [Firefox](http://www.mozilla.org/firefox)
on OS X.  It is similar to the built-in `browse-url`, but is
somewhat more friendly and configurable.

The foreground/background behavior of the external browser can
be controlled via customizable variables and prefix arguments.
A positive prefix argument forces foreground; a negative prefix
argument forces background.  With no prefix argument, the
customizable variable setting is respected.

Default values for URLs or search text are deduced from the region
or from context around the point, according to the heuristics in
[browse-url-dwim.el](http://github.com/rolandwalker/browse-url-dwim).

To use osx-browse, place the osx-browse.el library somewhere
Emacs can find it, and add the following to your ~/.emacs file:

```lisp
(require 'osx-browse)
(osx-browse-mode 1)
```

The following interactive commands are provided:

	osx-browse-mode
	osx-browse-url
	osx-browse-search
	osx-browse-guess
	osx-browse-url-safari
	osx-browse-url-chrome
	osx-browse-url-firefox

When `osx-browse-install-aliases` is set (the default) and
`osx-browse-mode` is turned on, aliases are added for the commands

	browse
	google
	browse-url-chromium

Notes
-----

This library uses [browse-url-dwim.el](http://github.com/rolandwalker/browse-url-dwim), but does not require that
`browse-url-dwim-mode` be turned on.  If both modes are turned
on, keybindings from both modes will be active.

When `osx-browse-mode` is turned on, `browse-url-browser-function`
is set to `osx-browse-url`, meaning that your default browsing
facilities will be provided by this library.  `osx-browse-url-safari`
and friends are provided in the event that you wish to set
`browse-url-browser-function` by hand.

Bugs
----

Keybindings don't work out of the box with [Aquamacs](http://aquamacs.org/), which
does not think that ⌘ is the Super modifier.

OS X makes an iconified application visible, even when opening
a URL in the background.

See Also
--------

	M-x customize-group RET osx-browse RET
	M-x customize-group RET browse-url-dwim RET
	M-x customize-group RET browse-url RET

Compatibility and Requirements
------------------------------

	GNU Emacs version 24.3-devel     : yes, at the time of writing
	GNU Emacs version 24.1 & 24.2    : yes
	GNU Emacs version 23.3           : yes
	GNU Emacs version 22.3 and lower : no

Requires: [browse-url-dwim.el](http://github.com/rolandwalker/browse-url-dwim)

Uses if present: [string-utils.el](http://github.com/rolandwalker/string-utils)
