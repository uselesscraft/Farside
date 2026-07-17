xspd = random_range(0.4, 1.0)

parallax = random_range(0.4, 0.9)

if (parallax < 0.6) {
    depth = 297
    image_alpha = random_range(0.4, 0.5)
}
else if (parallax < 0.8) {
    depth = 298
    image_alpha = random_range(0.3, 0.4)
}
else {
    depth = 299
    image_alpha = random_range(0.2, 0.3)
}

image_xscale = random_range(0.7, 1.0)
image_yscale = image_xscale

base_y = y