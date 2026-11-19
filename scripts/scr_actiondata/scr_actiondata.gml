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
		followrequired : true,
		followisenemy: true,
		followall : MODE.NEVER,
		animation : "attack",
		effectsprite : spr_nothing,
		effectfollow : MODE.ALWAYS,
		func : function(_user, _follows)
		{
			var _damage = ceil(_user.attack + random_range(-_user.attack * 0.25, _user.attack * 0.25))
			changehp(_follows[0], -_damage, 0)
		}
	}
}