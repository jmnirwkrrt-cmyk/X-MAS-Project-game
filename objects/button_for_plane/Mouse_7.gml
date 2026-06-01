image_index = 0;

sound_play(ui_select); sound_volume(ui_select, global.soundvolume);

if (ready && instance_exists(XMAS_Plane))
{
	if (index == 0) 
	{
		image_angle = -90;
		i++;
		if (i >= instance_number(XMAS_Plane)) i = 0;
		if (instance_exists(instance_find(XMAS_Plane, i))) 
		{
			while (i < instance_number(XMAS_Plane) && (instance_exists(plane_commander.selected_plane) && plane_commander.selected_plane == instance_find(XMAS_Plane, i) || instance_find(XMAS_Plane, i).side == 3)) i++;
			if (i >= instance_number(XMAS_Plane)) i = 0;
			while (i < instance_number(XMAS_Plane) && (instance_exists(plane_commander.selected_plane) && plane_commander.selected_plane == instance_find(XMAS_Plane, i) || instance_find(XMAS_Plane, i).side == 3)) i++;
			if (instance_exists(instance_find(XMAS_Plane, i)))
			{
				plane_commander.selected_plane = instance_find(XMAS_Plane, i);
				selected_plane = instance_find(XMAS_Plane, i);
				plane_parent.selected = false;
				selected_plane.selected = true;
				plane_commander.i = i;
			}
		}
	}
	if (index == 1 && instance_exists(selected_plane) && !instance_exists(ask_parent)) 
	{
		image_angle = 0;
		__view_set( e__VW.XView, 0, selected_plane.x - __view_get( e__VW.WView, 0 ) / 2 )
		__view_set( e__VW.YView, 0, selected_plane.y - __view_get( e__VW.HView, 0 ) / 2 )
	}
	if (index == 2 && instance_exists(XMAS_Plane)) 
	{
		image_angle = 90;
		i--;
		if (i < 0) i = instance_number(XMAS_Plane) - 1;
		if (instance_exists(instance_find(XMAS_Plane, i))) 
		{
			while (i > 0 && (instance_exists(plane_commander.selected_plane) && plane_commander.selected_plane == instance_find(XMAS_Plane, i) || instance_find(XMAS_Plane, i).side == 3)) i--;
			if (i < 0) i = instance_number(XMAS_Plane) - 1;
			while (i > 0 && (instance_exists(plane_commander.selected_plane) && plane_commander.selected_plane == instance_find(XMAS_Plane, i) || instance_find(XMAS_Plane, i).side == 3)) i--;
			plane_commander.selected_plane = instance_find(XMAS_Plane, i);
			selected_plane = instance_find(XMAS_Plane, i);
			plane_parent.selected = false;
			selected_plane.selected = true;
			plane_commander.i = i;
		}
	}
	if (index == 3 && instance_exists(selected_plane))
	{
		selected_plane.task = "return";
	}
	if (index == 4 && instance_exists(selected_plane) && instance_exists(EGG_Plane))
	{
		var target_prev = noone;
		var target_new = noone;
		for (var q = 0; q < instance_number(EGG_Plane); q++)
		{
			target_new = instance_find(EGG_Plane, q);
			if (target_new.hp < 1 || target_new.task == "destroyed" || target_new.task == "returned") continue;
			if (target_prev == noone) { target_prev = target_new; continue; }
			if (point_distance(selected_plane.x, selected_plane.y, target_new.x, target_new.y) >= point_distance(selected_plane.x, selected_plane.y, target_prev.x, target_prev.y)) continue;
			target_prev = target_new;
		}
		selected_plane.enemy_target_indx = target_prev;
		selected_plane.task = "attack";
	}
	if (instance_exists(selected_plane) && instance_exists(selected_plane) && index == 5 && selected_plane.can_avoid == 1 && selected_plane.roll_cooldown < 0)
	{
		selected_plane.task = "avoid";
		selected_plane.roll_cooldown = global.roll_cooldown;
	}
	if (index == 6)
	{
		plane_commander.pause = !plane_commander.pause;
	}
	
	if (index == 7 && instance_exists(selected_plane))
	{
		selected_plane.w_1use = !selected_plane.w_1use
	}
	if (index == 8 && instance_exists(selected_plane))
	{
		selected_plane.w_2use = !selected_plane.w_2use
	}
	if (index == 9 && instance_exists(selected_plane))
	{
		selected_plane.w_3use = !selected_plane.w_3use
	}
	if (index == 10 && instance_exists(selected_plane))
	{
		selected_plane.beam_aause = !selected_plane.beam_aause
	}
	if (index == 11 && instance_exists(selected_plane))
	{
		selected_plane.beam_aruse = !selected_plane.beam_aruse
	}
	
	
}



if (ready)
{
	if (index == 0) 
	{
		image_angle = -90;
	}
	if (index == 1) 
	{
		image_index = 2;
		image_angle = 0;
	}
	if (index == 2) 
	{
		image_angle = 90;
	}
	if (index == 3) 
	{
		image_angle = 0;
		image_index = 4;
	}
	if (index == 4) 
	{
		image_angle = 0;
		image_index = 6;
	}
	if (index == 5) 
	{
		image_angle = 0;
		image_index = 8;
	}
	if (index == 6) 
	{
		image_angle = 0;
		image_index = 10;
	}
}

