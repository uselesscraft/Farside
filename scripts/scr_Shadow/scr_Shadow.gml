function Shadow(){
	var shadow_w = bbox_right - bbox_left
	var cx = (bbox_left + bbox_right) * 0.5

	draw_sprite_stretched_ext(
	    spr_Shadow,
	    0,
	    cx - shadow_w * 0.5,
	    bbox_bottom - 5,
	    shadow_w,
	    sprite_get_height(spr_Shadow),
		image_blend,
		image_alpha
	)

	draw_self()
}