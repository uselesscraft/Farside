/// @description Page Increase
// You can write your code in this editor

if (keyboard_check_pressed(vk_enter) == true or gamepad_button_check_pressed(0, gp_face2) == true) {
	if (chara_count > string_length(text[page])) {
		if (page + 1 < array_length(text)) {
			page++
			chara_count = 0
			chara_speed = chara_default_speed
		} else {
			text = [""]
			page = 0
			closing = true
		}
	}
} else if (keyboard_check_pressed(vk_shift) or gamepad_button_check_pressed(0, gp_face1) == true) {
	chara_count = string_length(text[page])
}

if (closing == false) {
	y = lerp(y, target_y, lerp_value)
} else {
	instance_destroy(obj_mainchara)
	y = lerp(y, default_y, lerp_value)
	
	if (abs(y - default_y) < 0.1) {
		y = default_y
	}
}

if (page == 3 and hit == false) {
	hit = true
	instance_create_depth(0, 0, 0, obj_shake)
	obj_shake.obj = obj_mainchara
	audio_play_sound(snd_Hit, 10, false)
}

