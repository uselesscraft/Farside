if (place_meeting(x, y, obj_mainchara) and global.flags[BIRD_FLAG] == false) {
	if (interactkey() and obj_mainchara.direction = 90) {
		trigger = true
	}
}

if (place_meeting(x, y, obj_mainchara) and global.flags[BIRD_FLAG2] == false and global.flags[BIRD_FLAG] == true) {
	if (interactkey() and obj_mainchara.direction = 90) {
		trigger2 = true
	}
}


if (trigger == true) {
	calltext(text, 0.5)
	
	if (global.textboxfinish) {
		global.flags[BIRD_FLAG] = true
		
		trigger = false
	}
}

if (trigger2 == true) {
	calltext(text2, 0.5)
	
	if (global.textboxfinish) {
		trigger2 = false
	}
}

