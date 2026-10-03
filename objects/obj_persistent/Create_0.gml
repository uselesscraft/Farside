/// @description set up super duper veryveryvery important data
// You can write your code in this editor

//set up
randomise()

event_user(0)
event_user(1)

gml_release_mode(true)

global.flags = array_create(100, false)

global.threshold = 0.25

//textbox
global.talking = false
global.textboxfinish = false
global.globalsound = snd_Click

//gameplay
global.climbing = false
global.playercontrol = true

global.ignorekey = false

//mouse
window_set_cursor(cr_none)
cursor_sprite = spr_mouse

mouselastx = mouse_x
mouselasty = mouse_y

mousetimer = 60

//debug???
global.inide = true //stands for ide djisfadafgh

//shader
application_surface_draw_enable(true)
global.sunset = false

//battle
global.battle = false