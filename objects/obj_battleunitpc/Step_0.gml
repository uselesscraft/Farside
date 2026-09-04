event_inherited()

if (hp <= 0) {
	image_alpha -= 0.05
	if (image_alpha > 0) { x -= 1 }
	
	sprite_index = sprites.hit
} else {
	if (sprite_index == sprites.hit) { sprite_index = sprites.idle }
}