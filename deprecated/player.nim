import ../../libBearLibTerminal
# import strutils
import person
##

type
    Player* = ref object of Person
    # ref object
#[         alive: bool
        placed: bool
        name: string
        cchar: int
        cchar_color: string
        ctype: string #crate, human, elf, etc...
        x: int
        y: int
        age: int
        hitpoints: int
        manapoints: int ]#

method generate*(this: Player) {.base.} =
  this.cchar = 64
  this.name = "Captcha"
  this.hitpoints = 50
  this.manapoints = 5
  this.x = 25
  this.y = 25
  # echo player[]

method update*(this: Player) {.base.} =
  terminal_put(this.x, this.y, this.cchar)
  # "[color=blue]this.cchar[/color]"
method moveLeft*(this: Player) {.base.} =
  this.x -= 1
  terminal_clear_area(this.x + 1, this.y, 1, 1,)

method moveUp*(this: Player) {.base.} =
  this.y -= 1
  terminal_clear_area(this.x, this.y + 1, 1, 1,)

method moveRight*(this: Player) {.base.} =
  this.x += 1
  terminal_clear_area(this.x - 1, this.y, 1, 1,)

method moveDown*(this: Player) {.base.} =
  this.y += 1
  terminal_clear_area(this.x, this.y - 1, 1, 1,)