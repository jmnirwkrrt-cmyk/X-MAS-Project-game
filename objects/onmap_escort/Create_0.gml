basic_size = 0.9;
x = global.baseonmap.x;
y = global.baseonmap.y;
base_x = x; // логические координаты (реальное местоположение)
base_y = y; // 
new_x = x; // экранные координаты
new_y = y;
height = 10000;
debug = true;
radar_range = 0;

infight = false;

image_speed = 0.25;
name = "";
text = instance_create(x, y, text_obj_red_14);
text.depthh = 8;
text.w = 500;
text.txt = "";
ready = false;
drw = instance_create(x, y, draw_onmap_plane);

status = 0; // 0 - полёт к точке, 1 - атака цели, 2 - патруль, 3 - возврат, 4 - место террора, 5 - преследовать, 6 - преследовать, пока не спустится
// 7 - запущен, определить цель
point_x = 0; // логические
point_y = 0;
point_xn = 0; // экранные
point_yn = 0;
target = noone;
indx = 0;
var i;


if (!global.first_intercept && global.intros)
{
	global.first_intercept = true;
	global.timespeed = 0;
	room_goto(intro_tornado_launch);
}

squad_array = array_create(0);
/// unite_or_split_squads(индекс этой эскадрильи (int), массив отрядов (если разделяет отряды обратно))
/// Эта функция объединяет отряды всех транспортов в один, возвращая массив, в котором перечислены struct отрядов в каждом из которых есть новый (одинаковый у всех) индекс отряда и их первоначальный индекс или разделяет их обратно, если это возможно
function unite_or_split_squads(index_of_escort, used_squad_array)
{
	var ready_squad_array = array_create(0);
	var ready_squad_index = 0;

	if (!is_array(used_squad_array))
	{
		for (var i = 4; i - 4 < global.escortplayer[index_of_escort, 0]; i++)
		{
			var plane_index = global.escortplayer[index_of_escort, i];
			if (global.planes[plane_index, 0] < 7 || global.planes[plane_index, 0] > 9 || global.planes[plane_index, 2] < 1) continue;
			if (ready_squad_index == 0) ready_squad_index = plane_index;
			for (var i1 = 0; i1 < global.team[0, 0]; i1++)
			{
				if (global.planes[plane_index, 4] < 1 || global.team[i1, 0] != plane_index) continue;
				var squad = {unit_index: i1, prev_squad_index: global.team[i1, 0], new_squad_index : ready_squad_index}
				array_insert(ready_squad_array, array_length(ready_squad_array), squad);
				global.team[i1, 0] = ready_squad_index;
			}
		}
	}
	else
	{
		for (var i = 0; i < array_length(used_squad_array); i++)
		{
			var squad = used_squad_array[i];
			if (global.planes[squad.prev_squad_index, 2] >= 1)
			{
				global.team[squad.unit_index, 0] = squad.prev_squad_index;
				array_insert(ready_squad_array, array_length(ready_squad_array), squad);
			}
			else
			if (global.planes[squad.new_squad_index, 2] < 1)
			for (var i1 = 4; i1 - 4 < global.escortplayer[index_of_escort, 0]; i1++)
			{
				var plane_index = global.escortplayer[index_of_escort, i1];
				global.team[squad.unit_index, 0] = 0;
				if (global.planes[plane_index, 0] < 7 || global.planes[plane_index, 0] > 9 || global.planes[plane_index, 2] < 1) continue;
				squad.prev_squad_index = squad.new_squad_index;
				squad.new_squad_index = plane_index;
				array_insert(ready_squad_array, array_length(ready_squad_array), squad);
				global.team[squad.unit_index, 0] = plane_index;
				break;
			}
		}
	}
	
	if (array_length(ready_squad_array) < 1) show_debug_message("ВНИМАНИЕ! Ошибка при разделении/соединении отрядов X-MAS!");
	return ready_squad_array;
}

global.objects_ids++;
own_id = global.objects_ids;
target_id = noone;