/// @description Manage Enemy Actions
// You can write your code in this editor

if (distance_to_object(obj_mainchara) > 30) {
    state = EnemyState.IDLE
} else {
    state = EnemyState.MOVE
}

if (abs(angle_difference(obj_mainchara.direction, direction)) > 179) {
    if (distance_to_object(obj_mainchara) < 15 and keyboard_check_pressed(vk_enter) and hp > 0) {
		enemy_take_damage(2 - _defense)
		
		state = EnemyState.HITSTUN
	}
}

if (hp <= 0) {
	enemy_die()
	
	state = EnemyState.DEAD
}

enemy_death_update()

switch state {

case EnemyState.MOVE:
	x = sine(x, 0.1, 3)
	y = sine(y, 0.1, 3)
break

}

direction = 270
depth = -bbox_bottom