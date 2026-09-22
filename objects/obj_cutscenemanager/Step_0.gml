#region Cutscene Logistics

if (currentstep >= array_length(scenearray)) {
	global.playercontrol = true 
	instance_destroy()
	
	exit
}

var currentaction = scenearray[currentstep]
var tag = currentaction[0]

for (var i = array_length(asynctasks) - 1; i >= 0; i--) {
	var task = asynctasks[i]
	
	if (task()) {
		array_delete(asynctasks, i, 1)
	}
}

if (waiting != noone) {
	if (waitcondition()) { //this is where it runs every single frame
		currentstep++
		
		waiting = noone 
		waitcondition = noone
	}
	
	exit
}

#endregion

switch (tag) {
	case CUTSCENE.MOVE_CAMERA: // Move the camera
		if (waiting != noone) { break }
		
		
		var camx = currentaction[1]
		var camy = currentaction[2]
		var camspd = currentaction[3]
		
		obj_camera.movecam = true 
		obj_camera.xto = camx
		obj_camera.yto = camy
		obj_camera.spd = camspd
		
		
		waiting = CUTSCENE.MOVE_CAMERA
		
		waitcondition = function() {
			if (obj_camera.movecam == false) {
				return true
			}
			
			return false
		}
		
		break
	
	case CUTSCENE.MOVE_CHARACTER: // Move a character
		if (waiting != noone) { break }
		
		
		var chara = currentaction[1]
		var xpos = currentaction[2]
		var ypos = currentaction[3]
		var charaspd = currentaction[4]
		
		
		waiting = CUTSCENE.MOVE_CHARACTER
		
		waitcondition = function() {
			with (chara) {
				moveto(xpos, ypos, charaspd)
			}
			
			if (chara.x == xpos and chara.y == ypos) {
				return true
			}
			
			return false
		}
		
		break
	
	case CUTSCENE.TEXT: // Textbox
		if (waiting != noone) { break }
		
		
		var txt = currentaction[1]
		var txtspd = currentaction[2]
		
		calltext(txt, txtspd)
		
		obj_Textbox.animend = false
		
		
		waiting = CUTSCENE.TEXT
		
		waitcondition = function() {
			if (!instance_exists(obj_Textbox)) {
				return true
			}
			
			return false
		}	
		
		break
}

//case asyncxample:
		//if (waiting != noone) { break }
		//
		//var newtask = function() {
		//	hahahaha
		//}
		//
		//array_push(asynctasks, newtask) //return true when done, otherwise ALWAYS return false!!
		//
		//currentstep++
		//break

