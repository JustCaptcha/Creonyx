import ../../../libBearLibTerminal
import random

type
    Room* = ref object of RootObj
        topLeft_x*: int
        topLeft_y*: int
        bottomRight_x*: int
        bottomRight_y*: int
        center_x*: int
        center_y*: int
        width*: int
        height*: int
        wallChar*: int
        floorChar*: int
        doorChar*: int
        roomId*: int

# Declarations
proc room(x: int, y: int, w: int, h: int)
# method makeDoors(this: Room) {.base.} # optional

method init*(this: Room, topLeft_x: int, topLeft_y: int, width: int, height: int) {.base.} =
    randomize()
    # Positions
    this.topLeft_x = topLeft_x
    this.topLeft_y = topLeft_y
    this.width = width
    this.height = height
    this.center_x = topLeft_x + width div 2
    this.center_y = topLeft_y + height div 2
    this.bottomRight_x = topLeft_x + width - 1
    this.bottomRight_y = topLeft_y + height - 1
    # Chars
    this.wallChar = 50    # '#'
    this.floorChar = 46   # '.'
    this.doorChar = 61    # '='
    # Random props here!

    # this.roomId = 1
#[     this.f_x = random(0..mapWidth)
    this.f_y = random(0..mapHeight) ]#

method makeRoom*(this: Room) {.base.} =
    room(this.topLeft_x, this.topLeft_y, this.width, this.height)
    # makeDoors(this)

proc room(x: int, y: int, w: int, h: int) =
    terminal_color(color_from_name("gray"))
    # Horizontal
    for x in countup(x+1, x+w):
        terminal_print(x-1, y, "#") # != w h !
        terminal_print(x-1, y+h-1, "#")
    # Vertical
    for y in countup(y+1, y+h):
        terminal_print(x, y-1, "#")
        terminal_print(x+w-1, y-1, "#")
    # terminal_print(x, y, "[color=red]$")
    # Floor
    for y in countup(y, y+h-3):
        for x in countup(x, x+w-3):
            terminal_print(x+1, y+1, "[color=white].")

method makeDoors*(this: Room) {.base.} =
    echo "Make doors!"
    terminal_color(color_from_name("orange"))
    var
        side: int = random(0..3)
        d_pos: int
    case side:
        of 0:
            echo "left"
            randomize()
            d_pos = random(1..this.height - 1)
            terminal_put(this.topLeft_x, this.topLeft_y + d_pos, this.doorChar)
        of 1:
            echo "top"
            randomize()
            d_pos = random(1..this.width - 1)
            terminal_put(this.topLeft_x + d_pos, this.bottomRight_y, this.doorChar)
        of 2:
            echo "right"
            randomize()
            d_pos = random(1..this.height - 1)
            terminal_put(this.bottomRight_x, this.bottomRight_y - d_pos, this.doorChar)
        of 3:
            echo "bottom"
            randomize()
            d_pos = random(1..this.width - 1)
            terminal_put(this.bottomRight_x + d_pos, this.bottomRight_y, this.doorChar)
        else: echo "Error door doesn't build"