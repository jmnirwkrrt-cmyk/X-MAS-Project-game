if (first_run && instance_exists(original_object))
{
	first_run = false;
	
	if (original_object.object_index == oPlayer3D && oArena3D.battle_end)
	{
		if (original_object.hp >= 1)
		{
			global.team[massive_index, 4] = original_object.hp;
			if (variable_instance_exists(original_object, "healed_hp")) global.team[massive_index, 4] = max(1, original_object.hp - original_object.healed_hp);
		}
		else
		{
			global.team[massive_index, 4] = 0;
			if (oArena3D.battle_end) global.loss_total++;
		}
		
		if (original_object.ammo < original_object.max_ammo / 1.2 && original_object.hero_numb > 7 && original_object.hero_numb < 12)
		{
			global.team[massive_index, 7] = true;	
		}
		
		instance_destroy(obj_sight_or_pointer);
	}
	else
	if (original_object.object_index == ally_obj_3D && oArena3D.battle_end)
	{
		if (image_blend == c_white)
		{
			if (original_object.hp >= 1)
			{
				global.team[massive_index, 4] = original_object.hp;
				if (variable_instance_exists(original_object, "healed_hp")) global.team[massive_index, 4] = max(1, original_object.hp - original_object.healed_hp);
			}
			else
			{
				global.team[massive_index, 4] = 0;
				if (oArena3D.battle_end) global.loss_total++;
			}
			if (original_object.ammo < original_object.max_ammo / 1.2 && original_object.hero_numb > 7 && original_object.hero_numb < 12)
			{
				global.team[massive_index, 7] = true;	
			}
		}
		else
		if (image_blend == c_blue)
		{
			if (original_object.hp >= 1 && oArena3D.battle_end)
			{
				global.santateam[massive_index, 1]++;
			}
		}	
	}
	else
	if (original_object.object_index == beetle_3D || original_object.object_index == egg_pawn_3D 
	|| original_object.object_index == metal_sonic_3D || original_object.object_index == ufo_tank_3D)
	{
		if (original_object.hp >= 1 && oArena3D.battle_end)
		{
			global.eggteam[massive_index, 1]++;
		}
		else
		if (original_object.hp < 1 && oArena3D.battle_end)
		{
			global.killed_total++;
		}
	}
	
	
	instance_deactivate_object(original_object);
}