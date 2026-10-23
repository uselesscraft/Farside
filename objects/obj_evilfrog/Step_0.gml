if (interactkey()) {
	shake = instance_create_depth(0, 0, 0, obj_shakevertical)
	shake.obj = obj_evilfrog
	shake.shakeDec = 0.35
	shake.shake = 4
	shake.objy = y
}