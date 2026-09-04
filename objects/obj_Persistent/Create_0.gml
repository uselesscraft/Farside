/// @description set up super duper veryveryvery important data
// You can write your code in this editor

//set up
randomise()

event_user(0)
event_user(1)

global.flags = array_create(100, false)

global.threshold = 0.25

//textbox
global.talking = false
global.textboxfinish = false

//gameplay
global.climbing = false

cursor_sprite = spr_mouse
window_set_cursor(cr_none)

//debug???
global.inide = true //stands for in ide djisfadafgh

//shader
application_surface_draw_enable(true)
global.sunset = false

//battle
global.battle = false