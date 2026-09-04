enum MOVE_FUNCTION {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

function interactkey(){
	return keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_face2)
}

function backkey() {
	return keyboard_check_pressed(vk_shift) or gamepad_button_check_pressed(0, gp_face1)
}

function optionkey() {
	return keyboard_check_pressed(vk_control) or gamepad_button_check_pressed(0, gp_start)
}

function move(_where = MOVE_FUNCTION.UP) {
    switch (_where) {
        case MOVE_FUNCTION.UP:
            return keyboard_check(ord("W")) or gamepad_axis_value(0, gp_axislv) < -global.threshold;

        case MOVE_FUNCTION.DOWN:
            return keyboard_check(ord("S")) or gamepad_axis_value(0, gp_axislv) > global.threshold;

        case MOVE_FUNCTION.LEFT:
            return keyboard_check(ord("A")) or gamepad_axis_value(0, gp_axislh) < -global.threshold;

        case MOVE_FUNCTION.RIGHT:
            return keyboard_check(ord("D")) or gamepad_axis_value(0, gp_axislh) > global.threshold;
    }
}

