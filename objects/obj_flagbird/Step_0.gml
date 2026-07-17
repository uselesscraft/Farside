if (place_meeting(x, y, obj_Player) and global.flags[BIRD_FLAG] == false) {
	trigger = true
}

if (place_meeting(x, y, obj_Player) and global.flags[BIRD_FLAG2] == false and global.flags[BIRD_FLAG] == true) {
	trigger2 = true
}


if (trigger == true) {
	call_text(text, 0.5)
	
	if (global.textboxfinish) {
		global.flags[BIRD_FLAG] = true
		
		trigger = false
	}
}

if (trigger2 == true) {
	call_text(text2, 0.5)
	
	if (global.textboxfinish) {
		global.flags[BIRD_FLAG2] = true
		
		trigger2 = false
	}
}

