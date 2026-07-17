if (shake > 0) {

    if (alarm[0] == -1) {
        alarm[0] = 2
    }

    valX = shake * shakeMult

    with (obj) {
        x = x + other.valX
    }

    shake -= shakeDec

} else {
    instance_destroy();
}