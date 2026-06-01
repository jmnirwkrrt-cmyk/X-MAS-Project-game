if (type != 5) revealed = true;
else
{
	if (!revealed)
	{
		air_reveal_timer--;
		if (global.can_search_emeralds)
		{
			var radar_status = radar_scan();
			if (radar_status == 2) { revealed = true; target_detected_message(); }
			if (air_reveal_timer < 0) air_reveal_timer = global.air_scan_rate;
		}
	}
	
	visible = revealed;
	if (global.debug) visible = true;
}

if (instance_exists(map_obj))
{
	image_xscale = map_obj.image_xscale - basic_size;
	image_yscale = map_obj.image_yscale - basic_size;
	if (base_x > map_obj.basic_x) new_x = base_x + (base_x - 450) * (map_obj.image_xscale - 1);
	if (base_x < map_obj.basic_x) new_x = base_x - (450 - base_x) * (map_obj.image_xscale - 1);
	if (base_y > map_obj.basic_y) new_y = base_y + (base_y - 450) * (map_obj.image_yscale - 1);
	if (base_y < map_obj.basic_y) new_y = base_y - (450 - base_y) * (map_obj.image_yscale - 1);
	
	
	x = new_x + (map_obj.x - map_obj.basic_x);
	y = new_y + (map_obj.y - map_obj.basic_y);
	
	if (instance_exists(text))
	{
		text.txt = "";
		text.x = x;
		text.y = y;
		if (image_xscale > 1.3 && revealed) text.txt = name;
	}
	
}


if (type == 1) sprite_index = enemy_site_sprite; // воздушный бой (бомбардировка)
if (type == 2) sprite_index = enemy_site_sprite; // воздушный бой (перехват)
if (type == 3) sprite_index = enemy_site_sprite; // террор
if (type == 4) sprite_index = enemy_site_sprite; // штурм объекта
if (type == 5) sprite_index = event_site_sprite; // изумруд
if (type == 6) sprite_index = crash_site_sprite; // сбитый транспорт


// удаление по истечению события
time -= global.timespeed;
if (!instance_exists(target) && type != 0 && type != 6 && type != 5) { instance_destroy(self); exit; }
if (instance_exists(onmap_escort) && global.wait_if_target)
{
	is_targeted = false;
	for (var i = 0; i < instance_number(onmap_escort); i++)
	{
		if (instance_find(onmap_escort, i).target == self) { is_targeted = true; break; }	
	}
	if (!is_targeted && time < 1) 
	{ 
		if (target != noone)
		{
			new_mail(23);
			if (!instance_exists(ask_parent))
			{
				var mes = instance_create(1200 / 2, 900 / 2, ask_message);
				mes.event = 28;	
			}
			time_m.menu_messages[0,0]++;
			time_m.menu_messages[time_m.menu_messages[0,0],0] = global.map_messages_text_6 + target.name + "!";
			time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
			time_m.new_messages = true;
			if (target.object_index == onmap_city) global.lost_cities_count++;
			instance_destroy(target);
		}
		if (type == 5) global.passed_emeralds_counts++;
		instance_destroy(self); 
		exit;
	}
}
else
{
	if (time < 1) 
	{ 
		if (target != noone)
		{
			new_mail(23);
			if (!instance_exists(ask_parent))
			{
				var mes = instance_create(1200 / 2, 900 / 2, ask_message);
				mes.event = 28;	
			}
			time_m.menu_messages[0,0]++;
			time_m.menu_messages[time_m.menu_messages[0,0],0] = global.map_messages_text_6 + target.name + "!";
			time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
			time_m.new_messages = true;
			if (target.object_index == onmap_city) global.lost_cities_count++;
			instance_destroy(target);	
		}
		if (type == 5) global.passed_emeralds_counts++;
		instance_destroy(self); 
		exit;	
	}
}
//


