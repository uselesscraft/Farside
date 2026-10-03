offsetx = lerp(offsetx, 5, 0.1) 
	
timer-- 

if (timer <= 240) {
	image_alpha -= 0.05
	
	audio_stop_sound(snd_minecraftswoosh)
	
	if (image_alpha <= 0) {
		instance_destroy()
	}
}