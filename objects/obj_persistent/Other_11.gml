/// @description enemies data
global.enemies =
{	
	frog:
	{
		name: "EVIL Frog",
		hp: 10,
		hpmax: 10,
		attack: 2,
		defense: 1,
		xp: 5,
		sprites : { idle: spr_FrogEvil },
		actions : [global.actionlibrary.attack],
		execute : function()
		{
			//generic attack script
			var action = actions[0]
			
			var allfollows = array_filter(obj_battlecontroller.partyunits, function(_unit, _index)
			{
				return instance_exists(_unit) and (_unit.hp > 0) //if hp is higher than 0, it returns true. otherwise, it returns false
			})
			var follow = allfollows[irandom(array_length(allfollows) - 1)]
			
			return[action, follow]
			
			//same result could be achieved through an if statement but whatever... dsfgjfgugdsr
		}
	}
}

