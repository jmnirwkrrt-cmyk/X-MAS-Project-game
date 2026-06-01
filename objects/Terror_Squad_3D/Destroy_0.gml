if (suicide_man)
{
	var expl = instance_create(x, y, Explode_2_3D);
	expl.z = z;
	expl.damage = 50;	
	if (hp >= 1 && oArena3D.battle_type != 3 && oArena3D.battle_type != 2 && oArena3D.battle_type != 5) global.eggteam[massive_index, 1]--;
	hp = 0;
}

if (hp >= 1)
{
	global.eggteam[massive_index, 1]++;
}
else
{
	global.killed_total++;
	var rand = irandom_range(0, 100);
	if (rand < 50)
	{
		if (index == "beetle")	oArena3D.beetle_corpses++;
		if (index == "metalson")	oArena3D.metal_corpses++;
		if (index == "pawn")	oArena3D.pawn_corpses++;
		if (index == "ufo")	oArena3D.ufo_corpses++;
	}
	if (instance_exists(X_MAS_team_3D))
	{
		var obj = instance_nearest(x, y, X_MAS_team_3D);
		if (obj.hp > 0 && variable_instance_exists(obj, "massive_index"))
		{
			global.team[obj.massive_index, 6] += global.xp_per_kill;
			if (obj.object_index == ally_obj_3D || obj.object_index == oPlayer3D) global.xp_gain_total += global.xp_per_kill;
		}
	}
}