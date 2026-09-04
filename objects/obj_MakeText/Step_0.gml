/// @description What am I supposed to put here?
// You can write your code in this editor

if ((keyboard_check_pressed(vk_enter) == true or gamepad_button_check_pressed(0, gp_face2) == true) and place_meeting(x, y, obj_mainchara)) {
	if (instance_exists(obj_Textbox) == false) {
		calltext(text, 0.5)
	} else {
		obj_Textbox.player_move = true
		obj_Textbox.player_stop_move = true
	}
}