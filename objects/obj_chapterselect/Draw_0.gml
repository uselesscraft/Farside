draw_set_alpha(alpha)
draw_set_colour(c_white)
draw_rectangle(0, 0, 320, 180, false)

draw_set_alpha(1)

draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_set_font(fnt_TextSmall)

draw_text(160, 75, textprologue)

draw_set_halign(fa_left)

for (var i = 0; i < 2; i++) {
	if (i = choice) { draw_set_color(c_gray) }
	else { draw_set_colour(c_black) }
	
	draw_text(150, 100 + 16 * i, optionsmileyface[i])
}

draw_set_alpha(1)