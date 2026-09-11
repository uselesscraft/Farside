if (oldframe != floor(image_index)) {
	audio_play_sound(snd_Click, 10, false)
}

oldframe = floor(image_index)

if (done) {
	if (alarm[0] == -1) { alarm[0] = 10 }
	
	if (cangotoroom) {
		if (!instance_exists(obj_white)) {
			instance_create_depth(0, 0, -999999, obj_white)
		}
	}
}