/// oArena3D: End Step

var enemy_count = 0;
var ally_count = 0;


ally_count += instance_number(oPlayer3D) + instance_number(ally_obj_3D);
// Считаем свою численность (для определения итога)
for (var i = 1; i <= global.team[0, 0]; i++)
{
	//show_debug_message($"Считаем число союзников {i}");
	if (!is_our_squad(i) || global.team[i, 4] < 1) continue;
	ally_count++;
	//show_debug_message($"Посчитали союзника {i}");
}


if (global.pause == 0 || ally_count < 1)
{
	spawn_timer--;
	
	var elevator_count = instance_number(robotic_elevator);
	var ally = noone;
	var enemy = noone;
	var cas = "";
	enemy_count += instance_number(Terror_Squad_3D);
	
	
	// Спавним союзников (всех сразу в начале боя)
	for (var i = 1; i <= global.santateam[0, 0]; i++)
	{
		if (global.santateam[i, 0] != global.SANTA_squad_onfight || global.santateam[i, 1] == 0) continue;
		ally_count++;
		cas = gm3d_random_point_any_surface(16, 124);
		if (is_array(cas))
		{
			var hero_numb = 0;
			hero_numb = choose(8, 9, 10)
			ally = instance_create(cas[0], cas[1], ally_obj_3D);
			ally.hero_numb = hero_numb;
			ally.z = cas[2] + 65;
			ally.jump = 3;
			ally.massive_index = i;
			ally.image_blend = make_colour_rgb(150, 150, 255);
			global.santateam[i, 1]--;
		}
		
	}
	
	if ((instance_exists(oPlayer3D) || instance_exists(X_MAS_team_3D)) && (battle_type == 2 || battle_type == 5))
	{
		survive_timer--
		survive_timer = max(survive_timer - 1, 0);
	}
	global.trophies_total = metal_corpses + beetle_corpses + pawn_corpses + ufo_corpses + turret_corpses;
	
	// Спавним врагов
	if (spawn_timer < 1) 
	{
		spawn_timer = spawn_timer_max + irandom_range(spawn_timer_max - spawn_timer_deviation, spawn_timer_max + spawn_timer_deviation);
		if (battle_type != 3 && battle_type != 2 && battle_type != 5)
		{
			var units = array_create(0);
			for (var i = 1; i <= global.eggteam[0, 0]; i++)
			{
				if (global.eggteam[i, 0] != global.EGG_squad_onfight || global.eggteam[i, 1] < 1) continue;
				array_push(units, i);
			}
			for (var i = 0; i < array_length(units); i++)
			{
				var random_skip = choose(true, false);
				if (random_skip) { if (i == array_length(units) - 1) i = -1; continue; }
				enemy_count++;
				if (enemy == noone || !instance_exists(enemy))
				{
					cas = gm3d_random_point_any_surface(16, 124);
					if (is_array(cas))
					{
						var obj_type = noone;
						if (global.eggteam[units[i], 2] = "metalson") obj_type = metal_sonic_3D;
						if (global.eggteam[units[i], 2] = "beetle") obj_type = beetle_3D;
						if (global.eggteam[units[i], 2] = "pawn") obj_type = egg_pawn_3D;
						if (global.eggteam[units[i], 2] = "ufo") obj_type = ufo_tank_3D
						enemy = instance_create(cas[0], cas[1], obj_type)
						enemy.z = cas[2] + 65;
						enemy.jump = 3;
						if (obj_type == ufo_tank_3D) { enemy.z = cas[2]; }
						enemy.massive_index = units[i];
						global.eggteam[units[i], 1]--;
					}
				}
			}
		}
		else
		{
			for (var i = 1, spawned = false; !spawned; i++)
			{
				if (i > global.eggteam[0, 0]) i = 1;
				if (global.eggteam[i, 0] != global.EGG_squad_onfight || global.eggteam[i, 1] < 1) continue;
				var skip_chance = irandom_range(0, 5);
				if (skip_chance != 5) continue;
				spawned = true;
				enemy_count++;
				if (enemy == noone || !instance_exists(enemy))
				{
					cas = gm3d_random_point_any_surface(16, 124);
					if (is_array(cas))
					{
						var obj_type = noone;
						if (global.eggteam[i, 2] = "metalson") obj_type = metal_sonic_3D;
						if (global.eggteam[i, 2] = "beetle") obj_type = beetle_3D;
						if (global.eggteam[i, 2] = "pawn") obj_type = egg_pawn_3D;
						if (global.eggteam[i, 2] = "ufo") obj_type = ufo_tank_3D
						enemy = instance_create(cas[0], cas[1], obj_type)
						enemy.z = cas[2] + 65;
						enemy.jump = 3;
						if (obj_type == ufo_tank_3D) { enemy.z = cas[2]; }
						enemy.massive_index = i;
					}
				}
			}
		}
		for (var i = 0; i < instance_number(Turret_3D); i++)
		{
			var obj = instance_find(Turret_3D, i);
			if (!obj.team_is_enemy || obj.hp <= 0) continue;
			enemy_count++;
		}
		
		
		
		if (battle_type == 1) // уничтожить всех
		{
		
			if (ally_count < 1 && enemy_count > 0) 
			{
				// Поражение
				if (!instance_exists(menu_small_3D))
				{
					set_pause = true;
					global.win = -1;
					var menu = instance_create(x, y, menu_small_3D);
					menu.type = 2;
					menu.text3_txt = global.txt306;
					battle_end = true;
				}
			}
			else
			if (ally_count > 0 && enemy_count < 1) 
			{
				// Победа
				if (!instance_exists(menu_small_3D))
				{
					set_pause = true;
					global.win = 1;
					var menu = instance_create(x, y, menu_small_3D);
					menu.type = 2;
					menu.text3_txt = global.txt305;
					battle_end = true;
				}
			}
			else
			if (ally_count < 1 && enemy_count < 1) 
			{
				// Ничья
				if (!instance_exists(menu_small_3D))
				{
					set_pause = true;
					global.win = -1;
					var menu = instance_create(x, y, menu_small_3D);
					menu.type = 2;
					menu.text3_txt = global.txt307;
					battle_end = true;
				}
			}
		
		}
		else
		if (battle_type == 2 || battle_type == 5) // выживать в течении
		{
			if (survive_timer < 1 && ally_count > 0)
			{
				// Победа
				if (!instance_exists(menu_small_3D))
				{
					set_pause = true;
					global.win = 1;
					var menu = instance_create(x, y, menu_small_3D);
					menu.type = 2;
					menu.text3_txt = global.txt305;
					battle_end = true;
				}
			}
			else
			if (ally_count < 1 && enemy_count > 0)
			{
				// Поражение
				if (!instance_exists(menu_small_3D))
				{
					set_pause = true;
					global.win = -1;
					var menu = instance_create(x, y, menu_small_3D);
					menu.type = 2;
					menu.text3_txt = global.txt306;
					battle_end = true;
				}
			}
			else
			if (ally_count < 1 && enemy_count < 1) 
			{
				// Ничья
				if (!instance_exists(menu_small_3D))
				{
					set_pause = true;
					global.win = 1;
					var menu = instance_create(x, y, menu_small_3D);
					menu.type = 2;
					menu.text3_txt = global.txt307;
					battle_end = true;
				}
			}
			
		}
		else
		if (battle_type == 3) // найти изумруд и съебаться
		{
			if (emerald_taken_by == instance_find(landed_transport, 0))
			{
				// Победа
				if (!instance_exists(menu_small_3D))
				{
					set_pause = true;
					global.win = 1;
					var menu = instance_create(x, y, menu_small_3D);
					menu.type = 2;
					menu.text3_txt = global.txt305;
					battle_end = true;
				}
			}
			else
			if (ally_count < 1)
			{
				// Поражение
				if (!instance_exists(menu_small_3D))
				{
					set_pause = true;
					global.win = -1;
					var menu = instance_create(x, y, menu_small_3D);
					menu.type = 2;
					menu.text3_txt = global.txt306;
					battle_end = true;
				}
			}
			
		}
		else
		if (battle_type == 4) // уничтожить лифты для роботов и всех остальных
		{
			if (enemy_count < 1 && ally_count > 0 && elevator_count < 1)
			{
				// Победа
				if (!instance_exists(menu_small_3D))
				{
					set_pause = true;
					global.win = 1;
					var menu = instance_create(x, y, menu_small_3D);
					menu.type = 2;
					menu.text3_txt = global.txt305;
					battle_end = true;
				}
			}
			else
			if (ally_count < 1 && (enemy_count > 0 || elevator_count > 0))
			{
				// Поражение
				if (!instance_exists(menu_small_3D))
				{
					set_pause = true;
					global.win = -1;
					var menu = instance_create(x, y, menu_small_3D);
					menu.type = 2;
					menu.text3_txt = global.txt306;
					battle_end = true;
				}
			}
			else
			if (ally_count < 1 && enemy_count < 1 && elevator_count < 1) 
			{
				// Ничья
				if (!instance_exists(menu_small_3D))
				{
					set_pause = true;
					global.win = -1;
					var menu = instance_create(x, y, menu_small_3D);
					menu.type = 2;
					menu.text3_txt = global.txt307;
					battle_end = true;
				}
			}
			
		}
		
		
		
		
		
		
		
		
	}
	
	if (global.debug && keyboard_check_released(vk_f10))
	{
		set_pause = true;
		global.win = 1;
		var menu = instance_create(x, y, menu_small_3D);
		menu.type = 2;
		menu.text3_txt = global.txt305;
		battle_end = true;	
	}
	if (global.debug && keyboard_check_released(vk_f9))
	{
		survive_timer -= 3600;	
	}
	
	if (!instance_exists(oPlayer3D)) 
	{
		set_pause = true;
	}
}