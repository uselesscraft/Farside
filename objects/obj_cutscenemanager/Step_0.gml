#region Cutscene Logistics

for (var i = array_length(asynctasks) - 1; i >= 0; i--) {
	var task = asynctasks[i]
	
	if (task()) {
		array_delete(asynctasks, i, 1)
	}
}

if (currentstep >= array_length(scenearray)) {
	global.playercontrol = true 
	instance_destroy()
	
	exit
}

var currentaction = scenearray[currentstep]
var tag = currentaction[0]s

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
	case CUTSCENE.MOVE_CAMERA: // Moves the camera
		var camx = currentaction[1]
		var camy = currentaction[2]
		var camspd = currentaction[3]
		
		obj_camera.movecam = true 
		obj_camera.follow = false
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
	
	case CUTSCENE.MOVE_CHARACTER: // Moves a character
		var chara = currentaction[1]
		var xpos = currentaction[2]
		var ypos = currentaction[3]
		var charaspd = currentaction[4]
		
		
		waiting = CUTSCENE.MOVE_CHARACTER
		
		waitcondition = function() {
			if (!instance_exists(chara)) {
				return true
			}
			
			with (chara) {
				moveto(xpos, ypos, charaspd)
			}
			
			if (chara.x == xpos and chara.y == ypos) {
				return true
			}
			
			return false
		}
		
		break
	
	case CUTSCENE.CHARACTER_SPRITE: // Changes a character's sprite (or even maybe an object)
		var _chara = currentaction[1]
		var sprite = currentaction[2]
		
		_chara.sprite_index = sprite
		
		
		currentstep++
		
		break
	
	case CUTSCENE.TEXT: // Textbox
		var txt = currentaction[1]
		var txtspd = currentaction[2]
		
		calltext(txt, txtspd)
		
		//obj_Textbox.animend = false - using CUTSCENE.SET_VARIABLE to do that is better.
		
		
		waiting = CUTSCENE.TEXT
		
		waitcondition = function() {
			if (!instance_exists(obj_Textbox)) {
				return true
			}
			
			return false
		}	
		
		break
	
	case CUTSCENE.SET_VARIABLE: // Sets a variable to something
		var setvariable = currentaction[1]
		var value = currentaction[2]
		
		setvariable(value)
		
		
		currentstep++
		
		break
	
	case CUTSCENE.WAIT: // Waits
		var time = currentaction[1]
		
		
		waiting = CUTSCENE.WAIT
		
		waitcondition = function() {
			time--
			
			if (time <= 0) {
				return true
			}
			
			return false
		}
		
		break
	
	default:
		show_message("YOU'RE STUPID, " + string(tag) + " DOESN'T EXIST YOU DUMBNUT!!")
		
		
		currentstep++
		
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

