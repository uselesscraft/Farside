#region display stuff
	if (surface_get_width(application_surface) != window_get_width() || surface_get_height(application_surface) != window_get_height()) {
	    if (window_get_width() > 0 && window_get_height() > 0) {
			var windowheight = window_get_height()
			
			var canvaswidth =	(windowheight / 9) * 16
			var canvasheight = windowheight
			
			surface_resize(application_surface, canvaswidth, canvasheight)
			display_set_gui_size(640, 360)
		}
	}
#endregion

#region mouse

function mouseinteract() {
	//:3
	
	if (mouse_check_button(mb_left) or mouse_check_button(mb_right) or mouse_check_button(mb_middle)) {
		cursor_sprite = spr_mousehighlight
	} else {
		cursor_sprite = spr_mouse
	}
}

if (mouse_x == mouselastx and mouselasty == mouselasty) {
	mousetimer--
	
	if (mousetimer <= 0) {
		cursor_sprite = cr_none
	} else {
		mouseinteract()
	}
} else {
	mousetimer = 60
	
	mouseinteract()
}

mouselastx = mouse_x 
mouselasty = mouse_y

mousetimer = max(mousetimer, 0)

#endregion