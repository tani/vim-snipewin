*snipewin.txt*                          Select window most quickly like sniper

Author: Hibiki <mail@4513echo.dev>
License: MIT License
URL: https://github.com/4513ECHO/vim-snipewin
Last change: 2023 Jul 26

==============================================================================
CONTENTS                                                   *snipewin-contents*

Introduction					|snipewin-introduction|
Interface					|snipewin-interface|
  Key Mappings					|snipewin-key-mappings|
  Functions					|snipewin-functions|
  Variables					|snipewin-variables|
  Highlight Groups				|snipewin-highlight-groups|
About						|snipewin-about|

==============================================================================
INTRODUCTION                                           *snipewin-introduction*

*snipewin* ( *vim-snipewin* ) is a plugin to select windows and jump to it.
The main idea is inspired by tmux's `display-panes` subcommand and
vim-|choosewin|.

https://github.com/t9md/vim-choosewin

Vim v9.0.0000+ or Neovim v0.8.0+ is required.

==============================================================================
INTERFACE                                                 *snipewin-interface*

------------------------------------------------------------------------------
KEY MAPPINGS                                           *snipewin-key-mappings*

<Plug>(snipewin)                                            *<Plug>(snipewin)*
	The mapping version of |snipe#select()|.

	Expamle: >
		nnoremap <C-w>w <Plug>(snipewin)

------------------------------------------------------------------------------
FUNCTIONS                                                 *snipewin-functions*

snipewin#select([{callback}])                              *snipewin#select()*
	Start selecting windows.
	{callback} is a |Funcref| that called with |window-ID| after confirm.
	If {callback} is ommited, |win_gotoid()| is used.

	Expamle to close selected window: >
		call snipewin#select({ winid -> win_execute(winid, 'close') })

------------------------------------------------------------------------------
VARIABLES                                                 *snipewin-variables*

g:snipewin_label_chars                                *g:snipewin_label_chars*
		|String| (default: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
	The set of charactors used for label.
	If alphabetic charactors are included, they must be upper case.

g:snipewin_label_size                                  *g:snipewin_label_size*
		|String| (default: "large")
	The size of label. "small" or "large" are available values.

g:snipewin_ignore_single                            *g:snipewin_ignore_single*
		|Boolean| (default: |v:false|)
	If it is |v:true|, quit selecting immediately when only one window
	exists.

g:snipewin_override_winopts                *g:snipewin_override_winopts*
		|Dictionary| (default: `{}`)
	Override configs of label. See also |popup_create-arguments| for Vim
	and |nvim_open_win()| for Neovim.

------------------------------------------------------------------------------
HIGHLIGHT GROUPS                                   *snipewin-highlight-groups*

SnipeWinLabel                                               *hl-SnipeWinLabel*
	The highlight group used for label of |snipewin#select()|.
	It is linked to `Label` (|group-name|) in default.

==============================================================================
ABOUT                                                         *snipewin-about*

|snipewin| is developed by Hibiki(4513ECHO) and licensed under the MIT
License. Visit the project page for the latest version:

	https://github.com/4513ECHO/vim-snipewin

==============================================================================
vim:tw=78:ts=8:ft=help:norl:noet:fen: