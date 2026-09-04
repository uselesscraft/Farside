/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, obj_mainchara) and global.flags[NEWS_REPORTER] == false) {
	trigger = true
}

if (trigger == true) {
	if (instance_exists(obj_Textbox) == false) {
		var mus = mus_Forest
		audio_sound_gain(mus, 0, 300)
		
		calltext(text, 0.5)
	} else {
		obj_Textbox.player_move = true
		obj_Textbox.player_stop_move = true
		
		if (obj_Textbox.page >= 3) {
			var heismoving = move_to(9, 8, obj_napstablook, 3)
			
			if (heismoving) {
				cam_to(0, 0, obj_napstablook, 4)
			}
			
		}
	}
	
	if (obj_Textbox.closing == true) {
		global.flags[NEWS_REPORTER] = true
		
		var mus = mus_Forest
		audio_sound_gain(mus, 1, 300)
		
		trigger = false
	}
}