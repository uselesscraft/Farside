/// @description Draw circle
// You can write your code in this editor

if (back == false) {
	draw_sprite_tiled(spr_CircleDoor, -1, 0, 0)
	sprite_index = spr_CircleDoor
} else if (back == true) {
	draw_sprite_tiled(spr_CircleDoorWaitHolUp, -1, 0, 0)
	sprite_index = spr_CircleDoorWaitHolUp
}

