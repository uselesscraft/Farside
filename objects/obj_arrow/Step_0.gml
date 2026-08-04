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
	if (keyboard_check_pressed(ord("A"))) { audio_play_sound(snd_Move, 10, false) }
	if (keyboard_check_pressed(ord("D"))) { audio_play_sound(snd_Move, 10, false) }
	
	ver_sfx = false
}

else if (ver_sfx) {
	if (keyboard_check_pressed(ord("W"))) { audio_play_sound(snd_Move, 10, false) }
	if (keyboard_check_pressed(ord("S"))) { audio_play_sound(snd_Move, 10, false) }
	
	hor_sfx = false
}

else if (both_sfx) {
	if (keyboard_check_pressed(ord("A"))) { audio_play_sound(snd_Move, 10, false) }
	if (keyboard_check_pressed(ord("D"))) { audio_play_sound(snd_Move, 10, false) }
	
	if (keyboard_check_pressed(ord("W"))) { audio_play_sound(snd_Move, 10, false) }
	if (keyboard_check_pressed(ord("S"))) { audio_play_sound(snd_Move, 10, false) }
	
	hor_sfx = false
	ver_sfx = false
}

if (keyboard_check_pressed(vk_enter)) { audio_play_sound(snd_Select, 10, false) }

x = lerp(_x, x, 0.2)
y = lerp(_y, y, 0.2)