//background
bgx += 0.25

draw_sprite_tiled(battlesky, 0, bgx, y)
draw_sprite_tiled(battlebackground, 0, x, y)

//units
var currentunit = units[enemyselect].id

for (var i = 0; i < array_length(unitrenderorder); i++) {
	with (unitrenderorder[i]) {
		draw_self()
	}
	
	//shadow
	if (unitrenderorder[i].object_index == obj_battleunitenemy) {
		with (unitrenderorder[i]) {
			shadow()
		}
	}
}

//ui boxes
draw_sprite_stretched(spr_box, 0, x + 75, y + 140, 245, 40)
draw_sprite_stretched(spr_box, 0, x, y + 130, 74, 50)

//positions
var enemy_column = 25
var name_column = 90
var hp_column = 160
var mw_column = 220

//draw section
draw_set_font(fnt_TextBattle)

draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_set_colour(c_dkgray)

draw_text(x + enemy_column, y + 134, "ENEMY:")
draw_text(x + name_column, y + 144, "NAME:")
draw_text(x + hp_column, y + 144, "HP:")
draw_text(x + mw_column, y + 144, "MIND WAVE:")

//enemy
for (var i = 0; i < array_length(enemyunits); i++) {
	var chara = enemyunits[i]
	
	if (chara.hp > 0) {
		draw_set_colour(c_gray)
		if (chara == currentunit) { draw_set_colour(c_white) }
		
		obj_arrow._y = y + 145 + i * 8
		obj_arrow.x = x + enemy_column
		
		obj_arrow.current_state = RotationState.Right
		
		obj_arrow.ver_sfx = true
		obj_arrow.hor_sfx = false
		
		draw_text(x + enemy_column, y + 145 + i * 8, chara.name)
	}
}

//party
for (var i = 0; i < array_length(global.myparty); i++) {
	draw_set_font(fnt_TextBattle)
	draw_set_colour(c_white)
	
	var chara = global.mypartydata[i]
	
	//NAMES
	if (chara._id == global.currentmember) { draw_set_colour(make_colour_rgb(255, 255, 185)) }
	if (chara.hp <= 0) { draw_set_colour(c_maroon) }
	draw_text(x + name_column, y + 153 + i * 9, chara.name)
	
	//HP
	draw_set_font(fnt_TextBattle2)
	
	var imgindex = 0
	if (chara._id == global.currentmember) { imgindex = 1 }
	
	draw_sprite(spr_hp, imgindex, x + hp_column + 1, y + 153 + i * 9)
	draw_set_colour(c_black)
	
	var hp = string_replace_all(string_format(chara.hp, 3, 0), " ", "0")
	
	var len = string_length(hp)
	for (var _i = len; _i > 0; _i--) {
		hp = string_insert(" ", hp, _i)
	}
	
	draw_text(x + hp_column - 3, y + 153 + i * 9, hp)
	
	//MIND WAVES
	draw_set_font(fnt_TextBattle2)
	draw_sprite(spr_hp, imgindex, x + mw_column + 1, y + 153 + i * 9)
	draw_set_colour(c_black)
	
	var mw = string_replace_all(string_format(chara.mw, 3, 0), " ", "0")
	
	var _len = string_length(mw)
	for (var __i = _len; __i > 0; __i--) {
		mw = string_insert(" ", mw, __i)
	}
	
	draw_text(x + mw_column - 3, y + 153 + i * 9, mw)
}

