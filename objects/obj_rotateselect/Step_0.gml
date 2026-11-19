/// @description nah i aint writin anything here
// You can write your code in this editor
image_xscale = sine(image_xscale, 0.08, 0.08)
image_yscale = sine(image_yscale, 0.08, 0.08)

image_angle -= 2

if (follow != noone) {
	visible = true
	
	x = follow.x + follow.sprite_width / 2
	y = follow.y + follow.sprite_height / 2
	
	depth = _depth - 10
} else {
	visible = false
}