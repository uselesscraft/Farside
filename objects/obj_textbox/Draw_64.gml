/// @description Draw Text
// You can write your code in this editor
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 1)

draw_set_font(fnt_Text)
draw_set_valign(fa_top)

draw_set_colour(c_white)

var current = text[page]
var current_text = is_array(current) ? current[0] : current

var old_count = floor(chara_count)

if (chara_count <= string_length(current_text)) {
	chara_count += chara_speed
	
	while (string_char_at(current_text, floor(chara_count)) == "/") {
		chara_count += 2
	}
	
	global.talking = true
} else {
	global.talking = false
}

var current_chara = string_char_at(current_text, chara_count)
var next_chara = string_char_at(current_text, chara_count + 1)

var old = floor(old_count)
var _new = floor(chara_count)

var dosound = false

while (old < _new) {
	old++ 
	
	var charaevil = string_char_at(current_text, floor(old))
	
	if (charaevil != " " and charaevil != "#") {
		dosound = true
	}
}

if (dosound) {
	if (is_array(current)) {
	    audio_stop_sound(current[1])
		audio_play_sound(current[1], 10, false)
		audio_sound_pitch(current[1], random_range(0.95, 1.05))
		
		global.globalsound = current[1]
	} else {
	    audio_stop_sound(snd_Text)
		audio_play_sound(snd_Text, 10, false)
		audio_sound_pitch(snd_Text, random_range(0.95, 1.05))
		
		global.globalsound = snd_Text
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

var shakex = 0 
var shakey = 0

while (i <= string_length(t)) {

    var c = string_char_at(t, i)

    if (c == "#") {
        xx = x + x_padding
        yy += line_height
		
        i++
        continue
    }
	
	if (c == "/") {
		var tag = string_char_at(t, i + 1)
		
		switch (tag) {
			case "y": draw_set_colour(make_colour_rgb(255, 255, 185)); break //color yellow!
			case "w": draw_set_colour(c_white); break //white (nothing special...)
				
			case "S": //uppercase S. it starts the shake effect
				shakex = random_range(-1, 1)
				shakey = random_range(-1, 1)
			break
		
			case "s": //lowercase s. stops shake
				shakex = 0
				shakey = 0
			break
		
			case "n": //next line/page !! :D
				page++
				chara_count = 0
				chara_speed = chara_default_speed
			break	
		}
		
		i++
	}

    var fnt = (c == "(" or c == ")" or c == "-") ? fnt_System : fnt_Text
    draw_set_font(fnt)

    var cw = string_width(c)

    if (c == " " and xx + cw > x + x_padding + max_width) {
        xx = x + x_padding
        yy += line_height
		line_bullet = false
    }
	
    draw_text(xx + shakex, yy + shakey, c)
    xx += cw;

    i++
}