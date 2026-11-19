battlestate()

for (var i = 0; i < array_length(partyunits); i++) {
	if (partyunits[i] != noone and instance_exists(partyunits[i])) {
	    var followhp = partyunits[i].hp
		var currenthp = global.mypartydata[i].hp
		
		var followmw = partyunits[i].mw
		var currentmw = global.mypartydata[i].mw
		
		timer--
		
		if (timer <= 0) {
			timer = timerdelay
			audio_sound_pitch(snd_Move, 1)
			audio_sound_pitch(snd_OuchDamageWhyWouldYouDoThat_QuestionMark_, 1)
			
			//hp
			if (currenthp > followhp) {
				currenthp--
				audio_play_sound(snd_OuchDamageWhyWouldYouDoThat_QuestionMark_, 10, false)
				audio_sound_pitch(snd_OuchDamageWhyWouldYouDoThat_QuestionMark_, random_range(1.1, 1.2))
			} else if (currenthp < followhp) {
				currenthp++
				audio_play_sound(snd_OuchDamageWhyWouldYouDoThat_QuestionMark_, 10, false)
				audio_sound_pitch(snd_OuchDamageWhyWouldYouDoThat_QuestionMark_, random_range(1.1, 1.2))
			}
			
			//mw
			global.mypartydata[i].hp = currenthp
			
			if (currentmw > followmw) {
				currentmw--
				audio_play_sound(snd_Move, 10, false)
				audio_sound_pitch(snd_Move, random_range(1.1, 1.2))
			} else if (currentmw < followmw) {
				currentmw++
				audio_play_sound(snd_Move, 10, false)
				audio_sound_pitch(snd_Move, random_range(1.1, 1.2))
			}
			
			global.mypartydata[i].mw = currentmw
		}
	}
}

if (keyboard_check_pressed(vk_right)) {
	var next = global.currentmember + 1
	
	if (next >= array_length(global.mypartydata)) {
		next = 0
	}
	
	switchmember(next)
}	
if (keyboard_check_pressed(vk_left)) {
	var next = global.currentmember - 1
	
	if (next < 0) {
		next = array_length(global.mypartydata) - 1
	}
	
	switchmember(next)
}
