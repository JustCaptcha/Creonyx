import libBearLibTerminal

proc helloScreen*() =
    #add exceptions!
    var logo: string = readFile("./src/data/helloscreen.txt")
    var TK_WIDTH_CENTER: int = terminal_state(TK_WIDTH) div 2
    var TK_HEIGHT_CENTER: int = terminal_state(TK_HEIGHT) div 2

    terminal_color(color_from_name("purple"))
    terminal_print_ext(TK_WIDTH_CENTER, TK_HEIGHT_CENTER, 0, 0, TK_alignment_CENTER, logo)
    #[ terminal_print(69, 23, "[color=purple]Insert[/color][color=yellow] coin![/color]")
    terminal_print(70, 24, "Press enter") ]#
    terminal_color(color_from_name("white"))
    terminal_refresh()
    var a: int
    while a != TK_ENTER:
      a = terminal_read()
    terminal_clear()