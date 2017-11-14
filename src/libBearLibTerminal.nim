# BearLibTerminal
# Copyright (C) 2017 Zacharycarter, Apromix
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

{.deadCodeElim: on.}

when defined(windows):
  const
    lib* = "libBearLibTerminal.dll"
elif defined(macosx):
  const
    lib* = "libBearLibTerminal.dylib"
else:
  const
    lib* = "libBearLibTerminal.so"

import strutils

# Keyboard scancodes for events/states.

const
  TK_A*               = 0x04
  TK_B*               = 0x05
  TK_C*               = 0x06
  TK_D*               = 0x07
  TK_E*               = 0x08
  TK_F*               = 0x09
  TK_G*               = 0x0A
  TK_H*               = 0x0B
  TK_I*               = 0x0C
  TK_J*               = 0x0D
  TK_K*               = 0x0E
  TK_L*               = 0x0F
  TK_M*               = 0x10
  TK_N*               = 0x11
  TK_O*               = 0x12
  TK_P*               = 0x13
  TK_Q*               = 0x14
  TK_R*               = 0x15
  TK_S*               = 0x16
  TK_T*               = 0x17
  TK_U*               = 0x18
  TK_V*               = 0x19
  TK_W*               = 0x1A
  TK_X*               = 0x1B
  TK_Y*               = 0x1C
  TK_Z*               = 0x1D
  TK_1*               = 0x1E
  TK_2*               = 0x1F
  TK_3*               = 0x20
  TK_4*               = 0x21
  TK_5*               = 0x22
  TK_6*               = 0x23
  TK_7*               = 0x24
  TK_8*               = 0x25
  TK_9*               = 0x26
  TK_0*               = 0x27
  TK_RETURN*          = 0x28
  TK_ENTER*           = 0x28
  TK_ESCAPE*          = 0x29
  TK_BACKSPACE*       = 0x2A
  TK_TAB*             = 0x2B
  TK_SPACE*           = 0x2C
  TK_MINUS*           = 0x2D
  TK_EQUALS*          = 0x2E
  TK_LBRACKET*        = 0x2F
  TK_RBRACKET*        = 0x30
  TK_BACKSLASH*       = 0x31
  TK_SEMICOLON*       = 0x33
  TK_APOSTROPHE*      = 0x34
  TK_GRAVE*           = 0x35
  TK_COMMA*           = 0x36
  TK_PERIOD*          = 0x37
  TK_SLASH*           = 0x38
  TK_F1*              = 0x3A
  TK_F2*              = 0x3B
  TK_F3*              = 0x3C
  TK_F4*              = 0x3D
  TK_F5*              = 0x3E
  TK_F6*              = 0x3F
  TK_F7*              = 0x40
  TK_F8*              = 0x41
  TK_F9*              = 0x42
  TK_F10*             = 0x43
  TK_F11*             = 0x44
  TK_F12*             = 0x45
  TK_PAUSE*           = 0x48
  TK_INSERT*          = 0x49
  TK_HOME*            = 0x4A
  TK_PAGEUP*          = 0x4B
  TK_DELETE*          = 0x4C
  TK_END*             = 0x4D
  TK_PAGEDOWN*        = 0x4E
  TK_RIGHT*           = 0x4F
  TK_LEFT*            = 0x50
  TK_DOWN*            = 0x51
  TK_UP*              = 0x52
  TK_KP_DIVIDE*       = 0x54
  TK_KP_MULTIPLY*     = 0x55
  TK_KP_MINUS*        = 0x56
  TK_KP_PLUS*         = 0x57
  TK_KP_ENTER*        = 0x58
  TK_KP_1*            = 0x59
  TK_KP_2*            = 0x5A
  TK_KP_3*            = 0x5B
  TK_KP_4*            = 0x5C
  TK_KP_5*            = 0x5D
  TK_KP_6*            = 0x5E
  TK_KP_7*            = 0x5F
  TK_KP_8*            = 0x60
  TK_KP_9*            = 0x61
  TK_KP_0*            = 0x62
  TK_KP_PERIOD*       = 0x63
  TK_SHIFT*           = 0x70
  TK_CONTROL*         = 0x71
  TK_ALT*             = 0x72

# Mouse events/states.

const
  TK_MOUSE_LEFT*      = 0x80 # Buttons
  TK_MOUSE_RIGHT*     = 0x81
  TK_MOUSE_MIDDLE*    = 0x82
  TK_MOUSE_X1*        = 0x83
  TK_MOUSE_X2*        = 0x84
  TK_MOUSE_MOVE*      = 0x85 # Movement event
  TK_MOUSE_SCROLL*    = 0x86 # Mouse scroll event
  TK_MOUSE_X*         = 0x87 # Cusor position in cells
  TK_MOUSE_Y*         = 0x88
  TK_MOUSE_PIXEL_X*   = 0x89 # Cursor position in pixels
  TK_MOUSE_PIXEL_Y*   = 0x8A
  TK_MOUSE_WHEEL*     = 0x8B # Scroll direction and amount
  TK_MOUSE_CLICKS*    = 0x8C # Number of consecutive clicks

