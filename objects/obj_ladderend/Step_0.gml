if (!global.climbing) {
	var dist = (point_distance(x, y, obj_mainchara.x, obj_mainchara.y))

	if (dist < 65 and keyboard_check_pressed(vk_enter)) {
		global.climbing = true
		
		obj_mainchara.followlerp = x
		obj_mainchara.followlerpy = y
		
		obj_ladderbegin.done = true
	}
} else if (global.climbing) {
	var dist = (point_distance(x, y, obj_mainchara.x, obj_mainchara.y))

	if (dist < 30 and keyboard_check_pressed(vk_shift)) {
		obj_mainchara.followlerp = obj_markerlb.x
		obj_mainchara.followlerpy = obj_markerlb.y
		
		goingback = true
	}
}

if (goingback) {
	obj_mainchara.heightclamp = false
	
	with (obj_mainchara) {
		if (abs(x - followlerp) < 3 and abs(y - followlerpy) < 3) {
			global.climbing = false
			
			other.goingback = false
			heightclamp = true
		}
	}
}