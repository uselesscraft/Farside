if (!global.climbing) {
	var dist = (point_distance(x, y, obj_Player.x, obj_Player.y))

	if (dist < 65 and keyboard_check_pressed(vk_enter)) {
		global.climbing = true
		
		obj_Player.targetlerp = x
		obj_Player.targetlerpy = y
		
		obj_ladderbegin.done = true
	}
} else if (global.climbing) {
	var dist = (point_distance(x, y, obj_Player.x, obj_Player.y))

	if (dist < 30 and keyboard_check_pressed(vk_shift)) {
		obj_Player.targetlerp = obj_markerlb.x
		obj_Player.targetlerpy = obj_markerlb.y
		
		goingback = true
	}
}

if (goingback) {
	obj_Player.heightclamp = false
	
	with (obj_Player) {
		if (abs(x - targetlerp) < 3 and abs(y - targetlerpy) < 3) {
			global.climbing = false
			
			other.goingback = false
			heightclamp = true
		}
	}
}