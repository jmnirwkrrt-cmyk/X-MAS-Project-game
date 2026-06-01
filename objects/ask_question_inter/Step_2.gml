if (image_xscale = 1 and image_yscale = 1 and !ready)
{
	but1 = instance_create(x - 288, y + 42, button_large_q_yes)
	but2 = instance_create(x + 17, y + 42, button_large_q_no)
	text = instance_create(x, y - 25, text_obj_red);
	text.w = 500;
	text.txt = global.txt178;
	ready = true;
}

if (ready)
{
	if (event == 0) text.txt = global.txt182;
	if (event == 1) text.txt = string_insert(global.txt181, enemy_indx, 0);
	if (event == 2) text.txt = string_insert(global.txt180, enemy_indx, 0);
	if (event == 3) text.txt = global.txt183;
	if (event == 4) text.txt = string_insert(global.txt278, enemy_indx, 0);
	if (instance_exists(target) && event > 1) text.txt = target.name;
	text.txt = string_insert(global.txt178, text.txt, 0);
}



if (image_xscale = 1 and image_yscale = 1 and but1.yes)
{
	instance_destroy(mouse_target_inter);
	if (indx == 0)
	{
		if (global.debug && instance_exists(target)) show_debug_message($"Подтверждена сообщением цель {target.object_index}");
		var back = instance_create(0, 0, background_map);
		back.type = 8;
		back.target_x = target_x;
		back.target_y = target_y;
		instance_activate_object(onmap_enemy);
		instance_activate_object(onmap_enemysite);
		instance_activate_object(onmap_building_enemy);
		instance_activate_object(onmap_building);
		if (instance_exists(target) && event != 0) back.target = target;
		instance_deactivate_object(onmap_enemy);
		instance_deactivate_object(onmap_enemysite);
		instance_deactivate_object(onmap_building_enemy);
		instance_deactivate_object(onmap_building);
	}
	if (indx != 0)
	{
		var i;
		for (i = 0; i < instance_number(onmap_escort); i++)
		{
			obj = instance_find(onmap_escort, i);
			if (obj.indx != indx) continue;
			if (event == 1)
			{
				obj.point_x = -1;
				obj.point_y = -1;
				for (i = 0; i < instance_number(onmap_enemy); i++)
				{
					var is = instance_find(onmap_enemy, i)
					if (is.indx != enemy_indx) continue;
					obj.target = is;
					break;
				}
				obj.status = 1;
			}
			if (event == 2)
			{
				obj.point_x = -2;
				obj.point_y = -2;
				for (i = 0; i < instance_number(onmap_enemysite); i++)
				{
					var is = instance_find(onmap_enemysite, i)
					if (is.indx != enemy_indx) continue;
					if (string_length(is.name) > 0) text.txt = string_insert(is.name, enemy_indx, 0);
					obj.target = is;
					//global.XMAS_escort_onfight = obj.indx;
					//global.EGG_escort_onfight = obj.target.indx;
					//room_goto(plane_map);
					break;
				}
				obj.status = 4;
			}
			if (event == 3)
			{
				for (i = 0; i < instance_number(onmap_building); i++)
				{
					var is = instance_find(onmap_building, i)
					if (is.type != 1) continue;
					obj.target = is;
					obj.point_x = is.x;
					obj.point_y = is.y;
					break;
				}
				obj.status = 3;
			}
			if (event == 4)
			{
				for (i = 0; i < instance_number(onmap_building_enemy); i++)
				{
					var is = instance_find(onmap_building_enemy, i)
					obj.target = is;
					obj.point_x = is.x;
					obj.point_y = is.y;
					break;
				}
				obj.status = 4;
			}
			if (event == 0)
			{
				obj.point_x = target_x;
				obj.point_y = target_y;
				obj.status = 0;
			}
			break;
		}
	}
	instance_destroy(self);
}
else
if (image_xscale = 1 and image_yscale = 1 and but2.no) { global.click = true; mes = instance_create(1200 / 2, 100, ask_message); mes.event = -10; instance_destroy(self); }


