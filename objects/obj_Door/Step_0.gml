/// @description Trigger
// You can write your code in this editor

if (place_meeting(x, y, obj_Player) == true) {
	obj_Player.canMove = false
	if (instance_exists(obj_Change) == false) {
		instance_create_depth(0, 0, -3000, obj_Change)
		obj_Change.next_room = next_room
		obj_Change.next_x = next_x
		obj_Change.next_y = next_y
	}
}