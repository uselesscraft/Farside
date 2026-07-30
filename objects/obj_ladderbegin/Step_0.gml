if (!done) {
	var dist = (point_distance(x, y, obj_mainchara.x, obj_mainchara.y))

	if (dist < 30 and keyboard_check_pressed(vk_enter)) {
		global.climbing = true
		
		obj_mainchara.targetlerp = obj_markerla.x
		obj_mainchara.targetlerpy = obj_markerla.y
		obj_mainchara.heightclamp = true
		
		done = true
	}
} else if (done) {
	var dist = (point_distance(x, y, obj_mainchara.x, obj_mainchara.y))

	if (dist < 25 and keyboard_check_pressed(vk_shift)) {
		obj_mainchara.targetlerp = obj_markerla.x
		obj_mainchara.targetlerpy = obj_markerla.y + 32
		
		goingback = true
	}
}

if (goingback) {
	obj_mainchara.heightclamp = false
	
	with (obj_mainchara) {
		if (abs(x - targetlerp) < 3 and abs(y - targetlerpy) < 3) {
			global.climbing = false
			
			other.goingback = false
			heightclamp = true
		}
	}
}

if (!global.climbing) { done = false }