// удаление по причине смерти причастных
var have_air = false;
var have_inf = false;
for (var i = 1; i <= global.eggteam[0, 0]; i++)
{
	if (global.eggteam[i, 0] == squad_index && global.eggteam[i, 1] > 0) { have_inf = true; break; }	
}
for (var i = 1; i <= global.eggplanes[0, 0]; i++)
{
	if (global.eggplanes[i, 12] == escort_index && global.eggplanes[i, 1] > 0) { have_air = true; break; }	
}
//if (global.debug) show_debug_message($"Есть пехота? {have_inf} Есть авиация? {have_air}")	

if (!have_air && !have_inf && !infight) { show_debug_message($"Умерли причастные террор {name} {string(have_inf)} {string(have_air)}"); instance_destroy(self); is_destroyed = true; exit; }
if (have_air && type == 1 && !escort_has_alive_bomber(escort_index) && !infight) { show_debug_message($"Сбиты бомбардировщики террор {name}"); instance_destroy(self); is_destroyed = true; exit; }


// выбор карты
if (!have_air && have_inf)
{
	if (type == 3)
	{
		battle_type = 2;
	}
	else
	if (type == 4)
	{
		battle_type = 1;
	}
	else
	if (type == 5)
	{
		battle_type = 3;
	}
	else
	if (type == 6)
	{
		battle_type = 1;
	}	
}
if (!have_air && have_inf && map_index == test_room)
{
	
	if ((instance_exists(onmap_city) && distance_to_object(instance_nearest(x, y, onmap_city)) < 100) || (instance_exists(target) && target.object_index == onmap_city))
	{
		//var r = irandom_range(1, 4);
		//if (r == 1) map_index = map_city_1;	
		//if (r == 2) map_index = map_city_2;	
		//if (r == 3) map_index = map_city_3;	
		//if (r == 4) map_index = map_city_4;	
		map_index = ground_map;
		var r = irandom_range(1, 4);
		if (r == 1)
		{
			global.santateam[0, 0]++; // количество в массиве
			global.santateam[global.santateam[0, 0], 0] = global.santateam[0, 0]; // индекс отряда
			global.santateam[global.santateam[0, 0], 1] = irandom_range(4, 10); // численность
			santa_squad_index = global.santateam[0, 0];
		}
		else
		if (r == 2)
		{
			global.santateam[0, 0]++; // количество в массиве
			global.santateam[global.santateam[0, 0], 0] = global.santateam[0, 0]; // индекс отряда
			global.santateam[global.santateam[0, 0], 1] = irandom_range(8, 12); // численность
			santa_squad_index = global.santateam[0, 0];
		}
		else
		if (r == 3)
		{
			global.santateam[0, 0]++; // количество в массиве
			global.santateam[global.santateam[0, 0], 0] = global.santateam[0, 0]; // индекс отряда
			global.santateam[global.santateam[0, 0], 1] = irandom_range(2, 5); // численность
			santa_squad_index = global.santateam[0, 0];
		}
		else
		if (r == 4)
		{
			global.santateam[0, 0]++; // количество в массиве
			global.santateam[global.santateam[0, 0], 0] = global.santateam[0, 0]; // индекс отряда
			global.santateam[global.santateam[0, 0], 1] = irandom_range(1, 2); // численность
			santa_squad_index = global.santateam[0, 0];
		}
	}
	else
	if ((instance_exists(onmap_building) && distance_to_object(instance_nearest(x, y, onmap_building) < 100) || (instance_exists(target) && target.object_index == onmap_building)))
	{
		var r = irandom_range(1, 4);
		//if (r == 1) map_index = map_base_1;	
		//if (r == 2) map_index = map_base_2;	
		//if (r == 3) map_index = map_base_3;	
		//if (r == 4) map_index = map_base_4;	
		map_index = ground_map;
		r = irandom_range(1, 4);
		if (r == 1)
		{
			global.santateam[0, 0]++; // количество в массиве
			global.santateam[global.santateam[0, 0], 0] = global.santateam[0, 0]; // индекс отряда
			global.santateam[global.santateam[0, 0], 1] = irandom_range(1, 2); // численность
			santa_squad_index = global.santateam[0, 0];
		}
		else
		if (r == 2)
		{
			global.santateam[0, 0]++; // количество в массиве
			global.santateam[global.santateam[0, 0], 0] = global.santateam[0, 0]; // индекс отряда
			global.santateam[global.santateam[0, 0], 1] = irandom_range(2, 4); // численность
			santa_squad_index = global.santateam[0, 0];
		}
	}
	else
	{
		var r = irandom_range(1, 4);
		//if (r == 1) map_index = map_ground_1;	
		//if (r == 2) map_index = map_ground_2;	
		//if (r == 3) map_index = map_ground_3;	
		//if (r == 4) map_index = map_ground_4;	
		map_index = ground_map;
		r = irandom_range(1, 4);
		if (r == 1)
		{
			global.santateam[0, 0]++; // количество в массиве
			global.santateam[global.santateam[0, 0], 0] = global.santateam[0, 0]; // индекс транспортника отряда
			global.santateam[global.santateam[0, 0], 1] = irandom_range(1, 3); // численность
			santa_squad_index = global.santateam[0, 0];
		}
	}
}
else
if (have_air && map_index == test_room)
{
	map_index = plane_map;
	if ((instance_exists(onmap_city) && distance_to_object(instance_nearest(x, y, onmap_city)) < 100)  || (instance_exists(target) && target.object_index == onmap_city))
	{
		show_debug_message($"Террор {name} - обработаны союзные самолеты!");
		if (santa_escort_index == 0) santa_escort_index = abs(indx); // В случае, если уже есть авиация Санты
		var rand_plane_count = irandom_range(0, round(global.max_santa_planes_at_terror / global.current_diff_mn));
		for (var i = rand_plane_count; i > 0; i--)
		{
			var w_1 = irandom_range(1, 3);
			var w_2 = irandom_range(1, 3);
			var plane = 1;
			if (global.santa_upgraded_planes) plane = 2;
			global.santaplanes[0, 0]++;
			global.santaplanes[global.santaplanes[0, 0], 0] = plane; // индекс в planedata, Ветер
			global.santaplanes[global.santaplanes[0, 0], 1] = global.planedata[global.santaplanes[global.santaplanes[0, 0], 0], 1]; // хп
			global.santaplanes[global.santaplanes[0, 0], 2] = 0; // скорость
			global.santaplanes[global.santaplanes[0, 0], 3] = global.planedata[global.santaplanes[global.santaplanes[0, 0], 0], 12]; // место для десанта
			global.santaplanes[global.santaplanes[0, 0], 4] = global.planedata[global.santaplanes[global.santaplanes[0, 0], 0], 13]; // место для груза
			global.santaplanes[global.santaplanes[0, 0], 5] = w_1; // оружие 1
			global.santaplanes[global.santaplanes[0, 0], 6] = global.airweapon[w_1, 2]; // БК оружия 1
			global.santaplanes[global.santaplanes[0, 0], 7] = w_2; // оружие 2
			global.santaplanes[global.santaplanes[0, 0], 8] = global.airweapon[w_2, 2]; // БК оружия 2
			global.santaplanes[global.santaplanes[0, 0], 9] = global.planedata[global.santaplanes[global.santaplanes[0, 0], 0], 4]; // оружие 3
			global.santaplanes[global.santaplanes[0, 0], 10] = 0; // БК оружия 3
			global.santaplanes[global.santaplanes[0, 0], 11] = 0; // Статус (0 - перемещение, 1 - патруль, 2 - перехват, 3 - бомбардировка)
			global.santaplanes[global.santaplanes[0, 0], 12] = santa_escort_index; // номер эскадрильи, 0 = на базе
			global.santaplanes[global.santaplanes[0, 0], 13] = global.planedata[global.santaplanes[global.santaplanes[0, 0], 0], 0]; // название
		}
	}
	else
	{
		
	}
}
//


if (instance_exists(target)) target_id = target.own_id;
//show_debug_message($"Террор: х {x} y {y} base_x {base_x} base_y {base_y}");



