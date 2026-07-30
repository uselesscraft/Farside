var new_target = instance_nearest(plr.x, plr.y, obj_Enemy)
var cam = view_camera[0]

if (new_target == noone or instance_exists(obj_shake) == true or point_distance(plr.x, plr.y, new_target.x, new_target.y) > max_distance) {
	new_target = plr
}

if (new_target != current_target) {
	current_target = new_target
	camera_moving = true
	
	camera_x = camera_get_view_x(cam)
    camera_y = camera_get_view_y(cam)
}

var view_w = camera_get_view_width(view_camera[0])
var view_h = camera_get_view_height(view_camera[0])

var target_x = current_target.x - view_w / 2
var target_y = current_target.y - view_h / 2

target_x = clamp(target_x, 0, room_width - view_w)
target_y = clamp(target_y, 0, room_height - view_h)

if (current_target != obj_mainchara) {
	select.target = current_target
	select._depth = current_target.depth
} else {
	select.target = noone
}

if (camera_moving) {
	camera_set_view_target(cam, noone)
	
	camera_x = lerp(camera_x, target_x, 0.15)
	camera_y = lerp(camera_y, target_y, 0.15)
	
	camera_set_view_pos(cam, round(camera_x), round(camera_y))
	
	if (abs(camera_x - target_x) < 1 and abs(camera_y - target_y) < 1) {
		camera_x = target_x
		camera_y = target_y
		camera_moving = false
	}
} else {
	camera_set_view_target(cam, current_target)
}