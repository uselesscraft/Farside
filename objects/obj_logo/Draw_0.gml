draw_set_alpha(alpha2)
draw_set_colour(c_black)
draw_rectangle(0, 0, 320, 180, false)

draw_self()

draw_set_alpha(textalpha)
draw_set_halign(fa_center)

draw_set_font(fnt_Text2)
//draw_set_color(make_colour_rgb(255, 255, 185))
draw_text_transformed(160, 150, skiptext, 0.5, 0.5, 0)

draw_set_alpha(alpha)
draw_set_colour(c_white)
draw_rectangle(0, 0, 320, 180, false)

draw_set_alpha(1)