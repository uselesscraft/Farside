/// @description applies fullscreen
// You can write your code in this editor


if (keyboard_check_pressed(vk_f11)) {
	if (window_get_fullscreen() == false) {
		window_set_fullscreen(true)
	} else {
		window_set_fullscreen(false)
		window_enable_borderless_fullscreen(false)
		window_center()
	}
}