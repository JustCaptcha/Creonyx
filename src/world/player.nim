import ../libBearLibTerminal
# import strutils
import person

type
    Player* = ref object of Person


method generate*(this: Player) {.base.} =
  this.cchar = 64
  this.name = "Tor"
  this.x = 2
  this.y = 2
  # echo player[]

method update*(this: Player) {.base.} =
  terminal_put(this.x, this.y, this.cchar)

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