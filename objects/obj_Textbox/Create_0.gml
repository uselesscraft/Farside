/// @description set up wowo
// You can write your code in this editor

text = [["* This is the text!", snd_Text]]
page = 0

chara_count = 0
chara_speed = 0.5
chara_default_speed = chara_speed
chara_slow_speed = 0.1

image_xscale = 17 * 2
image_yscale = 2.2 * 2

default_x = 0
default_y = 360

target_y = default_y - sprite_height

box_width = 220
text_height = 22

x_padding = 15 * 2
y_padding = 5 * 2
lerp_value = 0.4

closing = false

depth = -1000

x = default_x
y = default_y

player_move = true
player_stop_move = true

if (player_stop_move == true) {
	obj_mainchara.canMove = false
}

dosound = false

global.textboxfinish = false