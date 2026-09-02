/// @description lerps
// You can write your code in this editor
if (optionkey()) {
	i_am_there = !i_am_there
	obj_mainchara.canMove = !obj_mainchara.canMove
	
	audio_play_sound(snd_Paper, 10, false)
}

if (i_am_there == true) {
	_x = lerp(_x, 82, 0.2)
} else {
	_x = lerp(_x, -320, 0.1)
}

camx = camera_get_view_x(cam)
camy = camera_get_view_y(cam)

x = camx + _x
y = camy + 60