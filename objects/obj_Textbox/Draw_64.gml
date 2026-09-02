/// @description Draw Text
// You can write your code in this editor
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 1)

draw_set_font(fnt_Text)
draw_set_valign(fa_top)

draw_set_colour(c_white)

var entry = text[page]
var current_text = is_array(entry) ? entry[0] : entry

var old_count = floor(chara_count)

if (chara_count <= string_length(current_text)) {
	chara_count += chara_speed
	
	global.talking = true
} else {
	global.talking = false
}

var new_count = floor(chara_count)

var current_chara = string_char_at(current_text, chara_count)
var next_chara = string_char_at(current_text, chara_count + 1)

if (new_count > old_count and current_chara != " " and current_chara != "."
and current_chara != ")" and current_chara != "("  and current_chara != "!"
and current_chara != "?") {
	if (is_array(entry)) {
	    audio_stop_sound(entry[1])
		audio_play_sound(entry[1], 10, false)
		audio_sound_pitch(entry[1], random_range(1, 1.025))
	} else {
	    audio_stop_sound(snd_Text)
		audio_play_sound(snd_Text, 10, false)
		audio_sound_pitch(snd_Text, random_range(1, 1.025))
	}
}

if ((current_chara == "." and next_chara == " ") or (current_chara == "," and next_chara == " ") or (current_chara == "!" and next_chara == " ") or (current_chara == "?" and next_chara == " ")) {
	chara_speed = chara_slow_speed
} else {
	chara_speed = chara_default_speed
}

var text_part = string_copy(current_text, 1, chara_count)


var max_width = 250 * 2
var line_height = text_height

var t = text_part
var i = 1

var xx = x + x_padding
var yy = y + y_padding

var word = ""

while (i <= string_length(t)) {

    var c = string_char_at(t, i)

    if (c == "#") {
        xx = x + x_padding
        yy += line_height
		
        i++
        continue
    }

    var fnt = (c == "(" or c == ")" or c == "-") ? fnt_System : fnt_Text
    draw_set_font(fnt)

    var cw = string_width(c)

    if (c == " " and xx + cw > x + x_padding + max_width) {
        xx = x + x_padding
        yy += line_height
		line_bullet = false
    }
	
    draw_text(xx, yy, c)
    xx += cw;

    i++
}