/// @description party data
global.myparty = array_create(3)

charaelias = obj_mainchara
charaabbigail = obj_abby
global.myparty = [charaelias, charaabbigail]
global.currentmember = 0

global.mypartydata =
[
	{
		name: "Elias",
		hp: 20,
		hpmax: 20,
		attack: 10,
		defense: 10,
		spd: 10,
		xp: 0,
		lv: 1,
		sprites : { idle: spr_eliasbattle },
		actions : [] //info: to be filled in the future
	}
	,
	{
		name: "Abbigail",
		hp: 25,
		hpmax: 25,
		attack: 5,
		defense: 5,
		spd: 20,
		xp: 0,
		lv: 1,
		sprites : { idle: spr_abbybattle },
		actions : [] //info: to be filled in the future
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

