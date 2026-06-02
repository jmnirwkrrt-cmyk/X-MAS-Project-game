/// @description  Общее
global.stock = 0; // макс. число вещей на базе
global.radarrange = 0; // радиус радара базы
global.maxciv = 0; // макс. число жителей на базе вообще
global.currentciv = 0; // текущее число жителей на базе
global.maxplanes = 0; // макс. самолётов на базе
global.workshopplace = 0;
global.laboratoryplace = 0


splav = 0;
energo = 0;
energyscrap = 0;
metalson = 0;
motobug = 0;
pawn = 0;
cyberdisc = 0;
turret = 0;

if (global.debug && keyboard_check_released(vk_f6))
{
	global.passed_emeralds_counts++;
	show_debug_message($"Текущее число потерянных изумрудов: {global.passed_emeralds_counts}");
}
if (global.debug && keyboard_check_released(vk_f3))
{
	day_current++;	
}
if (global.debug && keyboard_check_released(vk_f2))
{
	global.money += 1000000;
}
if (global.debug && keyboard_check_released(vk_f4))
{
	global.enemy_score -= 1000;
	show_debug_message($"Текущее число очков противника: {global.enemy_score}");
}

if (global.current_diff_mn == global.light_diff_mn)
{
	global.emerald_starts_even_if_no_tech = false;
	global.emerald_spawn_starting_day = 10;
	global.wait_if_target = true;
}
else
if (global.current_diff_mn == global.normal_diff_mn)
{
	global.emerald_starts_even_if_no_tech = true;
	global.emerald_spawn_starting_day = 7;
	global.wait_if_target = true;
}
else
if (global.current_diff_mn == global.heavy_diff_mn)
{
	global.emerald_starts_even_if_no_tech = true;
	global.emerald_spawn_starting_day = 5;
	global.wait_if_target = false;
}

if (instance_exists(map_obj) && !global.game_loading)
{
	if (game_over_check()) exit;
}

current_stock();

seconds_current += global.timespeed;
if (seconds_current > 59) 
{ 
	minutes_current++; 
	minutes_spawn_enemy_current++; 
	minutes_spawn_ally_current++; 
	seconds_current -= 60;
	
	if (global.team[1, 4] < 1 && !global.mail[13].available && global.operatives_can_die) // Смерть соника
	{
		new_messages = true;
		new_mail(13);
		if (global.team[3, 4] > 0) // Эми жива
		{
			new_mail(3);
		}
	}
	if (global.planes[2, 2] < 1) // Уничтожение X-Торнадо
	{
		new_mail(4);
	}
	if (global.ally_score_to_modernization <= global.xmas_score && global.technologies[1, 1]) { new_mail(21); global.santa_upgraded_planes = true; }
}
if (minutes_current > 59) 
{ 
	hours_current++; 
	minutes_current -= 60;
	emerald_spawning(); 
	try_final_fight(); 
	try_random_mail();
}
if (hours_current > 23) 
{ 
	if (global.autosave) do_autosave = true;
	day_current++; hours_current -= 24; 
	global.enemy_score += global.enemy_score_gain_daily + irandom_range(-global.enemy_score_gain_daily_deviation, global.enemy_score_gain_daily_deviation); 
	global.enemy_score_month += global.enemy_score_gain_daily;
	if (global.enemy_score < global.xmas_score / 4) global.enemy_score = global.xmas_score / 4;
	else
	if (global.xmas_score > global.enemy_score * 2) global.enemy_score *= 1.5;
	
	enemies_per_day = 0;
	allies_per_day = 0;
	global.add_foe_count_per_day += global.max_foe_count_per_day * global.add_foe_count_per_day_coeff;
	
	if (global.enemy_score < 1) global.enemy_score = 1;
	
	if (global.mail[3].available || global.mail[45].available)
	{
		var random_chance = choose(0, 0, 1);
		if (random_chance == 1 && (global.current_diff_mn == global.heavy_diff_mn || global.debug)) room_goto(intro_amy_screamer);
	}
	if (global.team[2, 4] > 0)
	{
		if (global.wiki[49, 2] || global.wiki[50, 2] || global.wiki[51, 2]) new_mail(26);	
		if (global.wiki[54, 2]) new_mail(42);	
		//if (global.technologies[21, 2]) new_mail(29);	улучшенные методы обнаружения
		//if (global.technologies[25, 2]) new_mail(29);	
		if (global.technologies[20, 1]) new_mail(29);	
	}
	if (global.team[4, 4] > 0)
	{
		if (global.emerald_spawn_started) new_mail(27);
	}
	
	
	if (global.mail[43].available && global.team[1, 4] > 0 && !global.mail[44].available && !global.mail[46].available)
	{
		var rand_chance = choose(true, false, false, false);
		if (rand_chance)
		{
			var chili_dogs_index = -1;
			for (var i = 1; i <= global.atstockpile[0, 0]; i++)
			{
				if (global.atstockpile[i, 0] == 38 && global.atstockpile[i, 1] > 0) { chili_dogs_index = i; break; }
			}
			
			if (chili_dogs_index == -1)
			{
				new_mail(44);
				if (global.team[3, 4] > 0) new_mail(45);
				if (global.operatives_can_die) global.team[1, 4] = 0;
				else global.team[1, 4] = 1;
				show_debug_message($"Чили-доги сворованы!");
			}
			else
			{
				new_mail(46);
				global.atstockpile[chili_dogs_index, 1] = 0;
				global.team[1, 6] += 1;
				global.xmas_score += 50;
				show_debug_message($"Чили-доги спасены!");
			}
		}
	}
	
}
if (day_current > 31) { month_current++; day_current -= 32; }
if (month_current > 12) { year_current++; month_current -= 13; }

