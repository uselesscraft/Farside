/// @description lerps
// You can write your code in this editor
if (keyboard_check_pressed(vk_control) == true or gamepad_button_check_pressed(0, gp_start) == true) {
	i_am_there = !i_am_there
	obj_Player.canMove = !obj_Player.canMove
	
	audio_play_sound(snd_Paper, 10, false)
}

if (i_am_there == true) {
	x = lerp(x, 82, 0.2)
} else {
	x = lerp(x, -320, 0.1)
}