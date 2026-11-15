/// @description Draw circle
// You can write your code in this editor

if (back == false) {
	draw_sprite_tiled_ext(spr_CircleDoor, -1, 0, 0, 1, 1, c_white, alpha)
	sprite_index = spr_CircleDoor
	
	alpha += 0.05
} else if (back == true) {
	draw_sprite_tiled_ext(spr_CircleDoorWaitHolUp, -1, 0, 0, 1, 1, c_white, alpha)
	sprite_index = spr_CircleDoorWaitHolUp
	alpha -= 0.05
}

alpha = min(alpha, 1)