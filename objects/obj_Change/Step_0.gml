/// @description TP
// You can write your code in this editor

if (room != next_room and back) {
	room = next_room
	
	obj_Player.x = next_x
	obj_Player.y = next_y
	
	obj_Player.canMove = true
} else if (room == next_room and delete_obj) {
	instance_destroy()
}