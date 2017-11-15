import libBearLibTerminal
import strutils
# import asyncdispatch
import world/world
import world/mapgenerator
import world/player
# New files
import world/state
import world/input

let windowSettings: string = "window.title='Creonyx'; window.size=160x45; window.icon='./anvil-impact.ico'"
    #windowSettings: string = ""

# temp variables (make object later)

# Declarations ##
proc gameLoop()
proc render()
proc settings()
proc menu()
proc border()
#################
proc launch*() =
  settings()              # set env variables
  menu()                  # make menu
  gameLoop()

proc gameLoop() =
  while g.exit != true:
    render() # <- user input

proc render() =
    terminal_refresh()
    input()
    worldUpdate()
    # echo g[]
    inc(g.time)

#Utils
proc settings() =
  terminal_set(windowSettings)
  # terminal_set("0x1000: tileset2.png, size=16x16")
  terminal_composition(TK_ON)
  terminal_color(color_from_name("white"))
  # terminal_bkcolor(color_from_name("white"))
proc menu() =
  # Hello screen
  terminal_print(69, 23, "[color=purple]Insert[/color][color=yellow] coin![/color]")
  terminal_print(70, 24, "Press enter")
  var a: int
  while a != TK_ENTER:
    terminal_refresh()
    a = terminal_read()
  terminal_refresh()

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