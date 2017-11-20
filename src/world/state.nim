import objects/Player

type
    GameState = ref object of RootObj
        exit*: bool
        game_over*: bool
        win*: bool
        actor*: Player
        year*: int
        time*: int

# Init global game state
var g*: GameState
new g

# test
var gameLoadedMap: string

# Init player
#[ var hero*: Player
new hero
hero.generate() ]#

