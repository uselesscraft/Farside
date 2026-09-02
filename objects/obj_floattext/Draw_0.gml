draw_set_font(font)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_alpha(image_alpha)

draw_set_color(c_black)

draw_text_transformed(x + 0.5, y, txt, 0.5, 0.5, 0)
draw_text_transformed(x - 0.5, y, txt, 0.5, 0.5, 0)
draw_text_transformed(x, y + 0.5, txt, 0.5, 0.5, 0)
draw_text_transformed(x, y - 0.5, txt, 0.5, 0.5, 0)

draw_text_transformed(x + 0.5, y + 0.5, txt, 0.5, 0.5, 0)
draw_text_transformed(x - 0.5, y - 0.5, txt, 0.5, 0.5, 0)
draw_text_transformed(x + 0.5, y + 0.5, txt, 0.5, 0.5, 0)
draw_text_transformed(x - 0.5, y - 0.5, txt, 0.5, 0.5, 0)

draw_set_colour(make_colour_rgb(255, 255, 185))

draw_text_transformed(x, y, txt, 0.5, 0.5, 0)

draw_set_alpha(1)