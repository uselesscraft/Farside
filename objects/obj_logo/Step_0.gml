if (time <= 0) {
	instance_create_depth(0, 0, depth + 1, obj_circle)
	
	seconds -= 0.05	
	time = seconds * 60
}	

time--

if (seconds <= 0) {
	image_alpha += 0.015
	image_speed = 1
	
	alpha2 += 0.01
	alpha2 = min(alpha2, 0.25)
}

if (seconds <= -8) {
	if (zoomtime < zoomduration) {
		zoomtime++
			
		var t = zoomtime / zoomduration
		obj_camera.zoomlevel = lerp(1, 3, t * t * t)
		obj_camera.follow = obj_logo
	}
	
	alpha += 0.01
}

if (floor(image_index) != oldframe) {
	if (!instance_exists(obj_ShakeVertical)) {
		var shake = instance_create_depth(0, 0, 0, obj_ShakeVertical)
		shake.obj = obj_logo
		shake.objy= y
	}
}

oldframe = floor(image_index)

if (alpha >= 1) {
	call_later(4, time_source_units_seconds, function() {
		room = room_mainmenu
	}, false)
}

if (interactkey()) {
	textalpha = 1
}

if (textalpha == 1) {
	alpha += 0.02
	audio_sound_gain(mus_intro, 0, 380)
}