# If key was released instead of pressed, it's code will be OR'ed with VK_KEY_RELEASED.

const
  TK_KEY_RELEASED*    = 0x100

# Virtual key-codes for internal terminal states/variables.
# These can be accessed via terminal_state function.

const
  TK_WIDTH*           = 0xC0 # Terminal width in cells
  TK_HEIGHT*          = 0xC1 # Terminal height in cells
  TK_CELL_WIDTH*      = 0xC2 # Cell width in pixels
  TK_CELL_HEIGHT*     = 0xC3 # Cell height in pixels
  TK_COLOR*           = 0xC4 # Current foregroung color
  TK_BKCOLOR*         = 0xC5 # Current background color
  TK_LAYER*           = 0xC6 # Current layer
  TK_COMPOSITION*     = 0xC7 # Current composition state
  TK_CHAR*            = 0xC8 # Translated ANSI code of last produced character
  TK_WCHAR*           = 0xC9 # Unicode codepoint of last produced character
  TK_EVENT*           = 0xCA # Last dequeued event
  TK_FULLSCREEN*      = 0xCB # Fullscreen state

# Other events.

const
  TK_CLOSE*           = 0xE0
  TK_RESIZED*         = 0xE1

# Generic mode enum. Used in Terminal.composition call only.

const
  TK_OFF*             =    0
  TK_ON*              =    1

# Input result codes for terminal_read_str function.

const
  TK_INPUT_NONE*      =    0
  TK_INPUT_CANCELLED* =   -1

# Text printing alignmentment.

const
  TK_alignment_DEFAULT*   =    0
  TK_alignment_LEFT*      =    1
  TK_alignment_RIGHT*     =    2
  TK_alignment_CENTER*    =    3
  TK_alignment_TOP*       =    4
  TK_alignment_BOTTOM*    =    8
  TK_alignment_MIDDLE*    =   12

type
  color_t* = uint32

  dimensions_t* = tuple
    width: int
    height: int

# Open

proc terminal_open*(): int {.discardable, cdecl, importc: "terminal_open", dynlib: lib.}

# Close

proc terminal_close*() {.noReturn, cdecl, importc: "terminal_close", dynlib: lib.}

# Set

proc terminal_set8*(options: ptr int8): int {.cdecl, importc: "terminal_set8", dynlib: lib.}

proc terminal_set16*(options: ptr int16): int {.cdecl, importc: "terminal_set16", dynlib: lib.}

proc terminal_set32*(options: ptr int32): int {.cdecl, importc: "terminal_set32", dynlib: lib.}

proc terminal_set*(options: cstring): int {.discardable, inline.} =
  return terminal_set8(cast[ptr int8](options))

proc terminal_setf*(options: string, args: varargs[string, `$`]): int {.discardable, inline.} =
  result = terminal_set(format(options, args))

# Refresh

proc terminal_refresh*() {.noReturn, cdecl, importc: "terminal_refresh", dynlib: lib.}

# Clear

proc terminal_clear*() {.noReturn, cdecl, importc: "terminal_clear", dynlib: lib.}

# Clear area

proc terminal_clear_area*(x, y, width, height: int) {.noReturn, cdecl, importc: "terminal_clear_area", dynlib: lib.}

# Crop

proc terminal_crop*(x, y, width, height: int) {.noReturn, cdecl, importc: "terminal_crop", dynlib: lib.}

# Layer

proc terminal_layer*(index: int) {.noReturn, cdecl, importc: "terminal_layer", dynlib: lib.}

# Composition

proc terminal_composition*(mode: int) {.noReturn, cdecl, importc: "terminal_composition", dynlib: lib.}

# Put

proc terminal_put*(x, y, code: int) {.noReturn, cdecl, importc: "terminal_put", dynlib: lib.}

proc terminal_put_ext*(x, y, dx, dy, code: int; corners: ptr color_t) {.noReturn, cdecl, importc: "terminal_put_ext", dynlib: lib.}

# Pick

proc terminal_pick*(x, y, index: int): int {.cdecl, importc: "terminal_pick", dynlib: lib.}

proc terminal_pick_color*(x, y, index: int): color_t {.cdecl, importc: "terminal_pick_color", dynlib: lib.}

proc terminal_pick_bkcolor*(x, y: int): color_t {.cdecl, importc: "terminal_pick_bkcolor", dynlib: lib.}

# Print

proc terminal_print_ext8*(x, y, width, height, alignment: int; value: ptr int8; out_w, out_h: ptr int) {.cdecl, importc: "terminal_print_ext8", dynlib: lib.}

proc terminal_print_ext16*(x, y, width, height, alignment: int; value: ptr int16; out_w, out_h: ptr int) {.cdecl, importc: "terminal_print_ext16", dynlib: lib.}

proc terminal_print_ext32*(x, y, width, height, alignment: int; value: ptr int32; out_w, out_h: ptr int) {.cdecl, importc: "terminal_print_ext32", dynlib: lib.}

