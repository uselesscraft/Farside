switch global.menuindex {
	case 0:
		obj_arrow._x = 55
	break
	
	case 1:
		obj_arrow._x = 160
	break
	
	case 2:
		obj_arrow._x = 265
	break
}

obj_arrow.hor_sfx = true

if (movemenu(MOVE_FUNCTION.RIGHT)) {
	global.menuindex++
}

if (movemenu(MOVE_FUNCTION.LEFT)) {
	global.menuindex--
}

if (global.menuindex > 2) {
	global.menuindex = 0
}
if (global.menuindex < 0) {
	global.menuindex = 2
}

if (interactkey()) {
	switch global.menuindex {
		case 0:
			room_goto(room_fourth)
			
			audio_sound_gain(mus_mainmenu, 0, 240)
		break
	
		case 1:
			//no settings for you screw you!
		break
	
		case 2:
			call_later(0.5, time_source_units_seconds, function() {
				game_end()
			}, false)
			
			audio_sound_gain(mus_mainmenu, 0, 240)
		break
	}
}