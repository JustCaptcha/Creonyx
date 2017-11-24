import libBearLibTerminal
import strutils
import world/world
import world/state
import helloScreen
import menu/menu
import logic/logic

let windowSettings: string = """
   window.title = 'Creonyx';
   window.size = 75x75;
   window.resizeable = true;
   window.icon = './assets/wooden-door.ico';
   font: ./fonts/square.ttf, size=9;
"""
# FIXME: dont work app icon

# Declarations ##
proc gameStart()
proc gameLoop()
proc render()
proc settings()
#################
#[
  TODO:
    3. Generators
      - map
      - player
    4. First Creature
    5. Simple AI
]#
proc launch*() =
  settings()              # set env variables
  helloScreen()
  # menu() TODO:
  gameStart()

proc gameStart() =
  menu()
  world() # First initialization: load map from file, load Player position from yaml
  while g.exit != true:
    gameLoop()

proc gameLoop() =
  render()
  logic()

proc render() =
  terminal_refresh()
  menuUpdate()
  worldUpdate()

proc settings() =
  terminal_set(windowSettings)
  terminal_composition(TK_ON)
  terminal_color(color_from_name("white"))
