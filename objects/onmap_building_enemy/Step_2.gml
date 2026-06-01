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
	
	accident_timer-=global.timespeed;
	if (accident_timer < 0) 
	{
		var r = irandom_range(0, 50);
		var rand_x = irandom_range(x - 75, x + 75);
		var rand_y = irandom_range(y - 75, y + 75);
		rand_x = max(0, min(900, rand_x));
		rand_y = max(0, min(900, rand_y));
		
		var is_collision_with_map = place_meeting(rand_x, rand_y, map_obj);
		
		if (r == 6 && is_collision_with_map)
		{
			var event = instance_create(rand_x, rand_y, text_obj_small_event);
			event.txt = global.txt271 + $"{time_m.txt}";
			global.enemy_score += 75; // патруль уничтожен
			global.xmas_score -= 75;
		}
		if (r == 7 && is_collision_with_map)
		{
			var event = instance_create(rand_x, rand_y, text_obj_small_event);
			event.txt = global.txt277 + $"{time_m.txt}";
			global.enemy_score += 100; // опорный пункт уничтожен
			global.xmas_score -= 100;
		}
		if (r == 5 && is_collision_with_map)
		{
			var event = instance_create(rand_x, rand_y, text_obj_small_event);
			event.txt = global.txt275 + $"{time_m.txt}";
			global.enemy_score += 150; // неопознанные роботы
			global.xmas_score -= 100;
		}
		if (r == 6 && is_collision_with_map)
		{
			var event = instance_create(rand_x, rand_y, text_obj_small_event);
			event.txt = global.txt276 + $"{time_m.txt}";
			global.enemy_score += 150; // неопознанная стройка
			global.xmas_score -= 100;
		}
		accident_timer = global.accident_rate;
	}
	
	if (instance_exists(onmap_city))
	{
		var nearest_city = instance_nearest(base_x, base_y, onmap_city);
		santa_will_support = global.santa_will_support_next_assault || (point_distance(base_x, base_y, nearest_city.base_x, nearest_city.base_y) < 100 && global.xmas_score > 0);
	}
	else
	{
		santa_will_support = global.santa_will_support_next_assault;
	}
	
	intercept_timer-=global.timespeed;
	if (type == 2 && intercept_timer < 1)
	{
		intercept_timer = 900;
		if (instance_exists(onmap_escort) || instance_exists(onmap_ally))
		{
			if (instance_exists(onmap_escort))
			var target = instance_nearest(x, y, onmap_escort);
			else target = instance_nearest(x, y, onmap_ally);
			
			if (distance_to_object(target) < 200 * (image_xscale + basic_size))
			{
				global.escortfoe[0, 0]++
				global.escortfoe[global.escortfoe[0, 0], 0] = 1 // - число самолётов
				global.escortfoe[global.escortfoe[0, 0], 1] = 0 // - макс. скорость
				global.escortfoe[global.escortfoe[0, 0], 2] = 0 // - топливо (берётся мин. топливо среди самолей)
				global.escortfoe[global.escortfoe[0, 0], 3] = 0 // - дальность радара (берётся макс. дальность)
				global.escortfoe[global.escortfoe[0, 0], 4] = 0 // - номер самолёта 1 (остальные идут дальше)
				
				var weapon_1 = 9;
				var weapon_2 = 10;
				var weapon_3 = -1;
				
				global.eggplanes[0, 0]++; // число самолётов
				global.eggplanes[global.eggplanes[0, 0], 0] = 3; // индекс в planedata
				global.eggplanes[global.eggplanes[0, 0], 1] = global.eggplanedata[global.eggplanes[global.eggplanes[0, 0], 0], 1]; // хп
				global.eggplanes[global.eggplanes[0, 0], 2] = global.eggplanedata[global.eggplanes[global.eggplanes[0, 0], 0], 6]; // скорость
				global.eggplanes[global.eggplanes[0, 0], 3] = global.eggplanedata[global.eggplanes[global.eggplanes[0, 0], 0], 12]; // место для десанта
				global.eggplanes[global.eggplanes[0, 0], 4] = global.eggplanedata[global.eggplanes[global.eggplanes[0, 0], 0], 13]; // место для груза
				global.eggplanes[global.eggplanes[0, 0], 5] = weapon_1; // оружие 1
				if (weapon_1 > -1) global.eggplanes[global.eggplanes[0, 0], 6] = global.airweapon[weapon_1, 2];
				else global.eggplanes[global.eggplanes[0, 0], 6] = -1;
				global.eggplanes[global.eggplanes[0, 0], 7] = weapon_2;
				if (weapon_2 > -1) global.eggplanes[global.eggplanes[0, 0], 8] = global.airweapon[weapon_2, 2];
				else global.eggplanes[global.eggplanes[0, 0], 8] = -1;
				global.eggplanes[global.eggplanes[0, 0], 9] = weapon_3;
				if (weapon_3 > -1) global.eggplanes[global.eggplanes[0, 0], 10] = global.airweapon[weapon_3, 2];
				else global.eggplanes[global.eggplanes[0, 0], 10] = -1;
				global.eggplanes[global.eggplanes[0, 0], 11] = 0;
				global.eggplanes[global.eggplanes[0, 0], 12] = global.escortfoe[0, 0];
				
				// FIX: имя по текущему plane_type, а не по eggplanes[1,0]
				global.eggplanes[global.eggplanes[0, 0], 13] = global.eggplanedata[plane_type, 0];
				
				global.escortfoe[global.escortfoe[0, 0], 4] = global.eggplanes[0, 0];
				
				var interceptor = instance_create(x, y, onmap_enemy);
				interceptor.type = 2;
				interceptor.indx = global.escortfoe[0, 0];
				interceptor.point_x = interceptor.x + 10;
				interceptor.point_y = interceptor.y + 10;
				interceptor.target = target;
				interceptor.base_x = base_x;
				interceptor.base_y = base_y;
				interceptor.status = 1;
				
				show_debug_message($"База {indx} запустила перехватчик {interceptor.indx}!");
			}
		}
	}
	
	if (squad_index == 0 && revealed)
	{
		squad_index = irandom_range(-999, -900);
		global.eggteam[0, 0]++;
		global.eggteam[global.eggteam[0, 0], 0] = squad_index; // индекс транспортника
		global.eggteam[global.eggteam[0, 0], 1] = 10; // численность
		global.eggteam[global.eggteam[0, 0], 2] = "metalson"; // тип
	}
	if (santa_squad_index == 0 && santa_will_support && revealed)
	{
		santa_squad_index = irandom_range(-999, -900);
		global.santateam[0, 0]++;
		global.santateam[global.santateam[0, 0], 0] = santa_squad_index; // индекс транспортника
		global.santateam[global.santateam[0, 0], 1] = 12 / global.current_diff_mn; // численность
		global.santa_will_support_next_assault = false;
	}
	
	if (instance_exists(text))
	{
		if (image_xscale < 1.3) text.txt = "";
		else if (revealed) text.txt = name;
		text.x = x;
		text.y = y;
		if (instance_exists(ask_parent)) text.image_alpha = 1;
		else text.image_alpha = 0;
	}
	
	if (!revealed)
	{
		visible = false;
		if (global.debug) visible = true;
		if (revealed_timer < 0)
		{
			var radar_result = radar_scan();
			if (radar_result == 2) { target_detected_message(); revealed = true; }
			revealed_timer = global.ground_scan_rate;
		}
		revealed_timer -= global.timespeed;
	}
	else
	{
		new_mail(20);
		visible = true;
	}
	
	
	
	
	
	
	
	
}

