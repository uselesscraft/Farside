/// @description Page Increase
// You can write your code in this editor

var current = text[page]
var current_text = is_array(current) ? current[0] : current //explanation for dumb future me:
//var current is the line. example:
//haha[
//    ["wow", snd_stupid] <- this is current
//]

//haha["wow" <- this is also current]

//i set the current text to the first element of the var current array IF it is an array. other wise, just set it to current.

if (keyboard_check_pressed(vk_enter) == true or gamepad_button_check_pressed(0, gp_face2) == true) {
	if (chara_count > string_length(current_text)) {
		if (page + 1 < array_length(text)) {
			page++
			chara_count = 0
			chara_speed = chara_default_speed
		} else {
			closing = true
		}
	}
} else if (keyboard_check_pressed(vk_shift) or gamepad_button_check_pressed(0, gp_face1) == true) {
	if  (string_pos("/n", current) <= 0) {
		chara_count = string_length(current_text)
	}
}

if (closing == false) {
	y = lerp(y, target_y, lerp_value)
} else {
	global.textboxfinish = true
	
	y = lerp(y, default_y, lerp_value)
	
	if (abs(y - default_y) < 0.1) {
		y = default_y
		
		if (instance_exists(obj_mainchara) == true and player_move == true) {
			obj_mainchara.canmove = true
		}
		
		instance_destroy()
	}
}

