if (state == 0) {
	alpha += 0.05
	
	if (alpha >= 1.5) {
		state = 1
	}
} else if (state == 1) {
	room = rm
	
	state = 2
} else if (state == 2) {
	alpha -= 0.05
	
	if (alpha <= 0) {
		instance_destroy()
	}
}

show_debug_message(alpha)