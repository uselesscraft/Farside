if (movemenu(MOVE_FUNCTION.DOWN)) {
	choice++
}

if (movemenu(MOVE_FUNCTION.UP)) {
	choice--
}

if (choice > 1) {
	choice = 0
} else if (choice < 0) {
	choice = 1
}

obj_arrow._y = 106 + 16 * choice
obj_arrow.hor_sfx = false
obj_arrow.ver_sfx = true

if (interactkey()) {
	if (choice == 0) {
		room_goto(room_mainmenu)
	}
}