/// @description Insert description here
// You can write your code in this editor

var player = obj_Player

var dist = point_distance(x, y, player.x, player.y)

if (dist < 80 and state != "flee") {
    state = "flee"

	vspeed = -4.5
	if (dir == "left") {	
		hspeed = -3
	} else {
		hspeed = 3
	}
	var random_speed = random_range(1, 1.2)
	
	audio_play_sound(snd_BirdFly, 10, false)
	audio_sound_pitch(snd_BirdFly, random_speed)
}

if (state == "flee") {
	sprite_index = spr_Bird
	if (dir == "left") {	
		image_xscale = 1
	} else {
		image_xscale = -1
	}
	
	y = sine(y, 1, 4)
}

depth = -3000