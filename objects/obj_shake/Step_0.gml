if (shake >= 0) {

    if (alarm[0] == -1) {
        alarm[0] = 4
    }

    valx = shake * shakemult

    with (obj) {
        x = other.firstx + other.valx
    }

} else {
    obj.x = firstx
	
	instance_destroy()
}
