/// @description lerps
// You can write your code in this editor

if (optionkey() and reachedpoint) {
	ohwow = !ohwow
	obj_mainchara.canmove = !obj_mainchara.canmove
	
	audio_play_sound(snd_Paper, 10, false)
	 
	visible = true
}

if (ohwow == true) {
	_x = lerp(_x, 82, 0.2)
	
	reachedpoint = abs(_x - 82) < 5
} else {
	_x = lerp(_x, -320, 0.3)
	
	reachedpoint = abs(_x + 320) < 5
}

camx = camera_get_view_x(cam)
camy = camera_get_view_y(cam)

x = camx + _x
y = camy + 60