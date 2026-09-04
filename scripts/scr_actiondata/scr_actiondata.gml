enum MODE {
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}

global.actionlibrary =
{
	attack:
	{
		name : "Attack",
		description : "{0} attacks!",
		submenu : -1,
		targetrequired : true,
		targetisenemy: true,
		targetall : MODE.NEVER,
		animation : "attack",
		effectsprite : spr_nothing,
		effecttarget : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = ceil(_user.attack + random_range(-_user.attack * 0.25, _user.attack * 0.25))
			changehp(_targets[0], -_damage, 0)
		}
	}
}