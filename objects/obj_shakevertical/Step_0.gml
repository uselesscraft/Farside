if (shake > 0) {

    if (alarm[0] == -1) {
        alarm[0] = 4
    }

    valy = shake * shakemult

    with (obj) {
        y = other.firsty + other.valy
    }
} else {
    instance_destroy()
	
	with (obj) {
		y = other.firsty
	}
}