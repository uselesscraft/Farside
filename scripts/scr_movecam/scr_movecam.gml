function movecam(dx, dy)
{
    var cam = view_camera[0]
	
	var camx = camera_get_view_x(cam) + dx
	var camy = camera_get_view_y(cam) + dy
	
	var camw = camera_get_view_width(cam)
	var camh = camera_get_view_height(cam)
	
	camx = clamp(camx, 0, room_width - camw)
	camy = clamp(camy, 0, room_height - camh)
	
    camera_set_view_pos(
        cam,
        camx,
        camy
    )
	
	return {
        _x: camx,
        _y: camy
    }
}