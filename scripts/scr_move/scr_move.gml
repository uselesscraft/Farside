function moveto(targetx, targety, spd) {
	var dist = point_distance(x, y, targetx, targety)
	
	if (dist <= spd) {
		x = targetx
		y = targety
		
		hspeed = 0
		vspeed = 0
	} else {
		var dir = point_direction(x, y, targetx, targety)

	    hspeed = lengthdir_x(spd, dir)
	    vspeed = lengthdir_y(spd, dir)
	}
}

