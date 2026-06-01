if (index != 0 && !ready)
{
	if (use_onmap_missile_sprites)
	{
		if (index == 1 || index == 13) sprite_index = bullet_onmap_s;
		if (index == 2) sprite_index = SRM_S_onmap;
		if (index == 3) sprite_index = MRM_S_onmap;
		if (index == 4) sprite_index = LRM_S_onmap;
		if (index == 5) sprite_index = ASM_S_onmap;
		if (index == 10) sprite_index = MRM_S_onmap_plasma;
		if (index == 8) sprite_index = plasma_onmap_s;
		if (index == 14) sprite_index = LRMZ_S_onmap;
		if (index == -1) sprite_index = LRMZ_M_S_onmap;
		image_yscale = -1;
		image_xscale = 1;
	}
	else
	{
		if (index == 1 || index == 13) sprite_index = bullet_s;
		if (index == 2) sprite_index = SRM_S;
		if (index == 3) sprite_index = MRM_S;
		if (index == 4) sprite_index = LRM_S;
		if (index == 5) sprite_index = ASM_S;
		if (index == 10) sprite_index = MRM_S_onmap_plasma;
		if (index == 8) sprite_index = plasma_onmap_s;
		if (index == 14) sprite_index = LRMZ_S;
		if (index == -1) sprite_index = LRMZ_M_S;
		image_yscale = -not_onmap_sprites_scale;
		image_xscale = not_onmap_sprites_scale;
		if (index == 8 || index == 10)
		{
			image_yscale = -1;
			image_xscale = 1;
		}
	}
	
	if (index > 0)
	{
		guide = global.airweapon[index, 11];
		maxspeed = (global.airweapon[index, 10] + speed * global.spd_div) / global.spd_div;
		if (damage = 0) damage = global.airweapon[index, 9];
		acc = global.airweapon[index, 12] / global.spd_div * 100;
		expl_range = global.airweapon[index, 13];
		max_range = global.airweapon[index, 8];
	}
	else
	{
		if (index == -1)
		{
			guide = 1;
			maxspeed = (global.airweapon[14, 10] + speed * global.spd_div) / global.spd_div;
			if (damage = 0) damage = global.airweapon[2, 9];
			acc = (global.airweapon[2, 12] / global.spd_div * 100) / 2;
			expl_range = global.airweapon[2, 13];
			max_range = global.airweapon[2, 8];
		}
	}
	
	if (index == 1 || index == 13) sound_play(minigun_shoot); sound_volume(minigun_shoot, global.soundvolume * 1.5);
	if (index == 2 || index == 3 || index == 4 || index == 5 || index == 14)
	sound_play(launch_missile); sound_volume(launch_missile, global.soundvolume);
	if (index == 8) sound_play(laser_cannon_sound); sound_volume(laser_cannon_sound, global.soundvolume);
	if (index == 10) sound_play(plasma_missile_launch); sound_volume(plasma_missile_launch, global.soundvolume);
	
	ready = true;
	
	image_angle = direction + 90;
}

if (ready && !plane_commander.pause)
{
	if (instance_exists(target_obj)) cur_dist = point_distance(x, y, target_obj.x, target_obj.y);
	
	if (speed < maxspeed && acc > 0) speed += acc;
	else speed = maxspeed;
	
	if (guide == 1)
	{
		if (!instance_exists(target_obj) && index != 2 && guide == 1 && side == 1 && instance_exists(EGG_Plane)) target_obj = instance_nearest(target_x, target_y, EGG_Plane);
		if (!instance_exists(target_obj) && guide == 1 && side == 2 && instance_exists(XMAS_Plane)) target_obj = instance_nearest(target_x, target_y, XMAS_Plane);
		if (!instance_exists(target_obj) && index != 2 && guide == 1 && side == 3 && instance_exists(EGG_Plane)) target_obj = instance_nearest(target_x, target_y, EGG_Plane);
		if (!instance_exists(target_obj)) instance_destroy(self);
		if ((cur_dist < expl_range && cur_dist > prev_dist) || (cur_dist < expl_range / 8)) instance_destroy(self);
		if (instance_exists(target_obj)) dir = point_direction(x,y,target_obj.x,target_obj.y) + 90;
		direction = image_angle - 90;
		/// Поворот к цели
		var diff = angle_difference(image_angle - 180, dir);
		var turn = clamp(diff, -acc, acc);
		
		// поворачиваемся
		image_angle += turn;
		// анимация крена
		if (abs(diff) > 0.5)
		    image_speed = 0.5;
		else
		    image_speed = 0;
		//if (image_angle < dir + 1 && image_angle > dir - 1) image_angle = dir;
		
		if (index == 14 && zealot_missiles > 0 && (side == 1 || side == 3))
		{
			if (instance_exists(target_obj))
			for (var i = 0; i < instance_number(EGG_Plane) && zealot_missiles > 0; i++)
			{
				var target = instance_find(EGG_Plane, i);
				if (target == target_obj || (point_distance(target.x, target.y, target_obj.x, target_obj.y) < global.airweapon[1, 8] && distance_to_object(target) < global.airweapon[2, 8] / 1.5))
				{
					var microrocket = instance_create(x, y, plane_shell);
					microrocket.index = -1; 
					microrocket.direction = point_direction(microrocket.x, microrocket.y, target.x, target.y);
					microrocket.target_obj = target;
					microrocket.target_x = target.x;
					microrocket.target_y = target.y;
					microrocket.side = side;
					microrocket.speed = speed;
					zealot_missiles--;
				}
			}
			else
			instance_destroy(self);
		}
	}
	
	if (guide == 0)
	{
		if ((target_obj == noone || !instance_exists(target_obj)) && side == 1 && instance_exists(EGG_Plane)) target_obj = instance_nearest(x,y, EGG_Plane);
		if ((target_obj == noone || !instance_exists(target_obj)) && side == 2 && instance_exists(XMAS_Plane)) target_obj = instance_nearest(x,y, XMAS_Plane);
		if ((target_obj == noone || !instance_exists(target_obj)) && side == 3 && instance_exists(EGG_Plane)) target_obj = instance_nearest(x,y, EGG_Plane);
		if (target_obj != noone && distance_to_object(target_obj) < expl_range) { if (target_obj.is_shell) instance_destroy(target_obj); instance_destroy(self); } 
	}
	
	if (!plane_commander.pause)
	{
		time_of_live+=speed / 1.1;
	}
	if (time_of_live > max_range * global.max_life_time_mn && index != -1) instance_destroy(self);
	if (time_of_live > max_range) acc = 0;
	//max_range -= 0.1;
	//if (max_range < 0) instance_destroy(self);
	
	
	if (instance_exists(target_obj)) prev_dist = distance_to_point(target_obj.x, target_obj.y);
}



if (hp < 1) instance_destroy(self);

var __b__;
__b__ = action_if_variable(guide, 1, 0);
if __b__
{
	__b__ = action_if_variable(time_of_live, max_range, 1);
	if __b__
	{
		action_effect(8, x, y, 0, 16384, 0);
	}
}
__b__ = action_if_variable(guide, 1, 0);
if __b__
{
	__b__ = action_if_variable(time_of_live, max_range * global.max_life_time_mn, 2);
	if __b__
	{
		action_kill_object();
	}
}
