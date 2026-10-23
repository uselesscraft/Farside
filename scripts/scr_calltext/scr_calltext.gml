function calltext(_text, _speed){
	if (instance_exists(obj_textbox) == false) {
		var text_box = instance_create_depth(0, 0, 0, obj_textbox)
		
		text_box.text = _text
		text_box.chara_speed = _speed
		
		return text_box
	}
	
	return noone
}
