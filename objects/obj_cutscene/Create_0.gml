currentstep = 0
scenearray = []

asynctasks = []

waiting = noone
waitcondition = function() {
	
}

//other variables
time = 0

enum CUTSCENE {
	TEXT,
    MOVE_CAMERA,
	MOVE_CHARACTER,
	CHARACTER_SPRITE,
	SET_VARIABLE,
	WAIT,
	RUN_CODE
}
