/// Проверяет соблюдены ли условия победы и выбрасывает на него, если да
function game_win_check(){
	// может и не нужно
}

/// Проверяет соблюдены ли условия поражения и выбрасывает на него, если да
function game_over_check(){
	
	// Проверяем достаточно ли городов
	var cities_hided = false;
	
	if (!instance_exists(onmap_city)) { cities_hided = true; instance_activate_object(onmap_city); }
	if (instance_number(onmap_city) < global.min_cities_count && (!global.final_battle_starts || instance_number(onmap_city) == 0))
	{
		game_over();	
		return true;
	}
	else
	{
		if (cities_hided)
		{
			instance_deactivate_object(onmap_city);
		}
	}
	
	// Проверяем существует ли база
	if (!global.isbuild)
	{
		var base_hided = false;
		if (!instance_exists(global.baseonmap)) { base_hided = true; instance_activate_object(global.baseonmap); }
		if (!instance_exists(global.baseonmap))
		{
			game_over();
			return true;
		}
		else
		{
			if (base_hided)
			{
				instance_deactivate_object(global.baseonmap);
			}
		}
	}

	return false;
}

// Выбрасывает на окно поражения предварительно показав кат-сцену
function game_over(){
	if (!global.game_over)
	{
		global.game_over = true;
		global.timespeed = 0;
		var back = instance_create(0, 0, background_map);
		back.type = 15;
		room_goto(intro_game_lost);
	}
}

// Выбрасывает на окно победы предварительно показав кат-сцену
function game_win(){
	if (!global.game_over)
	{
		global.game_over = true;
		global.timespeed = 0;
		var back = instance_create(0, 0, background_map);
		back.type = 16;
		room_goto(intro_game_win);
	}
}


/// Спавнит эскадрилью-босса, но без флага, что это финальная битва. Введена для унификации, используется и для спавна босса изумрудов и босса финала игры
function spawn_boss(){
	
	// Спавним эскадрилью-разрушитель городов с копией флагмана
	var doomsday_escort = instance_create(irandom_range(0, 900), irandom_range(0, 900), onmap_enemy);
	var doomsday_escort_size = round(8 * global.current_diff_mn);
	
	global.escortfoe[0, 0]++
	global.escortfoe[global.escortfoe[0, 0], 0] = doomsday_escort_size // - число самолётов
	global.escortfoe[global.escortfoe[0, 0], 1] = 0 // - макс. скорость
	global.escortfoe[global.escortfoe[0, 0], 2] = 0 // - топливо (берётся мин. топливо среди самолей)
	global.escortfoe[global.escortfoe[0, 0], 3] = 0 // - дальность радара (берётся макс. дальность)
	global.escortfoe[global.escortfoe[0, 0], 4] = 0 // - номер самолёта 1 (остальные идут дальше)
	for (var i = 0; i < doomsday_escort_size; i++)
	{
		var plane_type = 0;
		var weapon_1 = -1;
		var weapon_2 = -1;
		var weapon_3 = -1;
		
		if (i == 0) plane_type = 7;
		else
		if (i == 1) plane_type = 4;
		else
		if (i == 2) plane_type = 4;
		else plane_type = choose(1, 2, 3);
		
		if (plane_type == 1) { weapon_1 = 8; weapon_2 = 8; }
		if (plane_type == 2) { weapon_1 = 8; weapon_2 = 10; }
		if (plane_type == 3) { weapon_1 = 9; weapon_2 = 10; }
		
		global.eggplanes[0, 0]++; // число самолётов
		global.eggplanes[global.eggplanes[0, 0], 0] = plane_type; // индекс в planedata
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
		global.eggplanes[global.eggplanes[0, 0], 13] = global.eggplanedata[plane_type, 0];
		
		
		global.escortfoe[global.escortfoe[0, 0], i + 4] = global.eggplanes[0, 0];	
	}
	
	
	doomsday_escort.type = 10;
	if (global.final_battle_starts) doomsday_escort.type = 9;
	doomsday_escort.indx = global.escortfoe[0, 0];
	doomsday_escort.point_x = doomsday_escort.x + 10;
	doomsday_escort.point_y = doomsday_escort.y + 10;
		
}

/// Спавнит эскадрилью-бомбардировщик задача которого замедлить строительство реактора на базе или просто нагадить
function spawn_bombers()
{
	var bombers_escort = instance_create(irandom_range(0, 900), irandom_range(0, 900), onmap_enemy);
	var bombers_escort_size = round(4 * global.current_diff_mn);
	
	global.escortfoe[0, 0]++
	global.escortfoe[global.escortfoe[0, 0], 0] = bombers_escort_size // - число самолётов
	global.escortfoe[global.escortfoe[0, 0], 1] = 0 // - макс. скорость
	global.escortfoe[global.escortfoe[0, 0], 2] = 0 // - топливо (берётся мин. топливо среди самолей)
	global.escortfoe[global.escortfoe[0, 0], 3] = 0 // - дальность радара (берётся макс. дальность)
	global.escortfoe[global.escortfoe[0, 0], 4] = 0 // - номер самолёта 1 (остальные идут дальше)
	for (var i = 0; i < bombers_escort_size; i++)
	{
		var plane_type = 0;
		var weapon_1 = -1;
		var weapon_2 = -1;
		var weapon_3 = -1;
		
		if (i == 0) plane_type = 4;
		else plane_type = choose(1, 2, 3, 4);
		
		if (plane_type == 1) { weapon_1 = 8; weapon_2 = 8; }
		if (plane_type == 2) { weapon_1 = 8; weapon_2 = 10; }
		if (plane_type == 3) { weapon_1 = 9; weapon_2 = 10; }
		if (plane_type == 4) { weapon_1 = -1; weapon_2 = -1; }
		
		global.eggplanes[0, 0]++; // число самолётов
		global.eggplanes[global.eggplanes[0, 0], 0] = plane_type; // индекс в planedata
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
		global.eggplanes[global.eggplanes[0, 0], 13] = global.eggplanedata[plane_type, 0];
		
		
		global.escortfoe[global.escortfoe[0, 0], i + 4] = global.eggplanes[0, 0];	
	}
	
	
	bombers_escort.type = 4;
	bombers_escort.bomb_base_after_spawn = true;
	bombers_escort.indx = global.escortfoe[0, 0];
	bombers_escort.point_x = bombers_escort.x + 10;
	bombers_escort.point_y = bombers_escort.y + 10;
		
}

/// Финал игры и бомбардировка в случае строительства реактора
function try_final_fight(){
	
	if (!global.final_battle_starts)
	{
	
		var is_building_reactor = false;
		var is_reactor_built = false;
		
		for (var i = 1; i < 37; i++)
		{
			if (global.basebuilding[i, 0] != "chaos_generator") continue;
			if (global.basebuilding[i, 1] > 0) is_building_reactor = true;
			else
			if (global.basebuilding[i, 1] == 0) is_reactor_built = true;
			break;
		}
		
		if (is_building_reactor && global.baseonmap.revealed)
		{
			var random_chance = choose(true, false, false, false, false, false);
			if (random_chance) spawn_bombers();
			else global.enemy_score += 100;
			
			if (!global.mail[10].available) 
			{ 
				new_mail(10);
			}
		}
		else
		if (is_reactor_built)
		{
			global.final_battle_starts = true; // означает что после поражения эскадрильи-босса будет завершение игры
			spawn_boss();
			if (!global.mail[11].available && global.mail[10].available) 
			{ 
				new_mail(11);
			}
			else
			if (!global.mail[12].available && !global.mail[10].available) 
			{  
				new_mail(12);
			}
		}
	}
}