txt = "";
if (hours_current < 10) { txt = string_insert("", "0", 0); }
txt = string_insert(txt, hours_current, 0);
txt = string_insert(txt, ":", 0);
if (minutes_current < 10) { txt = string_insert(txt,"0", 0); }
txt = string_insert(txt, minutes_current, 0);

research();

/// Производство
splav = 0;
energo = 0;
energyscrap = 0;
metalson = 0;
motobug = 0;
pawn = 0;
cyberdisc = 0;
turret = 0;

construction();



/// Самолёты и пехота

planes_and_infantry_service();

/// Появление противника на карте


AI_on_map();


if ((day_current == 7 || day_current == 14 || day_current == 21 || day_current == 28) && report_day == 0) report_day = 1;
if (day_current != 7 && day_current != 14 && day_current != 21 && day_current != 28) report_day = 0;

if (report_day == 1)
{
	report_day = 2;	
	global.money += global.money_weekly_gain - global.service_paid;
	var back = instance_create(0, 0, background_map);
	back.type = 9;
	global.xmas_score_month = global.xmas_score;
}

//if (keyboard_check_released(vk_f11)) global.game_loading = true;
//if (keyboard_check_released(vk_f12)) save_game_json($"XMAS_savegame_v_{string(global.game_version)}_{string(global.save_number)}.dat");
if (keyboard_check_released(vk_f7) && global.debug) hours_current++;
if (keyboard_check_released(vk_f11)) show_debug_message($"Число очков противника: {global.enemy_score}, число наших очков: {global.xmas_score}");

if (global.game_loading) 
{ 
	if (!global.game_autoloading)
	{
		if (file_exists($"XMAS_savegame_v_{string(global.game_version)}_{string(global.save_number)}.dat")) 
		load_game_json($"XMAS_savegame_v_{string(global.game_version)}_{string(global.save_number)}.dat");
	}
	else
	{
		if (file_exists("XMAS_savegame_autosave.dat")) 
		load_game_json("XMAS_savegame_autosave.dat");
		else
		{
			if (file_exists($"XMAS_savegame_v_{string(global.game_version)}_{string(global.save_number)}.dat")) 
			load_game_json($"XMAS_savegame_v_{string(global.game_version)}_{string(global.save_number)}.dat");
		}
	}
	
	if (file_exists("xmas_settings.ini"))
	{
		ini_open("xmas_settings.ini");
		global.musicvolume = ini_read_real("settings", "music_volume", 1.0);
		global.soundvolume = ini_read_real("settings", "sound_volume", 1.0);
		global.intros = "1" == ini_read_string("settings", "show_intro", "1");
		global.operatives_can_die = "1" == ini_read_string("settings", "operatives_can_die", "1");
		global.current_diff_mn = ini_read_real("settings", "difficult", global.current_diff_mn);
		global.save_number = ini_read_real("save", "save_number", global.save_number);
		global.autosave = "1" == ini_read_string("save", "autosave", "1");
		global.is_minigame_unlocked = "1" == ini_read_string("save", "is_minigame_unlocked", "1");
		global.wait_if_target = "1" == ini_read_string("settings", "wait_if_target", "1");
		ini_close();
	}
	global.game_loading = false; 
	global.game_autoloading = false; 
	exit;
}

global.service_paid = 0;
for (var i = 1; i < 37; i++)
{
	if (global.basebuilding[i, 0] == "empty") continue;
	global.service_paid += 10000;
}
for (var i = 1; i <= global.planes[0, 0]; i++)
{
	if (global.planes[i, 2] < 1) continue;
	global.service_paid += 30000;
}
for (var i = 1; i <= global.team[0, 0]; i++)
{
	if (global.team[i, 4] < 1) continue;
	global.service_paid += 3000;
}
global.service_paid += global.engineers * 1000;
global.service_paid += global.scientist * 1500;

