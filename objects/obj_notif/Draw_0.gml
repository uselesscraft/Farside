draw_set_font(fnt_Text2)

draw_set_colour(c_black)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_alpha(image_alpha)

var length = string_width(text) / 0.75

x = camera_get_view_x(view_camera[0]) + sprite_width / 2 + offsetx
y = camera_get_view_y(view_camera[0]) + sprite_height / 2 + 2.5

if (length > sprite_get_width(sprite_index)) {
	image_xscale = (length) / sprite_get_width(sprite_index)
}

draw_self()

draw_text_transformed(x, y, text, 0.75, 0.75, 0)

draw_set_alpha(1)