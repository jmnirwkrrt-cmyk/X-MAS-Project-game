basic_size = 0.9;
base_x = x;
base_y = y;
new_x = x;
new_y = y;
debug = global.debug; // видимый всегда
radar_range = 0;
speed_deviation = 0;

air_reveal_timer = global.air_scan_rate;
sam_hit_timer = global.sam_hit_rate;
ground_reveal_timer = global.ground_scan_rate;
accident_timer = global.accident_rate;

is_in_radar_range = false;
is_in_sam_range = false;
is_destroyed = false;

infight = false;

crash_after_spawn = false; // для отладки
bomb_base_after_spawn = false; // для отладки
squad_index = 0;
first_run = true;



type = 0;
/*
Типы эскадрильи:
1 - разведывательная
2 - господства в воздухе
3 - бомбардировочная (бомбардировка городов)
4 - бомбардировочная (атака объектов X-MAS)
5 - штурмовая (атака конвоев деда мороза и систем ПВО X-MAS)
6 - возмездие
7 - террора
8 - строительная
9 - босс (спавнится не здесь)
10 - эскадрилья наказания за утерянные изумруды (спавнится не здесь)
*/

founded = false;
visible = founded;
if (global.debug) visible = true;

image_speed = 0.25;
name = "";
text = instance_create(x, y, text_obj_red_14);
text.depthh = 8;
text.w = 500;
text.txt = "";
ready = false;
terror_created_already = false;
//drw = instance_create(x, y, draw_onmap_plane);

height = 25000;

drw = noone;

status = 0; // 0 - полёт к точке, 1 - атака цели, 2 - патруль, 3 - возврат, 4 - место террора
// 5 - бомбить, 6 - возмездие
point_x = 0;
point_y = 0;
point_xn = 0;
point_yn = 0;
target = noone;
indx = 0;
i = 0;


squad_array = array_create(0);
deployed_transport = array_create(0);
must_to_deploy_transport = array_create(0);

/// Подготавливает транспорт к высадке. Если высаживается сбитый транспорт, вставить false, если нет, true
function get_must_to_deploy_transport(index_of_escort, is_alive_transport)
{
	for (var i = 4; i - 4 < global.escortfoe[index_of_escort, 0]; i++)
	{
		var plane_index = global.escortfoe[index_of_escort, i];
		if (array_contains(deployed_transport, plane_index) || global.eggplanes[plane_index, 0] != 6 || array_contains(must_to_deploy_transport, plane_index) || ((global.eggplanes[plane_index, 1] < 1 && is_alive_transport) || (global.eggplanes[plane_index, 1] > 0 && !is_alive_transport))) continue;
		show_debug_message($"Подготовка транспорта: подошел транспорт {plane_index} эскадрилья {index_of_escort}");
		array_push(must_to_deploy_transport, plane_index);
	}
	//if (array_length(must_to_deploy_transport) == 0) show_debug_message($"Подготовка транспорта: подходящего транспорта не нашлось, эскадрилья {index_of_escort}");
	if (array_length(must_to_deploy_transport) > 0) show_debug_message($"Подготовка транспорта: подходящий транспорт найден в количестве {array_length(must_to_deploy_transport)}, эскадрилья {index_of_escort}");
}

