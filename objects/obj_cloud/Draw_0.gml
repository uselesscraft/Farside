var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);

draw_sprite_ext(
    sprite_index,
    image_index,
    x + camx * parallax,
    y + camy * parallax,
    image_xscale,
    image_yscale,
    image_angle,
    image_blend,
    image_alpha
)