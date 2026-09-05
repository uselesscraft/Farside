/// @description uh pretty self explanatory
// You can write your code in this editor
instance_deactivate_all(true)

units = []
unitrenderorder = []

turn = 0

partyunits = []
enemyunits = []

enemyselect = array_length(global.myparty) - 1

turncount = 0
roundcount = 0

battlewaitframes = 30
battlewaitremain = 0

currentuser = noone
currentaction = -1
currenttargets = noone

timer = 0
timerdelay = 5

//make party
partyunits = array_create(3, noone)

partyunits[global.currentmember] = instance_create_depth(x + 60, y + 90, depth - 10, obj_battleunitpc, global.mypartydata[global.currentmember])
array_push(units, partyunits[global.currentmember])

//make enemies
for (var i = 0; i < array_length(enemies); i++) {
	enemyunits[i] = instance_create_depth(x + 250 + (i * 10), y + 80 + (i * 20), depth - 10, obj_battleunitenemy, enemies[i])
	array_push(units, enemyunits[i])
}

//activate stuff
instance_create_depth(x, y, depth - 1, obj_curtain)
instance_activate_object(obj_curtain)

instance_create_depth(x, y, depth - 1, obj_arrow)
instance_activate_object(obj_arrow)

instance_activate_object(obj_persistent)
instance_activate_object(obj_tofullscreen)

bgx = 0

//states
function selectaction() {
	var _unit = units[turn]
	
	if (!instance_exists(_unit) or _unit.hp <= 0) {
		battlestate = checkwin
		exit
	}
	
	beginaction(_unit, global.actionlibrary.attack, _unit)
}

function beginaction(_user, _action, _targets) {
	currentuser = _user
	currentaction = _action
	currenttargets = _targets
	
	if (!is_array(currenttargets)) { currenttargets	= [currenttargets] }
	
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
	if (global.currentmember == 1) {
		_waitanimend = true
	}
	
	if (currentuser.acting) {
		if (!_waitanimend and !currentuser.actiondone) {
			currentaction.func(currentuser, currenttargets)
			currentuser.actiondone = true
		}
		
		if (currentuser.image_index >= currentuser.image_number - 1) {
			with (currentuser) {
				sprite_index = sprites.idle
				image_index = 0
				acting = false
			}
			
			if (_waitanimend and !currentuser.actiondone) {
				currentaction.func(currentuser, currenttargets)
				currentuser.actiondone = true
			}
		}
		
		if (variable_struct_exists(currentaction, "effectsprite")) {
			if (currentaction.effecttarget == MODE.ALWAYS or currentaction.effecttarget == MODE.VARIES and array_length(currenttargets) <= 1) {
				for (var i = 0; i < array_length(currenttargets); i++) {
					instance_create_depth(currenttargets[i].x, currenttargets[i].y, currenttargets[i].depth - 1, obj_battleeffect, {sprite_index : currentaction.effectsprite})
				}
			} else {
				var _effectsprite = currentaction.effectsprite
				
				if (variable_struct_exists(currentaction, "effectspritenotarget")) { _effectsprite = currentaction.effectspritenotarget }
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
		partyunits[global.currentmember] = instance_create_depth(x + 60, y + 90, depth - 10, obj_battleunitpc, global.mypartydata[global.currentmember])
		array_push(units, partyunits[global.currentmember])
	}	
	
	instance_activate_object(partyunits[global.currentmember])
	
	refreshrenderorder()
}