/// unite_or_split_squads(индекс этой эскадрильи (int), массив отрядов (если разделяет отряды обратно))
/// Эта функция объединяет отряды всех транспортов в один, возвращая массив, в котором перечислены struct отрядов в каждом из которых есть новый (одинаковый у всех) индекс отряда и их первоначальный индекс или разделяет их обратно, если это возможно
function unite_or_split_squads(index_of_escort, used_squad_array)
{
	var ready_squad_array = array_create(0);
	var ready_squad_index = 0;

	if (!is_array(used_squad_array))
	{
		//show_debug_message("Приступаем к соединению отрядов");
		for (var i = 4; i - 4 < global.escortfoe[index_of_escort, 0]; i++)
		{
			//show_debug_message($"Проверяем самолет {i} индекс {global.escortfoe[index_of_escort, i]}");
			var plane_index = global.escortfoe[index_of_escort, i];
			if (array_contains(deployed_transport, plane_index) || global.eggplanes[plane_index, 0] != 6 || !array_contains(must_to_deploy_transport, plane_index) /* || global.eggplanes[plane_index, 1] < 1 */) continue;
			//show_debug_message($"Подходит!");
			if (ready_squad_index == 0) ready_squad_index = plane_index;
			for (var i1 = 1; i1 <= global.eggteam[0, 0]; i1++)
			{
				//show_debug_message($"Проверяем пехоту {i1}");
				if (global.eggteam[i1, 0] < 0 /* || global.eggplanes[global.eggteam[i1, 0], 1] < 1*/ || global.eggteam[i1, 0] != plane_index) continue;
				//show_debug_message($"Подходит!");
				var squad = {unit_index: i1, prev_squad_index: global.eggteam[i1, 0], new_squad_index : ready_squad_index}
				array_push(ready_squad_array, squad);
				global.eggteam[i1, 0] = ready_squad_index;
				//show_debug_message($"Новый индекс отряда: {ready_squad_index}");
			}
			array_push(deployed_transport, plane_index);
			array_delete(must_to_deploy_transport, array_get_index(must_to_deploy_transport, plane_index), 1);
		}
	}
	else
	{
		show_debug_message("Приступаем к разделению отрядов");
		for (var i = 0; i < array_length(used_squad_array); i++)
		{
			var squad = used_squad_array[i];
			if (global.eggplanes[squad.prev_squad_index, 1] >= 1)
			{
				global.eggteam[squad.unit_index, 0] = squad.prev_squad_index;
				array_push(ready_squad_array, squad);
			}
			else
			if (global.eggplanes[squad.new_squad_index, 1] < 1)
			for (var i1 = 4; i1 - 4 < global.escortfoe[index_of_escort, 0]; i1++)
			{
				show_debug_message($"Проверяем самолет {i1}");
				var plane_index = global.escortfoe[index_of_escort, i1];
				global.eggteam[squad.unit_index, 0] = 0;
				if (global.eggplanes[plane_index, 0] != 6 || global.eggplanes[plane_index, 1] < 1) continue;
				show_debug_message($"Подходит!");
				squad.prev_squad_index = squad.new_squad_index;
				squad.new_squad_index = plane_index;
				array_push(ready_squad_array, squad);
				global.eggteam[squad.unit_index, 0] = plane_index;
				break;
			}
		}
	}
	
	//if (array_length(ready_squad_array) < 1) show_debug_message("ВНИМАНИЕ! Ошибка при разделении/соединении отрядов!");
	return ready_squad_array;
}

global.objects_ids++;
own_id = global.objects_ids;
target_id = noone;





