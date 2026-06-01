basic_size = 0.35;
base_x = x;
base_y = y;
new_x = x;
new_y = y;

image_speed = 0.25;
name = "";
text = instance_create(x, y, text_obj_red_14);
text.w = 500;
text.txt = "";

squad_index = 0; // индекс транспортника отряда участвующего в терроре
santa_squad_index = 0; // индекс отряда санты участвующего в терроре (гарнизон)
santa_escort_index = 0; // индекс авиациии санты участвующего в терроре (гарнизон)
escort_index = 0; // индекс эскадрильи участвующей в терроре\воздушном бою
map_index = test_room;
battle_type = 0;
revealed = false;
infight = false;
is_destroyed = false;

air_reveal_timer = global.air_scan_rate; // air потому что оно чаще

indx = -1;
type = 0; // 1 - воздушный бой (бомбардировка), 2 - воздушный бой (перехват нашего транспорта), 
//3 - наземный бой (террор), 4 - наземный бой (штурмуют объект), 5 - наземный бой (враг нашел изумруд), 6 - сбитый корабль
time = global.timed_terror_removal / global.current_diff_mn; // количество времени в секундах до исчезновения
//global.wait_if_target = false;

global.objects_ids++;
own_id = global.objects_ids;
target_id = noone;
target = noone;



function target_detected_message()
{
	if (!instance_exists(ask_parent))
	{
		var mes = instance_create(1200 / 2, 900 / 2, ask_message);
		mes.event = 25;
		mes.target = self;
		mes.ufo_number = indx;
	}
	else
	{
		time_m.menu_messages[0,0]++;
		time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt394; 
		time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
		time_m.new_messages = true;
	}
}

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
			if (air_reveal_timer < 0 || global.current_diff_mn != global.heavy_diff_mn)
			{
				if (global.current_diff_mn != global.heavy_diff_mn)
				{
					show_debug_message("Цель обнаружилась (мгновенно)!");
					return 2;
				}
				else
				{
					var r = irandom_range(0, 100);
					if (r < global.reveal_chance_air)
					{
						show_debug_message("Цель обнаружилась!");
						return 2;
					}
					else
					show_debug_message("Цель не обнаружилась!");
				}
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
			if (air_reveal_timer < 0)
			{
				if (global.current_diff_mn != global.heavy_diff_mn)
				{
					show_debug_message("Цель обнаружилась (мгновенно)!");
					return 2;
				}
				else
				{
					var r = irandom_range(0, 100);
					if (r < global.reveal_chance_air)
					{
						show_debug_message("Цель обнаружилась!");
						return 2;
					}
					else
					show_debug_message("Цель не обнаружилась!");
				}
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
			if (air_reveal_timer < 0)
			{
			 var r = irandom_range(0, 100);
				if (r < global.radar_chance)
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


function escort_has_alive_bomber(_escort_indx)
{
	for (var z = 1; z <= global.eggplanes[0, 0]; z++)
	{
		if (global.eggplanes[z, 12] != _escort_indx) continue;
		if (global.eggplanes[z, 0] != 4 && global.eggplanes[z, 0] != 5) continue;
		if (global.eggplanes[z, 1] < 1) continue;
		return true;
	}
	return false;
}