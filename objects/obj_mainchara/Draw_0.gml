/// @description Shadow
// You can write your code in this editor

if (!global.climbing) {
	if (!global.sunset) {
		draw_sprite(spr_shadow, 0, x, bbox_bottom) 
	} else {
		shadow()
	}
}
draw_self()