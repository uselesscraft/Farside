function call_text(_text, _speed){
	if (instance_exists(obj_Textbox) == false) {
		var text_box = instance_create_depth(0, 0, 0, obj_Textbox)
		
		text_box.text = _text
		text_box.chara_speed = _speed
		
		return text_box
	}
	
	return noone
}
