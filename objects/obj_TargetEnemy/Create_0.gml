camera_x = camera_get_view_x(view_camera[0])
camera_y = camera_get_view_y(view_camera[0])

plr = obj_mainchara

current_target = plr
camera_moving = false
max_distance = 100

select = instance_create_depth(0, 0, 0, obj_RotateSelect)