function base_cell_can_be_damaged(_cell)
{
	if (_cell < 1 || _cell > 36) return false;
	
	var cell_type = global.basebuilding[_cell, 0];
	
	if (is_undefined(cell_type)) return false;
	//if (cell_type == "" || cell_type == "empty") return false;
	//if (cell_type == "headquarters") return false;
	//if (cell_type == "lift") return false;
	//if (cell_type == "hangar_support") return false;
	if (global.basebuilding[_cell, 1] > 0) return false; // уже повреждена / в ремонте
	if (cell_type == "hangar" || cell_type == "radar" || cell_type == "anti_air" || cell_type == "chaos_generator" || cell_type == "lift") return true;
	else return false;
	
	//return true;
}
function damage_base_cell(_cell, _damage_time)
{
	if (_cell < 1 || _cell > 36) return false;
	
	var cell_type = global.basebuilding[_cell, 0];
	
	if (cell_type == "hangar")
	{
		global.basebuilding[_cell, 1] = _damage_time;
		global.basebuilding[_cell + 1, 1] = _damage_time;
		global.basebuilding[_cell - 6, 1] = _damage_time;
		global.basebuilding[_cell - 7, 1] = _damage_time;
		return true;
	}
	
	if (cell_type != "hangar_support") global.basebuilding[_cell, 1] += _damage_time;
	return true;
}
function damage_planes_at_hangar(_cell, bomb_story)
{
	if (_cell < 1 || _cell > 36) return false;
	for (var i = 0, p = 1; i <= _cell; i++)
	{
		if (global.basebuilding[i, 0] != "hangar") continue;
		p += 2;
		if (_cell != i) continue;
		if (irandom_range(0, 100) < global.chance_to_hit_plane * global.current_diff_mn)
		{
			if (global.planes[0, 0] >= p && global.planes[p, 14] == 0)
			{
				global.planes[p, 2] = 0;
				bomb_story.hit_plane1 = -p;
			}
			if (global.planes[0, 0] >= p - 1 && global.planes[p - 1, 14] == 0)
			{
				global.planes[p - 1, 2] = 0;
				bomb_story.hit_plane1 = -(p - 1);
			}
		}
		else
		{
			if (global.planes[0, 0] >= p && global.planes[p, 14] == 0)
			{
				global.planes[p, 2] = 1;
				bomb_story.hit_plane1 = p;
			}
			if (global.planes[0, 0] >= p - 1 && global.planes[p - 1, 14] == 0)
			{
				global.planes[p - 1, 2] = 1;
				bomb_story.hit_plane1 = (p - 1);
			}
		}
		break;
	}
	
	return bomb_story;
}
function escort_has_alive_transport(_escort_indx)
{
	for (var z = 1; z <= global.eggplanes[0, 0]; z++)
	{
		if (global.eggplanes[z, 12] != _escort_indx) continue;
		if (global.eggplanes[z, 0] != 6) continue;
		if (global.eggplanes[z, 1] < 1) continue;
		return true;
	}
	return false;
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
function escort_has_alive_flagship(_escort_indx)
{
	for (var z = 1; z <= global.eggplanes[0, 0]; z++)
	{
		if (global.eggplanes[z, 12] != _escort_indx) continue;
		if (global.eggplanes[z, 0] != 7) continue;
		if (global.eggplanes[z, 1] < 1) continue;
		return true;
	}
	return false;
}


function target_detected_message()
{
	if (!instance_exists(ask_parent))
	{
		mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
		mes.event = 1;
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
function radar_scan()
{
	var is_in_range = false;
	for (var i = 0; i < instance_number(onmap_escort); i++)
	{
		var obj = instance_find(onmap_escort, i);
		if (point_distance(x, y, obj.x, obj.y) < obj.radar_range) 
		{
			show_debug_message("Цель попала под радар!");
			if (air_reveal_timer < 0)
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
			 var r = irandom_range(0, 100);
				if (r < global.reveal_chance_air)
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

function merge_terrors(terror_site)
{
	show_debug_message($"Проверяем на уникальность террор {terror_site.indx}");
	var terror_original = noone;
	var is_terror_target = false;
	if (is_terror_target)
	for (var q1 = 0; q1 < instance_number(onmap_enemysite); q1++)
	{
		var terror = instance_find(onmap_enemysite, q1);
		if (terror.target != terror_site.target || terror == terror_site || terror.type != terror_site.type) continue;
		is_terror_target = true;
		terror_original = terror;
		show_debug_message($"Террор не уникален!");
		break;
	}
	
	if (is_terror_target)
	{
		if (terror_site.type == 3 || terror_site.type == 4  || terror_site.type == 5)
		for (var i = 1; i <= global.eggteam[0, 0]; i++)
		{
			if (global.eggteam[i, 0] != terror_site.squad_index) continue;
			global.eggteam[i, 0] = terror_original.squad_index;
			show_debug_message($"Перевели пехоту на террор {terror_original.indx}");
		}
		else
		for (var i = 1; i <= global.eggplanes[0, 0]; i++)
		{
			if (global.eggplanes[i, 12] != terror_site.escort_index) continue;
			global.eggplanes[i, 12] = terror_original.escort_index;
			show_debug_message($"Перевели самолеты на террор {terror_original.indx}");
		}
		instance_destroy(terror_site);
		exit;
	}
	else
	{
		show_debug_message($"Террор уникален!");
	}
}