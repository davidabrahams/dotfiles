## Open/Close File

- `ZZ` Save + Quit

## Insertion

- `<C-[>` exit insert mode
- `i`/`a` insert/append
- `I`/`A` insert beginning/append end of line
- `gi` insert where you previous left off inserting

## Movement

- `_` first non-blank character this line
- `-` first non-blank character previous line
- `+` first non-blank character next line
- `w`/`e` start of following/end of this word (letters and underscores)
- `W`/`E` start of following/end of this Word (everything except white space)
- `{`/`}` next/prev paragraph
- `<C-o>`/`<C-i>` navigate cursor position history
- `g;`/`g,` older/newer position in change list
- `gg`/`G` go to top/bottom of file
- `gd`/`gD` go to local/global declaration
- `*`/`#` go to next/previous whole-word occurence of the word under the cursor
- `[{`/`]}` jump to start/end of function definition (wrapped in `{}`. Works with `[]` too.)

## Editing

- `J` join line with below
- `cc` change entire line
- `D` delete to end of line
- `p`/`P` paste/put before/after cursor.
- `[<Space>`/`]<Space>` add space before line (vim-unimpaired)
- `[e`/`]e` exchange line with line before/after it (vim-unimpaired)
- `gq` format selection

## Finding matches

- `/pattern` search for `pattern` (use `n`/`N` to go to next/previous match)
- `*`/`#` next/previous occurrence of word under cursor

#### Current line

- `fa/Fa` next/prev occurrence of `a` on line (`,`/`;` next/prev occurrence)
- `ta/Ta` just before/after next/prev character `a`

## Actions

- `<C-r>` redo
- `.` repeat last command

## Visual Blocks

- `<C-v>` enter visual block mode
- `I'/'A' to insert/append at the beginning/end of a line

## Zone selection

`<action>a<object>` or `<action>i<object>`.

`i` selects up to, `a` selects up to and including.

Possible actions are `y`, `d`, and `v` (to select).

Possible objects are characters like `"`, `` ` ``, `)`, `}`, `]`, or `w`, `s`
(sentence), `p` (paragraph).

## Indenting

After selecting text with visual block/visual mode:

- `>`/`<` indent to the left/right
- `J` join lines together
- `=` auto-indent

## Text objects

Works in visual-block mode or after a command.

Preface with `a` for "an", `i` for "inner".

- `w` word
- `s` sentence
- `p` paragraph
- `b` a `()` block
- `B` a `{}` block
- `>` a `<>` block

## Commenting (using vim-commentary)

- `gcc` comment out a line
- `gc` comment out selection in visual mode
- `gcap` comment out a paragraph (use with other text objects too)

## Macros

- `qa` to enable, disable macro recording into register `a`
- `@a` to run macro in register `a` (`@@` to run most recently run macro)

## Screen movement / Scrolling

- `<C-d>`/`<C-u>` scroll down/up half a page
- `H` move top of screen
- `M` move middle of screen
- `L` move bottom of screen
- `zt`/`zz`/`zb` move screen so cursor is at top/middle/bottom of screen

## File I/O (using CtrlP)

- `<C-p>` invole CtrlP
- `<C-j>`/`<C-k>` scroll up/down results
- `<C-t>`/`<C-v>`/`<C-x>` open file in new tab/vsplit/hsplit

## Buffer management

- `:bn`/`<C-n>` buffer next
- `:bp`/`<C-p>` buffer previous
- `:bN`/`N<C-6>` change to buffer number N
- `:b#`/`<C-6>` change to previously editted buffer
- `:bd` delete current buffer
- `f5` delete all hidden buffers (using a func in my .vimrc)


## Window management

- `<C-h>`/`C-l` switch to left/right window
- `<C-w>`+`J`/`K`/`H`/`L` move current window up, down, left, right
- `<C-w>`+`j`/`k`/`h`/`l` move to the window that is up, down, left, right
- `:vsp | bN` open buffer number N in a vsplit
