


if ((index == 9 || index == 11 || index == 12) && instance_exists(target_obj))
{ 
	x = target_obj.x; 
	y = target_obj.y; 
	sound_play(plasma_sound); 
	sound_volume(plasma_sound, global.soundvolume); 
	if (target_obj.object_index == plane_shell) instance_destroy(target_obj);
}
if (index == 2 || index == 3 || index == 4 || index == 14 || index == -1)
{
	sound_play(explode_small_in_air); sound_volume(explode_small_in_air, global.soundvolume);
}
if (index == 5)
{
	sound_play(explode_big_in_air); sound_volume(explode_big_in_air, global.soundvolume);
}
if (index == 10)
{
	sound_play(plasma_explode); sound_volume(plasma_explode, global.soundvolume);
}
var expl = instance_create(x,y, plane_shell_expl);
expl.speed = speed;
expl.direction = direction;
expl.index = index;
expl.radius = expl_range;
if (side == 1) expl.color = c_lime;
if (side == 2) expl.color = c_red;
if (side == 3) expl.color = c_aqua;

if (instance_exists(plane_parent) && index != 4 && index != 2 && index != -1)
{
	for (i = 0; instance_exists(instance_find(plane_parent, i)); i++)
	{
		var inst = instance_find(plane_parent, i);
		if (distance_to_object(inst) < expl_range) inst.hp -= damage;
	}
	if (target_obj != noone && instance_exists(target_obj) && target_obj.is_shell && distance_to_object(target_obj) < expl_range) target_obj.hp -= damage;
	if (target_obj != noone && instance_exists(target_obj) && !target_obj.is_shell && distance_to_object(target_obj) < expl_range)
	{
		ran = irandom_range(0, 100);
		if (ran > global.hit_module_probality) {}
		else
		{
			ran = irandom_range(0, 100);
			if (ran < 25)
			{
				if (target_obj.module_hp[1] > 0)
				{
					target_obj.module_hp[1] -= damage
					if (target_obj.module_hp[1] < 0) target_obj.module_hp[1] = 0;
				}
			}
			if (ran > 25 && ran < 50)
			{
				if (target_obj.module_hp[2] > 0)
				{
					target_obj.module_hp[2] -= damage
					if (target_obj.module_hp[2] < 0) target_obj.module_hp[2] = 0;
				}
			}
			if (ran > 50 && ran < 75)
			{
				if (target_obj.module_hp[3] > 0)
				{
					target_obj.module_hp[3] -= damage
					if (target_obj.module_hp[3] < 0) target_obj.module_hp[3] = 0;
				}
			}
			if (ran > 75)
			{
				if (target_obj.module_hp[4] > 0)
				{
					target_obj.module_hp[4] -= damage
					if (target_obj.module_hp[4] < 0) target_obj.module_hp[4] = 0;
				}
				ran = irandom_range(0, 100);
				if (ran > 50)
				{
					if (target_obj.module_hp[5] > 0)
					{
						target_obj.module_hp[5] -= damage
						if (target_obj.module_hp[5] < 0) target_obj.module_hp[5] = 0;
					}
				}
				else
				{
					if (target_obj.module_hp[6] > 0)
					{
						target_obj.module_hp[6] -= damage
						if (target_obj.module_hp[6] < 0) target_obj.module_hp[6] = 0;
					}
				}
			}
		}
	}
	//exp = instance_create(x, y, plane_shell_expl);
	//exp.index = index;
}
if (instance_exists(plane_parent) && (index == 2 || index == -1))
{
	var inst = instance_nearest(x, y, plane_parent);
	if (instance_exists(target_obj)) inst = target_obj;
	if (distance_to_object(inst) < expl_range) 
	{
		if (global.eggplanes[inst.indx, 0] == 1 || global.eggplanes[inst.indx, 0] == 2 || global.eggplanes[inst.indx, 0] == 3)
		{
			var rand = choose(0, 1);
			if (rand == 0)
			{
				inst.hp -= damage;
			}
			else
			{
				inst.hp -= 99999;
			}
		}
		else
		inst.hp -= damage / 3;
	}
	//if (instance_exists(target_obj)) target_obj.hp -= damage;
	//exp = instance_create(x, y, plane_shell_expl);
	//exp.index = index;
}
if (instance_exists(plane_parent) && index == 4)
{
	count = 30;
	for (i = 0; i < count; i++)
	{
		var shell = instance_create(x + random_range(-8, 8), y + random_range(-8, 8), plane_shell);
		shell.index = 1;
		shell.guide = 0;
		shell.speed = speed;
		shell.target_obj = target_obj;
		shell.direction = image_angle - (90 + random_range(-8, 8)); //point_direction(x, y, target_obj.x + random_range(-8, 8), target_obj.y + random_range(-8, 8));
		image_angle = direction + 90;
		shell.damage = damage / count;
	}
}


