if (waiting == 0) {
	offsetx = lerp(offsetx, 5, 0.1) 
	
	timer-- 
	
	if (timer <= 240) {
		image_alpha -= 0.05
		audio_stop_sound(snd_minecraftswoosh)
	}
	
	if (timer <= 0) {
		waiting = 1
	}
} else {
	offsetx = lerp(offsetx, -sprite_width, 0.1) 
	
	
	if (timer <= -200) {
		instance_destroy()
	}
}