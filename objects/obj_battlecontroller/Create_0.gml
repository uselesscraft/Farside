/// @description uh pretty self explanatory
// You can write your code in this editor
instance_deactivate_all(true)

units = []

//make enemies
for (var i = 0; i < array_length(enemies); i++) {
	enemyunits[i] = instance_create_depth(x + 250 + (i * 10), y + 80 + (i * 20), depth - 10, obj_battleunitenemy, enemies[i])
	array_push(units, enemyunits[i])
}

//make party
partyunits[global.currentmember] = instance_create_depth(x + 60, y + 90, depth - 10, obj_battleunitpc, global.mypartydata[global.currentmember])
array_push(units, partyunits[global.currentmember])

//backgrounds
instance_create_depth(x, y, depth - 1, obj_curtain)
instance_activate_object(obj_curtain)

bgx = 0