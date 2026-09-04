switch global.menuindex {
	case 0:
		obj_arrow._y = 110
	break
	
	case 1:
		obj_arrow._y = 135
	break
	
	case 2:
		obj_arrow._y = 160
	break
}

if (keyboard_check_pressed(ord("S"))) {
	global.menuindex++
}

if (keyboard_check_pressed(ord("W"))) {
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
			room_goto(room_one)
		break
	
		case 1:
			//jaja no settings for u screw u
		break
	
		case 2:
			call_later(0.5, time_source_units_seconds, function() {
				game_end()
			}, false)
		break
	}
}