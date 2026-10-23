enum RotationState {
	Right = 0,
	Up = 90,
	Left = 180,
	Down = 270
}

current_state = RotationState.Right

sound_effects = true

hor_sfx = false
ver_sfx = true
both_sfx = false
press_sfx = true

_x = x
_y = y

if (variable_global_exists("battle")) {
	if (global.battle) {
		image_xscale = 0.5
		image_yscale = 0.5
	}
}

