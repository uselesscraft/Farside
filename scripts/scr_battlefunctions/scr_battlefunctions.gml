function encounter(_enemies, _bg, _bgsky) {
	global.battle = true
	
	instance_create_depth(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		-9999,
		obj_battlecontroller,
		{ enemies: _enemies, creator: id, battlebackground: _bg, battlesky: _bgsky}
	)
}

function changehp(_follow, _amount, _state = 0) {
	//state 0 = alive only, 1 = dead only, 2 = any
	var downed = false
	
	if (_state == 0 and _follow.hp <= 0) { downed = true }
	if (_state == 1 and _follow.hp > 0) { downed = true }
	
	if (!downed) {
		_follow.hp = clamp(_follow.hp + _amount, 0, _follow.hpmax)
	}
	
	var color = c_white
	
	if (_amount > 0) { color = c_lime }
	if (downed) { color = c_white}
	
	var text = instance_create_depth(_follow.x, _follow.y, _follow.depth - 1, obj_floattext)
	text.font = fnt_Text
	text.txt = string(_amount)
	text.col = color
	
}