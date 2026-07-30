if (surface_get_width(application_surface) != window_get_width() || surface_get_height(application_surface) != window_get_height()) {
    if (window_get_width() > 0 && window_get_height() > 0) {
		var windowheight = window_get_height()
		
		var canvaswidth =	(windowheight / 9) * 16
		var canvasheight = windowheight
		
		surface_resize(application_surface, canvaswidth, canvasheight)
		display_set_gui_size(640, 360)
	}
}

