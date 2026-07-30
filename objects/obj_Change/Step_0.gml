/// @description TP
// You can write your code in this editor

if (room != next_room and back) {
	room = next_room
	
	obj_mainchara.x = next_x
	obj_mainchara.y = next_y
	
	obj_mainchara.canMove = true
} else if (room == next_room and delete_obj) {
	instance_destroy()
}