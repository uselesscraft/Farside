if (beginner and !done) {
	var dist = (point_distance(x, y, obj_Player.x, obj_Player.y))

	if (dist < 30 and keyboard_check_pressed(vk_enter)) {
		global.climbing = true
		
		with (obj_ladder) {
			if (beginner == true) {
				obj_Player.targetlerp = x
				obj_Player.targetlerpy = bbox_top
			}
		}
	}
	
	done = true
} else if (done) {
	var dist = (point_distance(x, y, obj_Player.x, obj_Player.y))

	if (dist < 30 and keyboard_check_pressed(vk_shift)) {
		global.climbing = false
		
		with (obj_ladder) {
			if (beginner == true) {
				obj_Player.x = id.x 
				obj_Player.y = id.bbox_bottom
			}
		}
	}
}

if (!global.climbing) { done = false }