import ../libBearLibTerminal
import state
import player
import actions

proc input*() =
    var key: int
    key = terminal_read()
    case key:
        of TK_CLOSE:
            g.exit = true
        of TK_ESCAPE:
            g.exit = true
        of TK_ENTER:
            terminal_clear()
        # Player
        of TK_LEFT:
            hero.moveLeft()
        of TK_UP:
            hero.moveUp()
        of TK_RIGHT:
            hero.moveRight()
        of TK_DOWN:
            hero.moveDown()
        else:
            echo "?NOT BINDING?"