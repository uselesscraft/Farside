sprite = spr_FrogNpc

rsprite = sprite
lsprite = sprite
usprite = sprite
dsprite = sprite

range = 42

text = []

animatepage = [0, 1]
allanimate = true
cananimate = false

imgspd = 1

shadow = true

function startdialogue() {
	if (instance_exists(obj_Textbox) == false) {
		call_text(text, 0.5)
	}
}

function faceplr() {
	obj_Textbox.player_move = false 
	obj_Textbox.player_stop_move = false
	
	obj_Player.canMove = false
	
	var dx = obj_Player.x - x
	var dy = obj_Player.y - y

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
	obj_camera.move = true
}

cometrigger = false

