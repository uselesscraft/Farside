depth = -bbox_bottom

if (fun == false) {
	if (speed == 0 and path_speed == 0) {
		image_index = 0
		image_speed = 0
	}
	
	if (speed > 0) {
		image_speed = spd
	}
	
	if (path_speed > 0) {
		image_speed = spd
	}
	
	if (path_position == 1) {
		image_index = 0
		image_speed = 0
	}
	
	if (npcdir == true) {
		scr_npcdir()
	}
	
	if (talkanim and !npcdir) {
		if (global.globalsound == sound) {
			var originalname = object_get_name(object_index)
			var modifiedname = originalname + "-talking"
			var talksprite = asset_get_index(modifiedname)
			
			if (talksprite != -1) {
				sprite_index = talksprite
			}
			
			if (global.talking) {
				image_speed = 1
			} else {
				image_speed = 0
				image_index = 0
			}
		}
	}
}