proc terminal_print_ext*(x, y, width, height, alignment: int; s: cstring): dimensions_t {.discardable, inline.} =
  terminal_print_ext8(x, y, width, height, alignment, cast[ptr int8](s), addr(result.width), addr(result.height))

proc terminal_print*(x, y: int; s: cstring): dimensions_t {.discardable, inline.} =
  return terminal_print_ext(x, y, 0, 0, TK_alignment_DEFAULT, s)

proc terminal_print*(x, y, alignment: int; s: cstring): dimensions_t {.discardable, inline.} =
  return terminal_print_ext(x, y, 0, 0, alignment, s)

proc terminal_printf*(x, y: int, s: string, args: varargs[string, `$`]): dimensions_t {.discardable, inline.} =
  return terminal_print(x, y, format(s, args))

proc terminal_printf_ext*(x, y, width, height, alignment: int, s: string, args: varargs[string, `$`]): dimensions_t {.discardable, inline.} =
  return terminal_print_ext(x, y, width, height, alignment, format(s, args))

# Read

proc terminal_read*(): int {.cdecl, importc: "terminal_read", dynlib: lib.}

proc terminal_read_str8*(x, y: int; value: ptr int8; max: int): int {.cdecl, importc: "terminal_read_str8", dynlib: lib.}

proc terminal_read_str16*(x, y: int; value: ptr int16; max: int): int {.cdecl, importc: "terminal_read_str16", dynlib: lib.}

proc terminal_read_str32*(x, y: int; value: ptr int32; max: int): int {.cdecl, importc: "terminal_read_str32", dynlib: lib.}

proc terminal_read_str*(x, y: int; s: cstring; max: int): int {.inline.} =
  return terminal_read_str8(x, y, cast[ptr int8](s), max)

# Measure

proc terminal_measure_ext8*(width, height: int; value: ptr int8; out_w, out_h: ptr int) {.cdecl, importc: "terminal_measure_ext8", dynlib: lib.}

proc terminal_measure_ext16*(width, height: int; value: ptr int16; out_w, out_h: ptr int) {.cdecl, importc: "terminal_measure_ext16", dynlib: lib.}

proc terminal_measure_ext32*(width, height: int; value: ptr int32; out_w, out_h: ptr int) {.cdecl, importc: "terminal_measure_ext32", dynlib: lib.}

proc terminal_measure_ext*(width, height: int, s: cstring): dimensions_t {.inline.} =
  terminal_measure_ext8(width, height, cast[ptr int8](s), addr(result.width), addr(result.height))

proc terminal_measure*(value: cstring): dimensions_t {.inline.} =
  return terminal_measure_ext(0, 0, value)

proc terminal_measuref*(value: string, args: varargs[string, `$`]): dimensions_t {.inline.} =
  return terminal_measure(format(value, args))

# Has input

proc terminal_has_input*(): int {.cdecl, importc: "terminal_has_input", dynlib: lib.}

# State

proc terminal_state*(code: int): int {.cdecl, importc: "terminal_state", dynlib: lib.}

# Peek

proc terminal_peek*(): int {.cdecl, importc: "terminal_peek", dynlib: lib.}

# Delay

proc terminal_delay*(value: int) {.noReturn, cdecl, importc: "terminal_delay", dynlib: lib.}

# Get

proc terminal_get8*(key, default: ptr int8): ptr int8 {.cdecl, importc: "terminal_get8", dynlib: lib.}

proc terminal_get16*(key, default: ptr int16): ptr int16 {.cdecl, importc: "terminal_get16", dynlib: lib.}

proc terminal_get32*(key, default: ptr int32): ptr int32 {.cdecl, importc: "terminal_get32", dynlib: lib.}

proc terminal_get*(key: cstring; default: cstring = cast[cstring](0)): cstring {.inline.} =
  return cast[cstring](terminal_get8(cast[ptr int8](key), cast[ptr int8](default)))

# Color

proc terminal_color*(color: color_t) {.noReturn, cdecl, importc: "terminal_color", dynlib: lib.}

proc terminal_bkcolor*(color: color_t) {.noReturn, cdecl, importc: "terminal_bkcolor", dynlib: lib.}

proc color_from_name8*(name: ptr int8): color_t {.cdecl, importc: "color_from_name8", dynlib: lib.}

proc color_from_name16*(name: ptr int16): color_t {.cdecl, importc: "color_from_name16", dynlib: lib.}

proc color_from_name32*(name: ptr int32): color_t {.cdecl, importc: "color_from_name32", dynlib: lib.}

proc color_from_name*(name: cstring): color_t {.inline.} =
  return color_from_name8(cast[ptr int8](name))

proc color_from_argb*(a, r, g, b: uint8): color_t {.inline.} =
  return ((a shl 24) or (r shl 16) or (g shl 8) or b)

# Check

proc terminal_check*(code: int): int {.inline.} =
  return int terminal_state(code) > 0
