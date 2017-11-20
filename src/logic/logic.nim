import ../libBearLibTerminal
import ../world/state
import ../world/objects/Player
import actions
# import ../world/input
import ../world/load/load


proc input()
proc playerTurn()
proc computerTurn()
# Actions!

proc logic*() =
    playerTurn()
    computerTurn()
    inc(g.time)

proc playerTurn() =
    echo "Player turn."
    input()

proc computerTurn() =
    echo "Computer turn."

proc input() =
    var key: int
    key = terminal_read()
    case key:
        of TK_CLOSE:
            g.exit = true
        of TK_ESCAPE:
            g.exit = true
        of TK_ENTER:
            echo "saved"
            savePlayer()
        of TK_BACKSPACE:
            loadPlayer()
            # terminal_clear()
        # Player
        of TK_LEFT:
            move("LEFT", hero)
        of TK_UP:
            move("UP", hero)
        of TK_RIGHT:
            move("RIGHT", hero)
        of TK_DOWN:
            move("DOWN", hero)
        else:
            echo "?NOT BINDING?"

