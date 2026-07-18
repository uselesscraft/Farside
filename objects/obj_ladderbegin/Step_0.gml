if (!done) {
	var dist = (point_distance(x, y, obj_Player.x, obj_Player.y))

	if (dist < 30 and keyboard_check_pressed(vk_enter)) {
		global.climbing = true
		
		obj_Player.targetlerp = obj_markerla.x
		obj_Player.targetlerpy = obj_markerla.y
		obj_Player.heightclamp = true
		
		done = true
	}
} else if (done) {
	var dist = (point_distance(x, y, obj_Player.x, obj_Player.y))

	if (dist < 25 and keyboard_check_pressed(vk_shift)) {
		obj_Player.targetlerp = obj_markerla.x
		obj_Player.targetlerpy = obj_markerla.y + 32
		
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

if (!global.climbing) { done = false }

