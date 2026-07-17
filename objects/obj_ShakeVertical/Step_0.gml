if (shake > 0) {

    if (alarm[0] == -1) {
        alarm[0] = 2
    }

    valY = shake * shakeMult

    with (obj) {
        y = y + other.valY
    }

    shake -= shakeDec

} else {
    instance_destroy()
}