import ../../libBearLibTerminal
import objects/Room
import ../load/load
import MapState

import random

proc start()
proc makeRooms(attemts: int)

var exit: bool = false
var ln: int = 0

let windowSettings: string = """
window.title = 'Creonyx';
window.size = 75x75;
window.resizeable = true;
font: ./fonts/square.ttf, size=9;
"""

start()

proc start() =
    terminal_open()
    terminal_refresh()
    terminal_set(windowSettings)

    while exit != true:
        # terminal_clear()
        # terminal_print(0, 0, "0123456789012345678901234567890123456789012345678901234567890")
        makeRooms(30)
        terminal_refresh()
        var key = terminal_read()
        case key:
            of TK_ESCAPE:
                exit = true
            of TK_ENTER:
                terminal_clear()
            else:
                echo ln
                inc(ln)
    terminal_close()

proc makeRooms(attemts: int) =
    var rooms: seq[Room]
    rooms = @[]
    let
        mapWidth = 60
        mapHeight = 60
    var
        buildedCounter: int = 0

    for rms in countup(0, attemts - 1):
        # echo "--new try--"
        randomize()
        var
            noCollide: bool = false
            f_x = random(0..mapWidth)
            f_y = random(0..mapHeight)
            rWidth = random(5..13)
            rHeight = random(5..13)

        rooms.add(Room())
        for room in rooms:
            case rms:
                of 0:
                    echo "First room!"
                    rooms[rms].init(f_x, f_y, rWidth, rHeight)
                    rooms[rms].makeRoom()
                    rooms[rms].makeDoors()

                else:
                    # Left (rWidth - 1)
                    if f_x + rWidth + 1 < room.topLeft_x:
                        # echo "Left | room.topLeft_x: " & repr(room.topLeft_x)
                        noCollide = true
                    # Above (rHeight - 1)
                    elif f_y + rHeight + 1 < room.topLeft_y:
                        # echo "Above | room.topLeft_y: " & repr(room.topLeft_y)
                        noCollide = true
                    # Right
                    elif f_x - 1 > room.bottomRight_x:
                        # echo "Right | room.bottomRight_x: " & repr(room.bottomRight_x)
                        noCollide = true
                    # Below
                    elif f_y - 1 > room.bottomRight_y:
                        # echo "Below | room.bottomRight_y: " & repr(room.bottomRight_y)
                        noCollide = true
                    else:
                        # echo "Collide! x: " & repr(f_x) & " y: " & repr(f_y) & " width: " & repr(rWidth) & " height: " & repr(rHeight)
                        noCollide = false
                        break

        if noCollide == true:
            inc(buildedCounter)
            # echo "x: " & repr(f_x) & " y: " & repr(f_y)
            rooms[rms].init(f_x, f_y, rWidth, rHeight)
            rooms[rms].makeRoom()

        elif noCollide == false:
            echo "No Build, because collide!!"
        else:
            echo "Error in collision checks"

    # echo "--------------------END----------------------"
    # echo "Build count: " & repr(buildedCounter)

proc makeCoridors() =
    echo "Make Coridors!"
