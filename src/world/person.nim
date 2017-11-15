type
    Person* = ref object of RootObj
        alive*: bool
        placed*: bool
        name*: string
        cchar*: int
        ctype*: string #crate, human, elf, etc...
        x*: int
        y*: int
        age*: int
        hitpoints*: int