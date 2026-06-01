basic_size = 0.5;
base_x = x;
base_y = y;
new_x = x;
new_y = y;

image_speed = 0.25;
name = "";
radar_range = 0;
AA_range = 0;
AA_damage = 0;
building_time = 86400 * 10;
text = instance_create(x, y, text_obj_red_14);
text.depthh = 8;
text.w = 500;
text.txt = "";
type = 0; // 1 - база роботов (сухопутные миссии без транспортника), 2 - крепость роботов (бонусом спавнит перехватчики)
revealed = false; // обнаружена x-mas или нет
indx = 0;

santa_will_support = false;

battle_type = 4;

intercept_timer = 900;
accident_timer = global.accident_rate * 1.5;
revealed_timer = global.ground_scan_rate;

global.objects_ids++;
own_id = global.objects_ids;
target_id = noone;

santa_squad_index = 0;
squad_index = 0;





function target_detected_message()
{
	if (!instance_exists(ask_parent))
	{
		mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
		mes.event = 16;
		mes.target = self;
		mes.ufo_number = indx;
	}
	else
	{
		time_m.menu_messages[0,0]++;
		time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt237 + global.txt181 + string(indx); 
		time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
		time_m.new_messages = true;
	}
}

/// Скан радара. Возвращает 0 если цель не обнаружена, 1 если в зоне видимости и 2 если обнаружена
/// Скан радара. Возвращает 0 если цель не обнаружена, 1 если в зоне видимости и 2 если обнаружена
function radar_scan()
{
	var is_in_range = false;
	for (var i = 0; i < instance_number(onmap_escort); i++)
	{
		var obj = instance_find(onmap_escort, i);
		if (point_distance(x, y, obj.x, obj.y) < obj.radar_range) 
		{
			show_debug_message("Цель попала под радар!");
			if (revealed_timer < 0)
			{
			 var r = irandom_range(0, 100);
				if (r < global.reveal_chance_building)
				{
					show_debug_message("Цель обнаружилась!");
					return 2;
				}
				else
				show_debug_message("Цель не обнаружилась!");
			}
			is_in_range = true;
		}
		//var obj = instance_find(map_obj, i);
		//if (obj.radar_range)
	}	
	for (var i = 0; i < instance_number(onmap_ally); i++)
	{
		var obj = instance_find(onmap_ally, i);
		if (point_distance(x, y, obj.x, obj.y) < obj.radar_range) 
		{
			show_debug_message("Цель попала под радар!");
			if (revealed_timer < 0)
			{
			 var r = irandom_range(0, 100);
				if (r < global.reveal_chance_building)
				{
					show_debug_message("Цель обнаружилась!");
					return 2;
				}
				else
				show_debug_message("Цель не обнаружилась!");
			}
			is_in_range = true;
		}
		//var obj = instance_find(map_obj, i);
		//if (obj.radar_range)
	}	
	for (var i = 0; i < instance_number(onmap_building); i++)
	{
		var obj = instance_find(onmap_building, i);
		if (point_distance(x, y, obj.x, obj.y) < obj.radar_range && obj.building_time < 1) 
		{
			show_debug_message("Цель попала под радар!");
			if (revealed_timer < 0)
			{
			 var r = irandom_range(0, 100);
				if (r < global.reveal_chance_base)
				{
					show_debug_message("Цель обнаружилась!");
					return 2;
				}
				else
				show_debug_message("Цель не обнаружилась!");
			}
			is_in_range = true;
		}
		//var obj = instance_find(map_obj, i);
		//if (obj.radar_range)
	}	
	
	if (is_in_range) return 1;
	return 0;
}