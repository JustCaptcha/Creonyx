import player
import state


# Declarations
proc playerUpdate()

proc worldUpdate*() =
    playerUpdate()

proc playerUpdate() =
    hero.update()