//if (global.fight)
//{
//	if (global.EGG_squad_onfight == 0 || global.XMAS_squad_onfight == 0)
//	if (global.EGG_escort_onfight == 0 || (global.XMAS_escort_onfight == 0 && global.SANTA_escort_onfight == 0)) 
//	{
//		global.EGG_squad_onfight = 0;
//		global.EGG_escort_onfight = 0;
//		global.XMAS_squad_onfight = 0;
//		global.XMAS_escort_onfight = 0;
//		global.SANTA_escort_onfight = 0;
//		global.SANTA_squad_onfight = 0;
//		global.fight = false;
//		global.win = 0;
//		show_debug_message("Был снят ложный флаг ручного боя");
//	}
//}
//if (global.autofight)
//{
//	if (global.EGG_escort_onfight == 0 || (global.XMAS_escort_onfight == 0 && global.SANTA_escort_onfight == 0)) 
//	{
//		global.EGG_squad_onfight = 0;
//		global.EGG_escort_onfight = 0;
//		global.XMAS_squad_onfight = 0;
//		global.XMAS_escort_onfight = 0;
//		global.SANTA_escort_onfight = 0;
//		global.SANTA_squad_onfight = 0;
//		global.autofight = false;	
//		global.win = 0;
//		show_debug_message("Был снят ложный флаг автобоя");
//	}
//}
if (!instance_exists(background_map) && !instance_exists(map_base))
fight_autofight_sequence();

if (!instance_exists(background_map) && !instance_exists(map_base))
{
	if (instance_exists(ask_parent) && global.timespeed > 0)
	{
		time_speed_saved = global.timespeed;
		global.timespeed = 0;
	}
	else if (time_speed_saved > 0 && !instance_exists(ask_parent)) if (global.timespeed == 0) global.timespeed = time_speed_saved; time_speed_saved = 0;
	
	if (!instance_exists(ask_parent) && time_speed_saved == 0 && global.timespeed == 0 && !global.fight && !global.autofight) global.timespeed = global.speed_1;
}


if (do_autosave && !instance_exists(ask_parent) && instance_exists(map_obj)) 
{
	save_game_json($"XMAS_savegame_autosave.dat");
	do_autosave = false;
}

if (global.debug && keyboard_check_released(vk_f1) && global.maxplanes > 0)
{
	var i1 = 5; // фотон
	var t = global.planes[0, 0] + 1;
	global.planes[t, 0] = i1; // индекс в planedata
	global.planes[t, 1] = global.planedata[global.planes[t, 0], 5]; // топливо
	global.planes[t, 2] = global.planedata[global.planes[t, 0], 1]; // хп
	global.planes[t, 3] = 0; // скорость
	global.planes[t, 4] = global.planedata[global.planes[t, 0], 12]; // место для десанта
	global.planes[t, 5] = global.planedata[global.planes[t, 0], 13]; // место для груза
	global.planes[t, 6] = global.planedata[global.planes[t, 0], 2]; // оружие 1
	global.planes[t, 7] = 0; // БК оружия 1
	global.planes[t, 8] = global.planedata[global.planes[t, 0], 3]; // оружие 2
	global.planes[t, 9] = 0; // БК оружия 2
	global.planes[t, 10] = global.planedata[global.planes[t, 0], 4]; // оружие 3
	global.planes[t, 11] = 0; // БК оружия 3
	global.planes[t, 12] = 0; // Статус (0 - готов, 1 - ремонт, 2 - перезарядка, 3 - дозаправка)
	global.planes[t, 13] = 0; // Текущее время обслуживания
	global.planes[t, 14] = 0; // номер эскадрильи, 0 = на базе
	global.planes[t, 15] = global.planedata[global.planes[t, 0], 0]; // название
	global.planes[t, 16] = 0; // гранат на борту
	global.planes[t, 17] = 0; // аптечек на борту
	global.planes[0, 0]++;
}

if (global.debug && keyboard_check_released(vk_f12))
{
	var is_have_empty_space = false;
	for (var i = 0; i < 37; i++)
	{
		if (global.basebuilding[i, 0] == "empty")
		{
			is_have_empty_space = true;
			global.basebuilding[i, 0] = "chaos_generator";
			global.basebuilding[i, 1] = 0;
			break;
		}
	}
	if (!is_have_empty_space) show_debug_message($"Не получилось заспавнить хаос-реактор!")
	//spawn_boss();	
}

if (global.debug && keyboard_check_released(vk_f11))
{
	spawn_bombers();
}