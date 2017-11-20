type
    Person* = object {.inheritable.}
        alive*: bool
        placed*: bool
        name*: string
        cchar*: int
        cchar_color*: string
        ctype*: string #crate, human, elf, etc...
        x*: int
        y*: int
        age*: int
        hitpoints*: int
        manapoints*: int