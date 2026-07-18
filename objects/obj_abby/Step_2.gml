if (global.climbing) { visible = false; exit }
else { visible = true }

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
} else if (recordedsprite == spr_eliasclimb) {
	sprite_index = lsprite
}

image_speed = plr.image_speed
image_index = plr.image_index