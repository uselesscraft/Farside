function interactkey(){
	return keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_face2)
}

function backkey() {
	return keyboard_check_pressed(vk_shift) or gamepad_button_check_pressed(0, gp_face1)
}

function optionkey() {
	return keyboard_check_pressed(vk_control) or gamepad_button_check_pressed(0, gp_start)
}