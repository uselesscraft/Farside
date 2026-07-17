var t = current_time / 500
var intensity = 5
var wave = 0.05

//draw_set_alpha(0.3)

for (var yy = 0; yy < sprite_height; yy++) { // Left and right
    var offset = sin(yy * wave + t) * intensity

    draw_sprite_part(
        sprite_index,
        0,
        0, yy,
        sprite_width, 1,
        offset, yy
    )
}

//draw_set_alpha(0.5)

for (var xx = 0; xx < sprite_width; xx++) { // Up and down
    var offset = sin(xx * wave + t) * intensity

    draw_sprite_part(
        sprite_index,
        1, // The sprite will have multiple frames, and they are different images
        xx, 0,
        1, sprite_height,
        xx, offset
    )
}