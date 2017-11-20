import ../libBearLibTerminal
import map/mapreader.nim
import ../logic/logic
import objects/Player
import state
import load/load

# Declarations #
proc setMap()
proc setPlayer()
proc mapUpdate()
proc playerUpdate()

var map: string
######## First init #########
proc world*() =
    setMap()
    setPlayer()

proc setMap() =
    # need add if
    map = getMap()

    terminal_layer(0)
    terminal_print(20, 20, map)

proc setPlayer() =
    echo "load player save"
    loadPlayer()

#############################
proc worldUpdate*() =
    playerUpdate()
    mapUpdate()
    terminal_refresh()

proc playerUpdate() =
    terminal_layer(1)
    hero.update()

proc mapUpdate() =
    terminal_layer(0)
    terminal_clear_area(20, 20, 100, 100) # Temp clear area
    terminal_print(20, 20, map) # FIXME: fix load from file every time! ITS BAD