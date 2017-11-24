import ../../../libBearLibTerminal
import Room

type
    MapGenerator = ref object of RootObj
        isCreated: bool
        rooms: seq[Room]
        roomsCount: int
        roomsAttemptCount: int

method init*(this: MapGenerator) {.base.} =
        this.isCreated = false
        this.roomsAttemptCount = 15
        this.roomsCount = 1


proc mapGenerate*() =
    terminal_refresh()
    