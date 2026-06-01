
/// Функция отвечающая за спавн изумрудов и последствия их утери, запускать каждый час!
function emerald_spawning()
{
	var emerald_must_spawn = false;
	var doomsday_stage = 0; // 0 - не начался, 1 - спавн эскадрильи, 2 - ждём, пока её уничтожат и обнуляем
	// Наступил ли день спавна изумрудов
	if (!global.emerald_spawn_started) global.emerald_spawn_started = time_m.day_current >= global.emerald_spawn_starting_day;
	// Доступна ли технология поиска изумрудов
	if (global.emerald_spawn_started) global.emerald_spawn_started = global.emerald_starts_even_if_no_tech || global.technologies[22, 1];
	
	if (global.emerald_lost_count_to_invasion <= global.passed_emeralds_counts) doomsday_stage = 1;
	emerald_must_spawn = doomsday_stage == 0;
	if (doomsday_stage == 1)
	for (var i = 0; i < instance_number(onmap_enemy); i++)
	{
		var enemy = instance_find(onmap_enemy, i);
		if (enemy.type != 10) continue;
		doomsday_stage = 2;
		break;
	}
	
	if (emerald_must_spawn) emerald_must_spawn = global.emerald_spawn_started && global.total_emerald_counts < global.max_emeralds_counts
	
	if (emerald_must_spawn)
	{
		var chance = irandom_range(0, 200);
		if (chance <= global.emerald_hour_spawn_chance)
		{
			global.total_emerald_counts++;
			var emerald_site = instance_create(450, 450, onmap_enemysite);
			
			if (instance_exists(map_obj))
			for (var max_attempts = 250; max_attempts > 0; max_attempts--)
			{
				var x_site = irandom_range(0, 900);
				var y_site = irandom_range(0, 900);
				var is_collision_with_map = false;
				with (emerald_site) is_collision_with_map = place_meeting(x_site, y_site, map_obj);
				if (!is_collision_with_map) continue;
				emerald_site.x = x_site;
				emerald_site.y = y_site;
				emerald_site.base_x = x_site;
				emerald_site.base_y = y_site;
				emerald_site.time *= 2;
				show_debug_message("Место выпадения изумруда размещено случайно на суше!")
				break;
			}
			else
			{
				var x_site = irandom_range(450 - 150, 450 + 150);
				var y_site = irandom_range(450 - 150, 450 + 150);
				emerald_site.x = x_site;
				emerald_site.y = y_site;
				emerald_site.base_x = x_site;
				emerald_site.base_y = y_site;
				show_debug_message("Место выпадения изумруда размещено рядом с центром!");
			}
			
			emerald_site.type = 5;
			emerald_site.indx = global.total_emerald_counts;
			emerald_site.name = global.txt395 + string(global.total_emerald_counts);
			
			global.eggteam[0, 0]++;
			var squad_index = -global.eggteam[0, 0];
			
			global.eggteam[global.eggteam[0, 0], 0] = squad_index; // индекс транспортника
			global.eggteam[global.eggteam[0, 0], 1] = 10; // численность
			global.eggteam[global.eggteam[0, 0], 2] = "beetle"; // тип
			
			if (global.enemy_score >= global.score_to_metal) 
			{
				global.eggteam[0, 0]++;	
				global.eggteam[global.eggteam[0, 0], 0] = squad_index; // индекс транспортника
				global.eggteam[global.eggteam[0, 0], 1] = 10; // численность
				global.eggteam[global.eggteam[0, 0], 2] = "metalson"; // тип
			}
			if (global.enemy_score >= global.score_to_pawn) 
			{
				global.eggteam[0, 0]++;	
				global.eggteam[global.eggteam[0, 0], 0] = squad_index; // индекс транспортника
				global.eggteam[global.eggteam[0, 0], 1] = 10; // численность
				global.eggteam[global.eggteam[0, 0], 2] = "pawn"; // тип
			}
			if (global.enemy_score >= global.score_to_ufo) 
			{
				global.eggteam[0, 0]++;	
				global.eggteam[global.eggteam[0, 0], 0] = squad_index; // индекс транспортника
				global.eggteam[global.eggteam[0, 0], 1] = 10; // численность
				global.eggteam[global.eggteam[0, 0], 2] = "ufo"; // тип
			}
			
			show_debug_message($"Появилось место выпадения изумруда {emerald_site.indx} с отрядом {squad_index}");
			if (global.current_diff_mn != global.heavy_diff_mn) 
			{
				time_m.menu_messages[0,0]++;
				time_m.menu_messages[time_m.menu_messages[0,0],0] = global.map_messages_text_7; 
				time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
				time_m.new_messages = true;
			}
			emerald_site.squad_index = squad_index;
		}
	}
	
	if (doomsday_stage > 0)
	{
		if (doomsday_stage == 1)
		{
			spawn_boss();
			
			if (!instance_exists(ask_parent))
			{
				var mes = instance_create(1200 / 2, 900 / 2, ask_message);
				mes.event = 26;
			}
			else
			{
				time_m.menu_messages[0,0]++;
				time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt396; 
				time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
				time_m.new_messages = true;
			}
			new_mail(8);
			doomsday_stage = 2;
		}
		else
		if (doomsday_stage == 2)
		{
			for (var i = 0; i < instance_number(onmap_enemy); i++)
			{
				var enemy = instance_find(onmap_enemy, i);
				if (enemy.type != 10) continue;
				doomsday_stage = 0;
				global.total_emerald_counts -= global.passed_emeralds_counts;
				global.passed_emeralds_counts = 0;
				new_mail(9);
				break;
			}
			
		}
		
		
		
		
	}

}