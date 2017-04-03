## Open/Close File

- `ZZ` Save + Quit
- `:bn`/`bp` buffer next/previous

## Modes

- `<C-[` exit insert mode

## Movement

- `_` first non-blank character this line
- `+` first non-blank character previous line
- `-` first non-blank character next line
- `w`/`e` start of following/end of this word (letters and underscores)
- `W`/`E` start of following/end of this Word (everything except white space)

## Finding matches

- `/pattern` search for `pattern`
- `*`/`#` next/previous occurrence of word under cursor

#### Current line

- `fa/Fa` next/prev occurrence of `a` on line (`,`/`;` next/prev occurrence)
- `ta/Ta` just before/after next/prev character `a`

## Actions

- `<C-r>` redo
- `.` repeat last command

## Zone selection

`<action>a<object>` or `<action>i<object>`.

`i` selects up to, `a` selects up to and including.
``
Possible actions are `y`, `d`, and `v` (to select).

Possible objects are characters like `"`, ```````, `)`, `}`, `]`, or `w`, `s`
(sentence), `p` (paragraph).

## Text objects

Works in visual mode or after a command.

Preface with `a` for "an", `i` for "inner".

- `w` word
- `s` sentence
- `p` paragraph
- `b` a `()` block
- `B` a `{}` block
- `>` a `<>` block

## Commenting

- `gcc` comment out a line
- `gc` comment out selection in visual mode
- `gcap` comment out a paragraph (use with other text objects too)
