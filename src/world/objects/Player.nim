import ../../libBearLibTerminal
type
    Player* = ref object
        alive*: bool
        placed*: bool
        name*: string
        cchar*: int
        cchar_color*: string
        ctype*: string #crate, human, elf, etc...
        p_x*: int
        p_y*: int
        age*: int
        hitpoints*: int
        manapoints*: int



var hero*: Player
new hero
hero.cchar = 64
hero.cchar_color = "purple"
hero.alive = true
hero.placed = false
hero.name = "Shero"
hero.age = 20
hero.p_x = 25
hero.p_y = 23
hero.hitpoints = 100

method update*(this: Player) {.base.} =
  terminal_color(color_from_name(this.cchar_color))
  terminal_put(this.p_x, this.p_y, this.cchar)
  terminal_color(color_from_name("white"))

method moveLeft*(this: Player) {.base.} =
  this.p_x -= 1
  terminal_clear_area(this.p_x + 1, this.p_y, 1, 1,)

method moveUp*(this: Player) {.base.} =
  this.p_y -= 1
  terminal_clear_area(this.p_x, this.p_y + 1, 1, 1,)

method moveRight*(this: Player) {.base.} =
  this.p_x += 1
  terminal_clear_area(this.p_x - 1, this.p_y, 1, 1,)

method moveDown*(this: Player) {.base.} =
  this.p_y += 1
  terminal_clear_area(this.p_x, this.p_y - 1, 1, 1,)