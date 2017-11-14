# import libBearLibTerminal
# import strutils

type
    Person* = ref object of RootObj
        name*: string
        cchar*: string
        ctype*: string #crate, human, elf, etc...
        x*: int
        y*: int
        age*: int
        hitpoints*: int
proc setInMap() =
    echo "done!"