if (!instance_exists(ask_build) and global.base_exists and !instance_exists(ask_parent) && type == 1)
{
	button_sound_effect();
	image_index = 0;
	instance_create(mouse_x, mouse_y, mouse_target_inter);
	var mes = instance_create(1200 / 2, 100, ask_message);
	mes.event = -10;
}

if (!instance_exists(ask_build) && global.base_exists && type == 2)
{
	button_sound_effect();
	image_index = 0;
	
	
	if (true) //indx == 0)
	{
		if (instance_exists(mess)) instance_destroy(mess);
		//if (instance_exists(instance_nearest(x, y, ask_message_big))) instance_destroy(instance_nearest(x, y, ask_message_big));	
		
		var back = instance_create(0, 0, background_map);
		back.type = 8;
		
		target_x_mod = 0;
		target_y_mod = 0;
		if (target_x > map_obj.basic_x) target_x_mod = target_x + (target_x - 450) * (map_obj.image_xscale - 1);
		if (target_x < map_obj.basic_x) target_x_mod = target_x - (450 - target_x) * (map_obj.image_xscale - 1);
		if (target_y > map_obj.basic_y) target_y_mod = target_y + (target_y_mod - 450) * (map_obj.image_yscale - 1);
		if (target_y < map_obj.basic_y) target_y_mod = target_y - (450 - target_y_mod) * (map_obj.image_yscale - 1);
		
		instance_activate_object(onmap_enemy);
		instance_activate_object(onmap_enemysite);
		instance_activate_object(onmap_building_enemy);
		instance_activate_object(onmap_building);
		back.target_x = target_x_mod;
		back.target_y = target_y_mod;
		if (instance_exists(target)) 
		{ 
			back.target = target; 
			back.target_x = target.base_x;
			back.target_y = target.base_y;
		}
		else
		{
			back.target_x = target_x_mod;
			back.target_y = target_y_mod;
		}
		instance_deactivate_object(onmap_enemy);
		instance_deactivate_object(onmap_enemysite);
		instance_deactivate_object(onmap_building_enemy);
		instance_deactivate_object(onmap_building);
	}
		//if (indx != 0)
		//{
		//var i;
		//for (i = 0; i < instance_number(onmap_escort); i++)
		//{
		//obj = instance_find(onmap_escort, i);
		//if (obj.indx != indx) continue;
		//if (event == 0)
		//{
		//obj.point_x = target_x;
		//obj.point_y = target_y;
		//obj.status = 0;
		//}
		//
		//break;
		//}
		//}
		
}
