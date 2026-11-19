var new_follow = instance_nearest(plr.x, plr.y, obj_Enemy)
var cam = view_camera[0]

if (new_follow == noone or instance_exists(obj_shake) == true or point_distance(plr.x, plr.y, new_follow.x, new_follow.y) > max_distance) {
	new_follow = plr
}

if (new_follow != current_follow) {
	current_follow = new_follow
	camera_moving = true
	
	camera_x = camera_get_view_x(cam)
    camera_y = camera_get_view_y(cam)
}

var view_w = camera_get_view_width(view_camera[0])
var view_h = camera_get_view_height(view_camera[0])

var follow_x = current_follow.x - view_w / 2
var follow_y = current_follow.y - view_h / 2

follow_x = clamp(follow_x, 0, room_width - view_w)
follow_y = clamp(follow_y, 0, room_height - view_h)

if (current_follow != obj_mainchara) {
	select.follow = current_follow
	select._depth = current_follow.depth
} else {
	select.follow = noone
}

if (camera_moving) {
	camera_set_view_follow(cam, noone)
	
	camera_x = lerp(camera_x, follow_x, 0.15)
	camera_y = lerp(camera_y, follow_y, 0.15)
	
	camera_set_view_pos(cam, round(camera_x), round(camera_y))
	
	if (abs(camera_x - follow_x) < 1 and abs(camera_y - follow_y) < 1) {
		camera_x = follow_x
		camera_y = follow_y
		camera_moving = false
	}
} else {
	camera_set_view_follow(cam, current_follow)
}