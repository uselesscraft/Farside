if (shake > 0) {

    if (alarm[0] == -1) {
        alarm[0] = 2
    }

    valx = shake * shakemult

    with (obj) {
        x = x + other.valx
    }

    shake -= shakedec

} else {
    obj.x = firstx
}

