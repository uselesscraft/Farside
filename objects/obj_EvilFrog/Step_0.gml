if (interactkey()) {
	shake = instance_create_depth(0, 0, 0, obj_ShakeVertical)
	shake.obj = obj_EvilFrog
	shake.shakeDec = 0.35
	shake.shake = 4
	shake.objy = y
}