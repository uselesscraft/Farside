var scenetree = [ 
	[CUTSCENE.SET_VARIABLE, obj_mainchara, "canmove", false], //freezes the player
	[CUTSCENE.MOVE_CAMERA, 100, 100, 5], //moves the camera to x 100 y 100
	[CUTSCENE.TEXT, text2, 1], //triggers textbox
	[CUTSCENE.WAIT, 120], //waits 120 frames (in 60 fps)
	[CUTSCENE.TEXT, text, 1], //triggers textbox (again)
	[CUTSCENE.MOVE_CAMERA, obj_mainchara.x, obj_mainchara.y, 6], //moves the camera back to the player
	[CUTSCENE.SET_VARIABLE, obj_camera, "follow", obj_mainchara], //makes it so the camera is able to follow the player
	[CUTSCENE.SET_VARIABLE, obj_mainchara, "canmove", true], //unfreezes the player
]

if (place_meeting(x, y, obj_mainchara) and global.flags[BIRD_FLAG] == false) {
	if (interactkey()) {
		if (!instance_exists(obj_cutscene)) {
			var cutscene = instance_create_depth(0, 0, 0, obj_cutscene)
			cutscene.scenearray = scenetree
			
			global.flags[BIRD_FLAG] = true
		}
	}
}