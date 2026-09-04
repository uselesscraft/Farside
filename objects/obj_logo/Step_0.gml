if (oldframe != floor(image_index)) {
	audio_play_sound(snd_Click, 10, false)
}

oldframe = floor(image_index)

if (done) {
	if (alarm[0] == -1) { alarm[0] = 100 }
	
	with (obj_paper) {
		if (!other.gotoroom) {
			image_alpha = lerp(image_alpha, 0.3, 0.2)
			image_speed = 1
		} else {
			image_alpha -= 0.05
			image_speed = 0
			
			obj_prologue.image_alpha = image_alpha
			other.textalpha = image_alpha
			
			if (image_alpha <= 0) {
				room_goto(room_mainmenu)
			}
		}
	}
	
	obj_prologue.image_alpha += 0.05
	
	time--
	if (!audioplay and time <= 0) {
		audio_play_sound(mus_prologue, 10, false)
		audioplay = true
	}
	
	if (interactkey() and cangotoroom) {
		gotoroom = true
	}
}