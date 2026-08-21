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

