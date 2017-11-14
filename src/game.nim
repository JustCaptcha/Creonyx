import libBearLibTerminal
import strutils
import asyncdispatch
import world/mapgenerator
import player

let windowSettings: string = "window.title='Awsome project'; window.size=160x45; window.icon='./anvil-impact.ico'"
# type windowSettings2

# Declarations ##
# proc render()
proc settings()
proc menu()
proc userInput()
proc testthings()
#################

proc render*() =
    settings()              # set env variables
    menu()                  # make menu
    testthings()            # testing many things!
    terminal_refresh()
    userInput()             # A | need add async function

#Utils
proc settings() =
  terminal_set(windowSettings)
  terminal_composition(TK_ON)
  terminal_color(color_from_name("gray"))

proc menu() =
  echo "Menu"

proc userInput() =
  echo "User input"
  var key: int = terminal_read()
  while key != TK_CLOSE and key != TK_ESCAPE:
    key = terminal_read()
    if key == TK_A:
      terminal_refresh()

proc testthings() =
  echo "Yes, think twice..."

#[
  let d = terminal_print(1, 2, "[color=purple]Hello new world![/color]")
  terminal_print(25, 1, "[[width:" & $d.width & ", height:" & $d.height & "]]")
]#