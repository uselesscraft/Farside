if (!audio_is_playing(snd_wind)) audio_play_sound(snd_wind, 10, true)
if (!audio_is_playing(mus_Mountains)) audio_play_sound(mus_Mountains, 10, true)
audio_stop_sound(mus_Duster)
audio_stop_sound(mus_Papyrus)

audio_sound_gain(mus_Mountains, 2)