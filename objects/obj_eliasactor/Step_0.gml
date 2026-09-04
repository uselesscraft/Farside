depth = -bbox_bottom

if (fun == false) {
	if (speed == 0 and path_speed == 0) {
		image_index = 0
		image_speed = 0
	}
	
	if (speed > 0) {
		image_speed = spd
	}
	
	if (path_speed > 0) {
		image_speed = spd
	}
	
	if (path_position == 1) {
		image_index = 0
		image_speed = 0
	}
	
	if (npcdir == true) {
		scr_npcdir()
	}
}