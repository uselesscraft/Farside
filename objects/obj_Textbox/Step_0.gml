/// @description Page Increase
// You can write your code in this editor

var current = text[page]
var current_text = is_array(current) ? current[0] : current

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
	chara_count = string_length(current_text)
}

if (closing == false) {
	y = lerp(y, target_y, lerp_value)
} else {
	global.textboxfinish = true
	
	y = lerp(y, default_y, lerp_value)
	
	if (abs(y - default_y) < 0.1) {
		y = default_y
		
		if (instance_exists(obj_Player) == true and player_move == true) {
			obj_Player.canMove = true
		}
		
		instance_destroy()
	}
}

show_debug_message(player_move)