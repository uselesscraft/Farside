global.menuindex = 0

if (!audio_is_playing(mus_mainmenu)) {
	audio_play_sound(mus_mainmenu, 10, true)
	audio_sound_gain(mus_mainmenu, 0.75)
}

obj_camera.zoomlevel = 1 
obj_camera.follow = obj_mainchara

obj_arrow.current_state = RotationState.Down

