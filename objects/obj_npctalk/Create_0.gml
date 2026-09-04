sprite = spr_FrogNpcTalk

rsprite = sprite
lsprite = sprite
usprite = sprite
dsprite = sprite

spritenormal = spr_FrogNpc

range = 42

text = []

animatepage = [0, 1]
allanimate = true
cananimate = false

imgspd = 1

shadow = true

function startdialogue() {
	if (instance_exists(obj_Textbox) == false) {
		calltext(text, 0.5)
	}
}

function faceplr() {
	obj_Textbox.player_move = false 
	obj_Textbox.player_stop_move = false
	
	obj_mainchara.canmove = false
	
	var dx = obj_mainchara.x - x
	var dy = obj_mainchara.y - y

	if (abs(dx) > abs(dy)) {
	    if (dx > 0) {
	        sprite_index = rsprite
		} else {
	        sprite_index = lsprite
		}
	} else {
	    if (dy > 0) {
	        sprite_index = dsprite
		} else {
	        sprite_index = usprite
		}
	}
	
	obj_camera.follow = self
	obj_camera.movecam = true
}

cometrigger = false

