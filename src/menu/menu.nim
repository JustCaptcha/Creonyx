import ../libBearLibTerminal
import ../world/state
import ../world/objects/Player

# Declarations
proc stats()

proc menu*() =
    echo "menu"

proc menuUpdate*() =
    terminal_clear()
    stats()

proc stats() =
    terminal_layer(0)
    terminal_print(5, 1, "[[Name: " & hero.name & "]]")
    terminal_print(5, 2, "[[HP: " & repr(hero.hitpoints) & "]]")
    terminal_print(5, 3, "[[MP: " & repr(hero.manapoints) & "]]")
    terminal_print(5, 4, "[[Time: " & repr(g.time) & "]]")

proc border() =
  var w: int = terminal_state(TK_WIDTH)
  var h: int = terminal_state(TK_HEIGHT)
  var x: int
  var y: int
  var wall: int = 0x2588
  for x in countup(x, w):
    terminal_put(x, 0, wall)
    terminal_put(0, x, wall)
  for y in countup(y, h):
    terminal_put(y, w, wall)
    terminal_put(0, y, wall)