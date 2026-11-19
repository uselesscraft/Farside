/// @description uh pretty self explanatory
// You can write your code in this editor
instance_deactivate_all(true)

//activate stuff
instance_create_depth(x, y, depth - 1, obj_curtain)
instance_activate_object(obj_curtain)

instance_create_depth(x, y, depth - 1, obj_arrow)
instance_activate_object(obj_arrow)

instance_activate_object(obj_persistent)
instance_activate_object(obj_camera)
instance_activate_object(obj_shake)

units = [] //holds all the unit and looks like this: current member, enemy 1, enemy 2, enemy 19 871 983
unitrenderorder = []

turn = 0

partyunits = [] //holds the party member and makes space for the rest
enemyunits = [] //holds all the enemies

enemyselect = 0

turncount = 0 //how many turns in total (doesn't get reset unlike turn)
roundcount = 0 //how many rounds uadsfoasdfoa

battlewaitframes = 30  //win check delay max
battlewaitremain = 0 //win check delay

currentuser = noone
currentaction = -1
currentfollows = noone

timer = 0 //rolling hp timer
timerdelay = 5 //rolling hp timer delay


//make party
partyunits = array_create(3, noone)

partyunits[global.currentmember] = instance_create_depth(x + 60, y + 90, depth - 10, obj_battleunitplayer, global.mypartydata[global.currentmember])
array_push(units, partyunits[global.currentmember])

//make enemies
for (var i = 0; i < array_length(enemies); i++) {
	enemyunits[i] = instance_create_depth(x + 250 + (i * 10), y + 80 + (i * 20), depth - 10, obj_battleunitenemy, enemies[i])
	array_push(units, enemyunits[i])
}

bgx = x

//states
function selectaction() {
	var _unit = units[turn]
	
	if (!instance_exists(_unit) or _unit.hp <= 0) {
		battlestate = checkwin
		exit
	}
	
	//beginaction(_unit, global.actionlibrary.attack, _unit)
	
	if (_unit.object_index == obj_battleunitplayer) { //if current unit is part of the team
		var action = global.actionlibrary.attack
			
		var allfollows = array_filter(enemyunits, function(_unit, _index) { //filters through the list of VERY EVIL doers and then returns those who meet the condition below!
			return instance_exists(_unit) and (_unit.hp > 0) //if hp is higher than 0, it returns true. otherwise, it returns false
		})
		
		var _follow = allfollows[irandom(array_length(allfollows) - 1)]
		
		beginaction(_unit.id, action, _follow)
		
		with (obj_camera) {
			follow = noone
			freeze = true
		}
		
		var shakecam = instance_create_depth(0, 0, 0, obj_shake)
		shakecam.obj = obj_camera
		shakecam.firstx = obj_camera.x
		shakecam.shake = 3
		shakecam.shakedec = 1
		
		var shake = instance_create_depth(0, 0, 0, obj_shake)
		shake.obj = _follow
		shake.firstx = _follow.x
		shake.shake = 5
		shake.shakedec = 1
		
		var shakehitter = instance_create_depth(0, 0, 0, obj_shake)
		shakehitter.obj = _unit
		shakehitter.firstx = _unit.x	
		shakehitter.shake = 5
		shakehitter.shakedec = 1
		
		audio_play_sound(snd_Slash, 10, false)
		
	} else { //EVIL MONSTER
		var evilaction = _unit.execute()
		if (evilaction != 1) { beginaction(_unit.id, evilaction[0], evilaction[1]) }
	}
}

function beginaction(_user, _action, _follows) {
	currentuser = _user
	currentaction = _action
	currentfollows = _follows
	
	if (!is_array(currentfollows)) { currentfollows	= [currentfollows] }
	
	battlewaitremain = battlewaitframes
	
	with (_user) {
		acting = true
		actiondone = false
		
		if (!is_undefined(_action.animation) and !is_undefined(_user.sprites[$ _action.animation])) {
			sprite_index = sprites[$ _action.animation]
			image_index = 0
		}
		
		other.battlestate = performaction
	}
}

function performaction(_waitanimend = false) {
	if (global.currentmember == 1) { //abbigail
		_waitanimend = true
	}
	
	if (currentuser.acting) {
		if (!_waitanimend and !currentuser.actiondone) {
			currentaction.func(currentuser, currentfollows)
			currentuser.actiondone = true
		}
		
		if (currentuser.image_index >= currentuser.image_number - 1) {
			with (currentuser) {
				sprite_index = sprites.idle
				image_index = 0
				acting = false
			}
			
			if (_waitanimend and !currentuser.actiondone) {
				currentaction.func(currentuser, currentfollows)
				currentuser.actiondone = true
			}
		}
		
		if (variable_struct_exists(currentaction, "effectsprite")) {
			if (currentaction.effectfollow == MODE.ALWAYS or currentaction.effectfollow == MODE.VARIES and array_length(currentfollows) <= 1) {
				for (var i = 0; i < array_length(currentfollows); i++) {
					instance_create_depth(currentfollows[i].x, currentfollows[i].y, currentfollows[i].depth - 1, obj_battleeffect, {sprite_index : currentaction.effectsprite})
				}
			} else {
				var _effectsprite = currentaction.effectsprite
				
				if (variable_struct_exists(currentaction, "effectspritenofollow")) { _effectsprite = currentaction.effectspritenofollow }
				instance_create_depth(x, y, depth - 100, obj_battleeffect, {sprite_index : _effectsprite})
			}
		}
	} 
	else {
		if (!instance_exists(obj_battleeffect)) {
			battlewaitremain--
			
			if (battlewaitremain <= 0) {
				battlestate = checkwin
			}
		}
	}
}

function checkwin() {
	battlestate = turnprogress
}

function turnprogress() {
	turncount++
	turn++
	
	if (turn > array_length(units) - 1) {
		turn = 0
		roundcount++
	}
	
	battlestate = selectaction
}

battlestate = selectaction

//render order
function refreshrenderorder() {
	unitrenderorder = []
	
	for (var i = 0; i < array_length(units); i++) {
		var unit = units[i]
		
		if (instance_exists(unit)) {
			array_push(unitrenderorder, unit)
		}
	}
	
	array_sort(unitrenderorder, function(_1, _2) {
		return _1.y - _2.y
	})
}

refreshrenderorder()

//switch between members	
function switchmember(_nextmember) {
	var oldunit = partyunits[global.currentmember]

	if (instance_exists(oldunit)) {
		instance_deactivate_object(oldunit)
	}
	
	global.currentmember = _nextmember
	
	if (!instance_exists(partyunits[global.currentmember])) {
		partyunits[global.currentmember] = instance_create_depth(x + 60, y + 90, depth - 10, obj_battleunitplayer, global.mypartydata[global.currentmember])
		units[0] = partyunits[global.currentmember]
	}	
	
	instance_activate_object(partyunits[global.currentmember])
	
	refreshrenderorder()
}

