switch (current_state) {
	case RotationState.Right:
		image_angle = RotationState.Right
	break
	
	case RotationState.Left:
		image_angle = RotationState.Left
	break
	
	case RotationState.Up:
		image_angle = RotationState.Up
	break
	
	case RotationState.Down:
		image_angle = RotationState.Down
	break
}

//SFX and stuff wowie!!!
if (hor_sfx) {
	if (movemenu(MOVE_FUNCTION.LEFT)) { audio_play_sound(snd_Move, 10, false) }
	if (movemenu(MOVE_FUNCTION.RIGHT)) { audio_play_sound(snd_Move, 10, false) }
	
	ver_sfx = false
}

else if (ver_sfx) {
	if (movemenu(MOVE_FUNCTION.UP)) { audio_play_sound(snd_Move, 10, false) }
	if (movemenu(MOVE_FUNCTION.DOWN)) { audio_play_sound(snd_Move, 10, false) }
	
	hor_sfx = false
}

else if (both_sfx) {
	if (movemenu(MOVE_FUNCTION.LEFT)) { audio_play_sound(snd_Move, 10, false) }
	if (movemenu(MOVE_FUNCTION.RIGHT)) { audio_play_sound(snd_Move, 10, false) }
	
	if (movemenu(MOVE_FUNCTION.UP)) { audio_play_sound(snd_Move, 10, false) }
	if (movemenu(MOVE_FUNCTION.DOWN)) { audio_play_sound(snd_Move, 10, false) }
	
	hor_sfx = false
	ver_sfx = false
}

if (keyboard_check_pressed(vk_enter)) { audio_play_sound(snd_Select, 10, false) }

x = lerp(_x, x, 0.2)
y = lerp(_y, y, 0.2)