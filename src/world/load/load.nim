import marshal
import streams
import ../state
# import ../objects/player
import ../objects/Player
import yaml


proc loadPlayer*() =
    echo "load hero!"
    let s = newFileStream("./src/data/player.yaml", fmRead)
    if not isNil(s):
        load(s, hero[])
    s.close()

proc savePlayer*() =
    echo "Save Hero!"
    let s = newFileStream("./src/data/player.yaml", fmWrite)
    dump(hero[], s, options = defineOptions(style = psJson))
    s.close()

proc loadff*(file: string, obj: object) =
    let s = newFileStream(file, fmRead)
    load(s, obj[])
    s.close()