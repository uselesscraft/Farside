if (!audio_is_playing(mus_Duster)) {
	audio_play_sound(mus_Duster, 10, true)
	audio_stop_sound(mus_Forest)
	audio_stop_sound(mus_Mountains)
}