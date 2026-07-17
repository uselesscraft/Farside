var camX = camera_get_view_x(view_camera[0])
var camY = camera_get_view_y(view_camera[0])

var pos = val

draw_sprite_tiled(sprite_index , 0, camX * pos, camY * pos)