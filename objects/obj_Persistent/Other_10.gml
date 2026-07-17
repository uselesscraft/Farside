/// @description party data
global.myparty = array_create(3)

charaelias = obj_Player
charaabbigail = obj_abby
global.myparty = [charaelias, charaabbigail]

global.mypartydata =
[
	{
		name: "Elias",
		hp: 20,
		hpmax: 20,
		strength: 10,
		hope: 0, //equivalent xp
		level: 1,
		durability: 10,
		spd: 10,
		sprites : { idle: spr_eliasright },
		actions : [] //info: to be filled in the future
	}
	,
	{
		name: "Abbigail",
		hp: 25,
		hpmax: 25,
		strength: 5,
		hope: 0,
		level: 1,
		durability: 5,
		spd: 20,
		sprites : { idle: spr_abbyright },
		actions : []
	}
	//,
	//{
	//	name: "Daan",
	//	hp: 30,
	//	hpmax: 30,
	//	strength: 15 ,
	//	hope: 0,
	//	level: 1,
	//	durability: 20,
	//	spd: 5,
	//	actions : []
	//}
]