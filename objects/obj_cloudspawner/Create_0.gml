// Create particle system
ps = part_system_create();

// Create particle type
cloud = part_type_create();

part_type_sprite(cloud, spr_cloud, true, false, false)
part_type_size(cloud, 0.7, 1, 0, 0)
part_type_alpha1(cloud, random_range(0.2, 0.8))
part_type_life(cloud, 9999, 9999)
part_type_speed(cloud, 0.2, 0.6, 0, 0)
part_system_depth(ps, 500)

alarm[0] = 60

repeat 20 {
	instance_create_depth(random(room_width), random(room_height), -500, obj_cloud)
}

depth = 4000