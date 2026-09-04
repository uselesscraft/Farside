/// @description Set up
// You can write your code in this editor

var data_struct = {
	hp : 20,
	defense : 0,
	name : "Paper Frog"
}

max_hp = data_struct.hp
hp = max_hp
_defense = data_struct.defense

start_die = false

enum EnemyState {
    IDLE,
    MOVE,
    ATTACK,
    HITSTUN,
    DEAD
}

state = EnemyState.IDLE

/////

function enemy_take_damage(_amount) {
    hp -= _amount

    audio_play_sound(snd_Hit, 10, false)
    audio_sound_pitch(snd_Hit, random_range(1, 1.2))

    var shake = instance_create_depth(0, 0, 0, obj_ShakeVertical)
    shake.obj = id
}

function enemy_die() {
    if (instance_exists(obj_shake) == false) {
        var shake = instance_create_depth(0, 0, 0, obj_shake)
        shake.obj = id

        audio_play_sound(snd_HitFinish, 10, false)
        alarm[0] = 25
    }
}

function enemy_death_update() {
    if (start_die) {
        image_alpha -= 0.1
        image_blend = c_black

        if (image_alpha <= 0) {
            instance_destroy()
        }
    }
}