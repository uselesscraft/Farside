function scr_npcdir(){
	if (direction >= 225 and direction < 315)
	{
	    facing = 0
	    sprite_index = dsprite
	}
    
	if (direction >= 315 || direction < 45)
	{
	    facing = 1
	    sprite_index = rsprite
	}
    
	if (direction >= 45 and direction < 135)
	{
	    facing = 2
	    sprite_index = usprite
	}
    
	if (direction >= 135 and direction < 225)
	{
	    facing = 3
	    sprite_index = lsprite
	}
}