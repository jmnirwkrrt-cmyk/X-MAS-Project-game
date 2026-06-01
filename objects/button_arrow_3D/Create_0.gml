
image_speed = 0;

function is_our_squad(trooper_index)
{
	if (global.XMAS_squad_onfight == 0)
	{
		if (global.team[trooper_index, 0] == global.XMAS_squad_onfight) return true;
		for (var i = 1; i <= global.planes[0,0]; i++)
		{
			if (global.team[trooper_index, 0] != i) continue;
			if (global.planes[i, 14] == 0) return true;
			else return false;
		}
	}
	else
	if (global.team[trooper_index, 0] == global.XMAS_squad_onfight) return true;
	
	
	return false;
}