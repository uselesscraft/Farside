function sine(value, freq, ampl) {
	if (variable_instance_exists(self.id, "timer") == false) {
		timer = 0
	}
	
    var math = sin(timer * freq) * ampl
	timer++
	
	return value + math
}