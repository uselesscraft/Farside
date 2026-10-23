image_xscale = lerp(image_xscale, 1, 0.05)
image_yscale = image_xscale

image_alpha -= 0.01

if (image_alpha <= 0) {
	instance_destroy()
}