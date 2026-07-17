/// @description applies fullscreen
// You can write your code in this editor


if (keyboard_check_pressed(vk_backspace)) {
	if (window_get_fullscreen() == false) {
		window_set_fullscreen(true)
	} else {
		window_set_fullscreen(false)
		window_center()
	}
}