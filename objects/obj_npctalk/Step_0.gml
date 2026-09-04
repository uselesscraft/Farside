var dist = point_distance(x, y, obj_mainchara.x, obj_mainchara.y)

if ((keyboard_check_pressed(vk_enter) == true or gamepad_button_check_pressed(0, gp_face2) == true) and dist < range and !instance_exists(obj_Textbox)) {	
	var dirnpc = point_direction(obj_mainchara.x, obj_mainchara.y, x, y)
	var dirdiff = angle_difference(obj_mainchara.direction, dirnpc)
	
	if (abs(dirdiff) < 64 and !cometrigger) {
	    startdialogue()
		faceplr()
	}
}

if (!instance_exists(obj_Textbox)) {
	sprite_index = spritenormal
	image_speed = 1
}

if (global.talking) {
	if (allanimate) {
		image_speed = 1
	} else {
		if (instance_exists(obj_Textbox)) {
			image_speed = array_contains(animatepage, obj_Textbox.page) ? imgspd : 0
		}
	}
} else if (instance_exists(obj_Textbox)) {
	image_speed = 0
	image_index = 0
}

if (global.textboxfinish) {
	cometrigger = true
}

if (cometrigger) {
	obj_camera.follow = obj_mainchara
	
	if (obj_camera.x == obj_mainchara.x and obj_camera.y == obj_mainchara.y) {
		obj_camera.movecam = false
		obj_mainchara.canmove = true
		
		cometrigger = false
	}
}

depth = -bbox_bottom

