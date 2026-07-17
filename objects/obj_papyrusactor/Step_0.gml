depth = -bbox_bottom

if (fun == false) {
	if (speed == 0 and path_speed == 0) {
		image_index = 0
		image_speed = 0
	}
	
	if (speed > 0) {
		image_speed = spd
	}
	
	if (path_speed > 0) {
		image_speed = spd
	}
	
	if (path_position == 1) {
		image_index = 0
		image_speed = 0
	}
	
	if (npcdir == true) {
		scr_npcdir()
	}
	
	var dir = point_direction(x, y, obj_Player.x, obj_Player.y)

	if (dir >= 315 || dir < 45)
	{
	    sprite_index = rsprite
	}
	else if (dir >= 45 and dir < 135)
	{
	    sprite_index = usprite
	}
	else if (dir >= 135 and dir < 225)
	{
	    sprite_index = lsprite
	}
	else
	{
	    sprite_index = dsprite
	}
}

var p = instance_nearest(x, y, obj_Player);
var d = point_distance(x, y, p.x, p.y);

if (d > 100) {
	gain = lerp(gain, 0, 1)
	gain2 = lerp(gain, 1, 1)
} else if (d > 50 and d < 100) {
	gain = lerp(gain, 0.5, 1)
	gain2 = lerp(gain, 0.5, 1)
} else {
	gain = lerp(gain, 1, 1)
	gain2 = lerp(gain, 0, 1)
}

audio_sound_gain(mus_Duster, gain2, 100)
audio_sound_gain(mus_Papyrus, gain, 100)

if (d < 42) {
	if (keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_face2) == true) {
		call_text(text, 0.5)
	}
}