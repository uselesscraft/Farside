if (canMove and !global.climbing) {
	var rightKey = keyboard_check(ord("D")) or gamepad_axis_value(0, gp_axislh) > threshold
	var leftKey = keyboard_check(ord("A")) or gamepad_axis_value(0, gp_axislh) < -threshold
	var upKey = keyboard_check(ord("W")) or gamepad_axis_value(0, gp_axislv) < -threshold
	var downKey = keyboard_check(ord("S")) or gamepad_axis_value(0, gp_axislv) > threshold
	
	var sprint_key = keyboard_check(vk_shift) or gamepad_button_check(0, gp_face1)
	
	if (sprint_key == true) {
		MoveSpeed = max_speed
	} else {
		MoveSpeed = nor_speed
	}
	
	//random line thingyaaa
	
	function priority(arg0) {
		if (prio == -1) {
			prio = arg0
		}
	}
	
	if (rightKey or leftKey or upKey or downKey) {
		if (xSpd == 0 and ySpd == 0) {
			image_index = 1
		}
	}
	
	xSpd = 0
	ySpd = 0
	
	if upKey {
		ySpd = -MoveSpeed
		priority(prioY)
		direction = 90
	} else if downKey {
		ySpd = MoveSpeed
		priority(prioY)
		direction = 270
	}
	
	if leftKey {
		xSpd = -MoveSpeed
		priority(prioX)
		direction = 180
	}
	
	if rightKey {
		xSpd = MoveSpeed
		priority(prioX)
		direction = 0
	}
	
	if (prio == prioX and !leftKey and !rightKey) prio = -1
	if (prio == prioY and !upKey and !downKey)  prio = -1
	
	if (prio == prioY) {
		//if (upKey and downKey and colliding) {
		//    if (current_time div 50 mod 2 == 0) {
		//        sprite_index = spriteUp
		//	} else {
		//        sprite_index = spriteDown
		//		y += 1
		//	}
		//} else 
		
		if (upKey) {
		    sprite_index = spriteUp
		} else if (downKey) {
		    sprite_index = spriteDown
		}
	}
	
	if (prio == prioX) {
		if (rightKey) {
			sprite_index = spriteRight
		} else if (leftKey) {
			sprite_index = spriteLeft
		}
	}
	
	colliding = false
	
	if place_meeting(x + xSpd, y, obj_collider) {
	    xSpd = 0
		colliding = true
	}
	if place_meeting(x, y + ySpd, obj_collider) {
	    ySpd = 0
		colliding = true
	}
	
	x += xSpd
	y += ySpd
	
	x = round(x)
	y = round(y)
	
	if (xSpd == 0 and ySpd == 0) {
		image_speed = 0
		
		prio = -1
		bufferanim -= 1
		
		if (bufferanim <= 0) {	
			image_index = 0
		}
	} else {
		if (sprint_key == true) {
			image_speed = 1.4
		} else {
			image_speed = 1
		
		}
		
		bufferanim = 0
	}
	
	depth = -bbox_bottom
	
	if (sprite_index == spr_eliasclimb) {
		sprite_index = spriteUp
	}
} else if (!global.climbing) {
	image_index = 0
	image_speed = 0
} else {
	sprite_index = spr_eliasclimb
	var moving = false
	
	if (abs(x - targetlerp) < 0.2 and abs(y - targetlerpy) < 0.2) {
		var upKey = keyboard_check(ord("W")) or gamepad_axis_value(0, gp_axislv) < -threshold
		var downKey = keyboard_check(ord("S")) or gamepad_axis_value(0, gp_axislv) > threshold
	
		if (upKey or downKey) {
			moving = true
		} else {
			moving = false
		}
	
		if (moving == true) {
			image_speed = 1
		} else {
			image_speed = 0
		}
	
		if (downKey) {
			targetlerpy += 20
		} else if (upKey) {
			targetlerpy -= 20
		}
		
		if (heightclamp) { targetlerpy = clamp(targetlerpy, obj_ladderend.y, obj_ladderbegin.y - 15) }
		
	} else {
		x = lerp(x, targetlerp, 0.2)
		y = lerp(y, targetlerpy, 0.2)
		
		if (heightclamp) { targetlerpy = clamp(targetlerpy, obj_ladderend.y, obj_ladderbegin.y - 15) }
	}
}
event_user(1)

