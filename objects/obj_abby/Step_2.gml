show_debug_message(x)
show_debug_message(y)

if (global.climbing) { visible = false; depth = 9999; exit }
else { visible = true }

depth = -bbox_bottom

x = plr.pos_x[my_record]
y = plr.pos_y[my_record]

recordedsprite = plr._frame[my_record]

if (recordedsprite == spr_eliasdown) {
	sprite_index = dsprite
} else if (recordedsprite == spr_eliasup) {
	sprite_index = usprite
} else if (recordedsprite == spr_eliasright) {
	sprite_index = rsprite
} else if (recordedsprite == spr_eliasleft) {
	sprite_index = lsprite
}

image_speed = plr.image_speed
image_index = plr.image_index