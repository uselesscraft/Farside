var textbox = instance_find(obj_TextboxBattle, 0)

if (textbox.closing == true) {
	x = lerp(x, 0, 0.3)
	
	if (instance_exists(obj_arrow) == false) {
		var arrow = instance_create_depth(x, y + 20, depth, obj_arrow)
		
		with (arrow) {
			current_state = RotationState.Up
		}
	}
} else {
	x = lerp(x, 340, 0.3)
	
	instance_destroy(obj_arrow)
}