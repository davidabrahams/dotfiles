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
- `%` corresponding `(` `{` `[`

#### Current line

- `fa/Fa` next/prev occurrence of `a` on line (`,`/`;` next/prev occurrence)
- `ta/Ta` just before/after next/prev character `a`

## Actions

- `<C-r>` redo
- `.` repeat last command
