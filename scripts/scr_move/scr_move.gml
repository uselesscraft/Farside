function moveto(followx, followy, spd) {
	var dist = point_distance(x, y, followx, followy)
	
	if (dist <= spd) {
		x = followx
		y = followy
		
		hspeed = 0
		vspeed = 0
	} else {
		var dir = point_direction(x, y, followx, followy)

	    hspeed = lengthdir_x(spd, dir)
	    vspeed = lengthdir_y(spd, dir)
	}
}

