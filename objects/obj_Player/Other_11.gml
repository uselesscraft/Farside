/// @description Step - Follow
// You can write your code in this editor

if (x != xprevious or y != yprevious) {
	for (var i = array_size - 1; i > 0; i--) {
		pos_x[i] = pos_x[i - 1]
		pos_y[i] = pos_y[i - 1]
		
		_frame[i] = _frame[i - 1]
	}
	
	pos_x[0] = x
	pos_y[0] = y
	
	_frame[0] = sprite_index
}
