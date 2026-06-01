//if (suicide_man)
//{
	var expl = instance_create(x, y, Explode_2_3D);
	expl.z = z;
	expl.damage = 5;	
	if (hp < 1) oArena3D.turret_corpses++;
//	if (hp >= 1) global.eggteam[massive_index, 1]--;
//}
//
//if (hp >= 1)
//{
//	global.eggteam[massive_index, 1]++;
//}
//else
//{
//	var rand = irandom_range(0, 100);
//	if (rand < 50)
//	{
//		if (index == "beetle")	oArena3D.beetle_corpses++;
//		if (index == "metalson")	oArena3D.metal_corpses++;
//		if (index == "pawn")	oArena3D.pawn_corpses++;
//		if (index == "ufo")	oArena3D.ufo_corpses++;
//	}
//}