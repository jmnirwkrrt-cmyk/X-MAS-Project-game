instance_destroy(text_obj_red_28);
instance_destroy(text_obj_white_28);

if (image_xscale = 1 and image_yscale = 1 and !ready)
{
	if (event == 1)
	{
		but1 = instance_create(x - 288, y + 42, button_large_q_yes)
		but2 = instance_create(x + 17, y + 42, button_large_q_no)
		text = instance_create(x, y - 25, text_obj_red);
		text.w = 500;
		battle_win = plane_commander.battle_win;
		if (battle_win) text.txt = global.txt214;
		else text.txt = global.txt215;
	}
	
	if (event == 2)
	{
		but1 = instance_create(x - 288, y + 42, button_large_q_yes)
		but2 = instance_create(x + 17, y + 42, button_large_q_no)
		text = instance_create(x, y - 25, text_obj_red);
		text.txt = global.txt450;
		text.w = 500;
	}
	
	
	ready = true;
}
if (ready)
{
	if (but1.yes && event == 1)
	{
		if (battle_win) 
		{
			global.win = 1;
			for (var i = 1; i <= global.eggplanes[0, 0]; i++)
			{
				if (global.eggplanes[i, 12]	== global.EGG_escort_onfight)
				{
					if (global.eggplanes[i, 0] == 1 && !global.wiki[49, 2]) { show_debug_message("Разблокировали!"); global.wiki[49, 2] = true; }
					if (global.eggplanes[i, 0] == 2 && !global.wiki[50, 2]) { show_debug_message("Разблокировали!"); global.wiki[50, 2] = true; }
					if (global.eggplanes[i, 0] == 3 && !global.wiki[51, 2]) { show_debug_message("Разблокировали!"); global.wiki[51, 2] = true; }
					if (global.eggplanes[i, 0] == 4 && !global.wiki[52, 2]) { show_debug_message("Разблокировали!"); global.wiki[52, 2] = true; }
					if (global.eggplanes[i, 0] == 5 && !global.wiki[53, 2]) { show_debug_message("Разблокировали!"); global.wiki[53, 2] = true; }
					if (global.eggplanes[i, 0] == 6 && !global.wiki[54, 2]) { show_debug_message("Разблокировали!"); global.wiki[54, 2] = true; }
					if (global.eggplanes[i, 0] == 7 && !global.wiki[55, 2]) { show_debug_message("Разблокировали!"); global.wiki[55, 2] = true; }
				}
			}
		}
		else global.win = -1;
		if (room != Air_Test_Arena_2D) room_goto(map_room);
		else room_goto(menu_room);
	}
	else
	if (but1.yes && event == 2)
	{
		for (var i = 0; i < array_length(plane_commander.saved_planes); i++)
		{
			var saved_plane = plane_commander.saved_planes[i];
			if (saved_plane.side == 1)
			{
				global.planes[saved_plane.index, 2] = saved_plane.hp;
				global.planes[saved_plane.index, 7] = saved_plane.w_1a;
				global.planes[saved_plane.index, 9] = saved_plane.w_2a;
				global.planes[saved_plane.index, 11] = saved_plane.w_3a;
			}
			else
			if (saved_plane.side == 2)
			{
				global.santaplanes[saved_plane.index, 1] = saved_plane.hp;
				global.santaplanes[saved_plane.index, 6] = saved_plane.w_1a;
				global.santaplanes[saved_plane.index, 8] = saved_plane.w_2a;
				global.santaplanes[saved_plane.index, 10] = saved_plane.w_3a;
			}
			else
			if (saved_plane.side == 3)
			{
				global.eggplanes[saved_plane.index, 1] = saved_plane.hp;
				global.eggplanes[saved_plane.index, 6] = saved_plane.w_1a;
				global.eggplanes[saved_plane.index, 8] = saved_plane.w_2a;
				global.eggplanes[saved_plane.index, 10] = saved_plane.w_3a;
			}
		}
		room_restart();
	}
	else
		if (but2.no) 
		{ 
			if (event == 1)
			{
				for (var i = 0; i < array_length(plane_commander.saved_planes); i++)
				{
					var saved_plane = plane_commander.saved_planes[i];
					if (saved_plane.side == 1)
					{
						global.planes[saved_plane.index, 2] = saved_plane.hp;
						global.planes[saved_plane.index, 7] = saved_plane.w_1a;
						global.planes[saved_plane.index, 9] = saved_plane.w_2a;
						global.planes[saved_plane.index, 11] = saved_plane.w_3a;
					}
					else
					if (saved_plane.side == 2)
					{
						global.santaplanes[saved_plane.index, 1] = saved_plane.hp;
						global.santaplanes[saved_plane.index, 6] = saved_plane.w_1a;
						global.santaplanes[saved_plane.index, 8] = saved_plane.w_2a;
						global.santaplanes[saved_plane.index, 10] = saved_plane.w_3a;
					}
					else
					if (saved_plane.side == 3)
					{
						global.eggplanes[saved_plane.index, 1] = saved_plane.hp;
						global.eggplanes[saved_plane.index, 6] = saved_plane.w_1a;
						global.eggplanes[saved_plane.index, 8] = saved_plane.w_2a;
						global.eggplanes[saved_plane.index, 10] = saved_plane.w_3a;
					}
				}
				room_restart();
			}
			else
			if (event == 2)
			{
				instance_destroy(self);	
			}
		}
}

