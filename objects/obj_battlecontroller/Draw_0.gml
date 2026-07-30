//background
bgx += 0.25

draw_sprite_tiled(battlesky, 0, bgx, y)
draw_sprite_tiled(battlebackground, 0, x, y)

//units
var currentunit = unitturnorder[turn].id

for (var i = 0; i < array_length(unitrenderorder); i++) {
	with (unitrenderorder[i]) {
		draw_self()
	}
}

//ui boxes
draw_sprite_stretched(spr_box, 0, x + 75, y + 140, 245, 40)
draw_sprite_stretched(spr_box, 0, x, y + 130, 74, 50)

//positions
#macro COLUMN_ENEMY 25
#macro COLUMN_NAME 90
#macro COLUMN_HP 160
#macro COLUMN_MW 220

//draw section
draw_set_font(fnt_TextBattle)

draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_set_colour(c_dkgray)

draw_text(x + COLUMN_ENEMY, y + 134, "ENEMY:")

draw_text(x + COLUMN_NAME, y + 144, "NAME:")
draw_text(x + COLUMN_HP, y + 144, "HP:")
draw_text(x + COLUMN_MW, y + 144, "MIND WAVE:")

//enemy
var whatisdrawn = 0

for (var i = 0; i < array_length(enemyunits); i++) {
	var chara = enemyunits[i]
	
	if (chara.hp > 0) {
		whatisdrawn += 1
		
		draw_set_colour(c_gray)
		if (chara.id == currentunit) { draw_set_colour(c_white) }
		
		show_debug_message(chara.id)
		show_debug_message(currentunit)
		
		draw_text(x + COLUMN_ENEMY, y + 145 + i * 9, chara.name)
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
	draw_text(x + COLUMN_NAME, y + 153 + i * 9, chara.name)
	
	//HP
	draw_set_font(fnt_TextBattle2)
	draw_sprite(spr_hp, 0, x + COLUMN_HP + 1, y + 153 + i * 9)
	draw_set_colour(c_black)
	
	var hp = string_replace_all(string_format(chara.hp, 3, 0), " ", "0")
	
	var len = string_length(hp)
	for (var _i = len; _i > 0; _i--) {
		hp = string_insert(" ", hp, _i)
	}
	
	draw_text(x + COLUMN_HP - 3, y + 153 + i * 9, hp)
	
	//MIND WAVES
	draw_set_font(fnt_TextBattle2)
	draw_sprite(spr_hp, 0, x + COLUMN_MW + 1, y + 153 + i * 9)
	draw_set_colour(c_black)
	
	var mw = string_replace_all(string_format(chara.mw, 3, 0), " ", "0")
	
	var _len = string_length(mw)
	for (var __i = _len; __i > 0; __i--) {
		mw = string_insert(" ", mw, __i)
	}
	
	draw_text(x + COLUMN_MW - 3, y + 153 + i * 9, mw)
}

