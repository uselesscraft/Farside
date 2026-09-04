/// @description Update
// You can write your code in this editor


if (follow != noone) {
	xto = follow.x 
	yto = follow.y
}

if (movecam == true) {
	var dir = point_direction(x, y, xto, yto) 
	var dist = point_distance(x, y, xto, yto)

	if (dist <= spd) {
	    x = xto 
	    y = yto
	}
	else {
	    x += lengthdir_x(spd, dir) 
	    y += lengthdir_y(spd, dir)
	}
} else {
	x += xto - x 
	y += yto - y
}

camera_set_view_pos(view_camera[0], x - camwidth / 2, y - camheight / 2)

