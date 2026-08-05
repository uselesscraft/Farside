draw_self()

if (done) {
	draw_set_font(fnt_Text2)
	draw_set_halign(fa_center)
	draw_set_colour(c_dkgray)

	draw_text(160, 165, "UselessCraft")
	
	if (cangotoroom) {
		textalpha += 0.01
		textalpha = min(0.6, textalpha)
		
		draw_set_alpha(textalpha)
		
		draw_set_colour(c_white)
		draw_set_font(fnt_TextBattle2)
		
		draw_text_transformed(160, 115, "-PRESS ENTER-", 1, 1, 0)
		
		draw_set_alpha(1)
	}
}

draw_set_halign(fa_left)

