import ../libBearLibTerminal
import ../world/state
import ../world/objects/Player

proc move*(direction: string, obj: Player)   =
    case direction:
        of "LEFT":
            terminal_layer(0)
            var o = terminal_pick(obj.p_x-1, obj.p_y, 0)
            case o:
                of 9474, 9472, 9488, 9496, 9492, 9484:
                    echo "Wall! You can't go!"
                else:
                    obj.moveLeft()
        of "UP":
            terminal_layer(0)
            var o = terminal_pick(obj.p_x, obj.p_y-1, 0)
            case o:
                of 9474, 9472, 9488, 9496, 9492, 9484:
                    echo "Wall! You can't go!"
                else:
                    obj.moveUp()
        of "RIGHT":
            terminal_layer(0)
            var o = terminal_pick(obj.p_x+1, obj.p_y, 0)
            case o:
                of 9474, 9472, 9488, 9496, 9492, 9484:
                    echo "Wall! You can't go!"
                else:
                    obj.moveRight()
        of "DOWN":
            terminal_layer(0)
            var o = terminal_pick(obj.p_x, obj.p_y+1, 0)
            case o:
                of 9474, 9472, 9488, 9496, 9492, 9484:
                    echo "Wall! You can't go!"
                else:
                    obj.moveDown()
