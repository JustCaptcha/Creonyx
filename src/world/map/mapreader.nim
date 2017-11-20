# import ../../libBearLibTerminal

proc getMap*(): string =
    try:
        result = readFile("./src/data/firstmap.txt")
    except IOError:
        echo "ERROR: Map not loaded."