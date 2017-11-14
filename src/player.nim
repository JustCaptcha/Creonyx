# import libBearLibTerminal
# import strutils
import person

type
    Player = ref object of Person

#Player create
var player*: Player
new player
player.cchar = "@"
player.name = "Tor"
echo player[]