function shadow(){
	if (!global.sunset)
	{
		var shadow_w = bbox_right - bbox_left
		var cx = (bbox_left + bbox_right) * 0.5

		draw_sprite_stretched_ext(
		    spr_shadow,
		    0,
		    cx - shadow_w * 0.5,
		    bbox_bottom - 5,
		    shadow_w,
		    sprite_get_height(spr_shadow),
			image_blend,
			image_alpha
		)

		draw_self()
	}
	else
	{	
		var cy = bbox_bottom - y
		
		draw_sprite_ext(
			sprite_index,
			image_index,
			x,
			y + cy * 1.5,
			image_xscale,
			-image_yscale * 0.5,
			0,
			c_black,
			0.6
		)
		
		draw_self()
	}
}