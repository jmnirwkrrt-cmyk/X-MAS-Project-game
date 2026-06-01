function air_autobattle(){
	
var total_score_XMAS = 0;
var total_score_EGG = 0;
var total_score_SANTA = 0;

var max_deviation = 100;

/*
Прошлая реализация:
Боекомплект расходуется вне зависимости от "принесенной пользы" и составляет половину БК на фазу, 
если оружие может быть применено.
Польза считается по очкам * изначальный процент от БК.
Очки самолета определяют шанс избежать атаки (расчет на каждый выстрел), чем меньше расстояние, тем выше роль маневренности,
в финальной фазе это так же добавляет очков, если до собачьей свалки дошло.

Если ХП ниже единицы самолет сбит.
Каждый самолет атакует лишь одну цель. 


ОБНОВЛЕНО:

Новая реализация:
Автобой происходит пошагово, с каждым шагом расстояние между сторонами уменьшается. 
Каждый самолет атакует случайную вражескую цель.
Стороны ходят по очереди всеми самолётами сразу. 
Число раундов ограничено, если стороны друг друга не убили, то автобой завершается по окончании последнего раунда. 

*/

battle_end = false;
battle_rounds = 1;
show_debug_message("Автобой инициирован.");
for (range = global.range_autobattle_initial; battle_end == false; range -= global.range_autobattle_step)
{
	if (range < 0) { range += global.range_reverse_step; battle_rounds++; }
	show_debug_message($"Раунд {battle_rounds}. Дальность {range}. Бой идёт:");
	// участники - XMAS
	for (i = 1; i <= global.planes[0,0]; i++)
	{
		if (global.planes[i, 14] != global.XMAS_escort_onfight || global.XMAS_escort_onfight == 0) continue;
		if (global.planes[i, 2] < 1) continue; 
		weap_1 = global.planes[i, 6];
		weap_1_ammo = global.planes[i, 7];
		weap_2 = global.planes[i, 8];
		weap_2_ammo = global.planes[i, 9];
		weap_3 = global.planes[i, 10];
		weap_3_ammo = global.planes[i, 11];
		if (weap_1_ammo < 1 && weap_2_ammo < 1 && weap_3_ammo < 1) continue;
		total_score_XMAS = 0;
		target_index = 0;
		
		target_index = autobattle_pick_random_egg_target();
		if (target_index == 0) continue;
		
		if (weap_1 == 1 && range < global.airweapon[1, 8] && weap_1_ammo > 0) { total_score_XMAS += global.avia_cannon_damage_value * global.cannons_shot_size; global.planes[i, 7] -= global.cannons_shot_size; }
		else
		if (weap_1 == 2 && range < global.airweapon[2, 8] && weap_1_ammo > 0) { total_score_XMAS += global.snegir_rocket_damage_value * global.missiles_shot_size; global.planes[i, 7] -= global.missiles_shot_size; }
		else
		if (weap_1 == 3 && range < global.airweapon[3, 8] && weap_1_ammo > 0) { total_score_XMAS += global.stingray_rocket_damage_value * global.missiles_shot_size; global.planes[i, 7] -= global.missiles_shot_size; }
		else
		if (weap_1 == 4 && range < global.airweapon[4, 8] && weap_1_ammo > 0) { total_score_XMAS += global.arrow_rocket_damage_value * global.missiles_shot_size; global.planes[i, 7] -= global.missiles_shot_size; }
		else
		if (weap_1 == 5 && range < global.airweapon[5, 8] && weap_1_ammo > 0) { total_score_XMAS += global.avalance_rocket_damage_value * global.missiles_shot_size; global.planes[i, 7] -= global.missiles_shot_size; }
		else
		if (weap_1 == 8 && range < global.airweapon[8, 8] && weap_1_ammo > 0) { total_score_XMAS += global.plasma_cannon_damage_value * global.cannons_shot_size; global.planes[i, 7] -= global.cannons_shot_size; }
		else
		if (weap_1 == 9 && range < global.airweapon[9, 8] && weap_1_ammo > 0) { total_score_XMAS += global.elite_plasma_cannon_damage_value * global.cannons_shot_size; global.planes[i, 7] -= global.cannons_shot_size; }
		else
		if (weap_1 == 10 && range < global.airweapon[10, 8] && weap_1_ammo > 0) { total_score_XMAS += global.plasma_rocket_damage_value * global.missiles_shot_size; global.planes[i, 7] -= global.missiles_shot_size; }
		else
		if (weap_1 == 11 && range < global.airweapon[11, 8] && weap_1_ammo > 0) { total_score_XMAS += global.plasma_laser_damage_value * global.laser_shot_size; global.planes[i, 7] -= global.laser_shot_size; }
		else
		if (weap_1 == 13 && range < global.airweapon[13, 8] && weap_1_ammo > 0) { total_score_XMAS += global.advanced_avia_cannon_damage_value * global.cannons_shot_size; global.planes[i, 7] -= global.cannons_shot_size; }
		else
		if (weap_1 == 14 && range < global.airweapon[14, 8] && weap_1_ammo > 0) { total_score_XMAS += global.zealot_rocket_damage_value * global.missiles_shot_size; global.planes[i, 7] -= global.missiles_shot_size; }
		global.planes[i, 7] = max(0, global.planes[i, 7]);
		
		if (weap_2 == 1 && range < global.airweapon[1, 8] && weap_2_ammo > 0) { total_score_XMAS += global.avia_cannon_damage_value * global.cannons_shot_size; global.planes[i, 9] -= global.cannons_shot_size; }
		else
		if (weap_2 == 2 && range < global.airweapon[2, 8] && weap_2_ammo > 0) { total_score_XMAS += global.snegir_rocket_damage_value * global.missiles_shot_size; global.planes[i, 9] -= global.missiles_shot_size; }
		else
		if (weap_2 == 3 && range < global.airweapon[3, 8] && weap_2_ammo > 0) { total_score_XMAS += global.stingray_rocket_damage_value * global.missiles_shot_size; global.planes[i, 9] -= global.missiles_shot_size; }
		else
		if (weap_2 == 4 && range < global.airweapon[4, 8] && weap_2_ammo > 0) { total_score_XMAS += global.arrow_rocket_damage_value * global.missiles_shot_size; global.planes[i, 9] -= global.missiles_shot_size; }
		else
		if (weap_2 == 5 && range < global.airweapon[5, 8] && weap_2_ammo > 0) { total_score_XMAS += global.avalance_rocket_damage_value * global.missiles_shot_size; global.planes[i, 9] -= global.missiles_shot_size; }
		else
		if (weap_2 == 8 && range < global.airweapon[8, 8] && weap_2_ammo > 0) { total_score_XMAS += global.plasma_cannon_damage_value * global.cannons_shot_size; global.planes[i, 9] -= global.cannons_shot_size; }
		else
		if (weap_2 == 9 && range < global.airweapon[9, 8] && weap_2_ammo > 0) { total_score_XMAS += global.elite_plasma_cannon_damage_value * global.cannons_shot_size; global.planes[i, 9] -= global.cannons_shot_size; }
		else
		if (weap_2 == 10 && range < global.airweapon[10, 8] && weap_2_ammo > 0) { total_score_XMAS += global.plasma_rocket_damage_value * global.missiles_shot_size; global.planes[i, 9] -= global.missiles_shot_size; }
		else
		if (weap_2 == 11 && range < global.airweapon[11, 8] && weap_2_ammo > 0) { total_score_XMAS += global.plasma_laser_damage_value * global.laser_shot_size; global.planes[i, 9] -= global.laser_shot_size; }
		else
		if (weap_2 == 13 && range < global.airweapon[13, 8] && weap_2_ammo > 0) { total_score_XMAS += global.advanced_avia_cannon_damage_value * global.cannons_shot_size; global.planes[i, 9] -= global.cannons_shot_size; }
		else
		if (weap_2 == 14 && range < global.airweapon[14, 8] && weap_2_ammo > 0) { total_score_XMAS += global.zealot_rocket_damage_value * global.missiles_shot_size; global.planes[i, 9] -= global.missiles_shot_size; }
		global.planes[i, 9] = max(0, global.planes[i, 9]);
		
		if (weap_3 == 1 && range < global.airweapon[1, 8] && weap_3_ammo > 0) { total_score_XMAS += global.avia_cannon_damage_value * global.cannons_shot_size; global.planes[i, 11] -= global.cannons_shot_size; }
		else
		if (weap_3 == 2 && range < global.airweapon[2, 8] && weap_3_ammo > 0) { total_score_XMAS += global.snegir_rocket_damage_value * global.missiles_shot_size; global.planes[i, 11] -= global.missiles_shot_size; }
		else
		if (weap_3 == 3 && range < global.airweapon[3, 8] && weap_3_ammo > 0) { total_score_XMAS += global.stingray_rocket_damage_value * global.missiles_shot_size; global.planes[i, 11] -= global.missiles_shot_size; }
		else
		if (weap_3 == 4 && range < global.airweapon[4, 8] && weap_3_ammo > 0) { total_score_XMAS += global.arrow_rocket_damage_value * global.missiles_shot_size; global.planes[i, 11] -= global.missiles_shot_size; }
		else
		if (weap_3 == 5 && range < global.airweapon[5, 8] && weap_3_ammo > 0) { total_score_XMAS += global.avalance_rocket_damage_value * global.missiles_shot_size; global.planes[i, 11] -= global.missiles_shot_size; }
		else
		if (weap_3 == 8 && range < global.airweapon[8, 8] && weap_3_ammo > 0) { total_score_XMAS += global.plasma_cannon_damage_value * global.cannons_shot_size; global.planes[i, 11] -= global.cannons_shot_size; }
		else
		if (weap_3 == 9 && range < global.airweapon[9, 8] && weap_3_ammo > 0) { total_score_XMAS += global.elite_plasma_cannon_damage_value * global.cannons_shot_size; global.planes[i, 11] -= global.cannons_shot_size; }
		else
		if (weap_3 == 10 && range < global.airweapon[10, 8] && weap_3_ammo > 0) { total_score_XMAS += global.plasma_rocket_damage_value * global.missiles_shot_size; global.planes[i, 11] -= global.missiles_shot_size; }
		else
		if (weap_3 == 11 && range < global.airweapon[11, 8] && weap_3_ammo > 0) { total_score_XMAS += global.plasma_laser_damage_value * global.laser_shot_size; global.planes[i, 11] -= global.laser_shot_size; }
		else
		if (weap_3 == 13 && range < global.airweapon[13, 8] && weap_3_ammo > 0) { total_score_XMAS += global.advanced_avia_cannon_damage_value * global.cannons_shot_size; global.planes[i, 11] -= global.cannons_shot_size; }
		else
		if (weap_3 == 14 && range < global.airweapon[14, 8] && weap_3_ammo > 0) { total_score_XMAS += global.zealot_rocket_damage_value * global.missiles_shot_size; global.planes[i, 11] -= global.missiles_shot_size; }
		global.planes[i, 9] = max(0, global.planes[i, 9]);
		
		weap_1_ammo = global.planes[i, 7];
		weap_2_ammo = global.planes[i, 9];
		weap_3_ammo = global.planes[i, 11];
		avoid_chance = 0;
		show_debug_message($"Самолет {global.planes[i, 15]}. Индекс {i}. Атакует цель {target_index}");
		if (global.eggplanes[target_index, 0] == 1) avoid_chance = global.egg_recon_power_value  * global.avoid_coeff;
		if (global.eggplanes[target_index, 0] == 2) avoid_chance = global.egg_fighter_power_value  * global.avoid_coeff;
		if (global.eggplanes[target_index, 0] == 3) avoid_chance = global.egg_interceptor_power_value  * global.avoid_coeff;
		if (global.eggplanes[target_index, 0] == 4) avoid_chance = global.egg_bomber_power_value  * global.avoid_coeff;
		if (global.eggplanes[target_index, 0] == 5) avoid_chance = global.egg_cas_power_value  * global.avoid_coeff;
		if (global.eggplanes[target_index, 0] == 6) avoid_chance = global.egg_transport_power_value  * global.avoid_coeff;
		
		if (random_range(0, 100) > avoid_chance)
		{
			damage = total_score_XMAS;
			if (global.eggplanes[target_index, 0] == 1) damage *= ((100 - global.egg_recon_power_value) / 100)
			if (global.eggplanes[target_index, 0] == 2) damage *= ((100 - global.egg_fighter_power_value) / 100)
			if (global.eggplanes[target_index, 0] == 3) damage *= ((100 - global.egg_interceptor_power_value) / 100)
			if (global.eggplanes[target_index, 0] == 4) damage *= ((100 - global.egg_bomber_power_value) / 100)
			if (global.eggplanes[target_index, 0] == 5) damage *= ((100 - global.egg_cas_power_value) / 100)
			if (global.eggplanes[target_index, 0] == 6) damage *= ((100 - global.egg_transport_power_value) / 100)
			global.eggplanes[target_index, 1] -= damage;
			show_debug_message($"Нанёс урон: {damage}");
		}
		else show_debug_message("Цель увернулась от удара");
	}
	
	// участники - эггман
	for (i = 1; i <= global.eggplanes[0,0]; i++)
	{
		if (global.eggplanes[i, 12] != global.EGG_escort_onfight || global.EGG_escort_onfight == 0) continue;
		if (global.eggplanes[i, 1] < 1) continue; 
		weap_1 = global.eggplanes[i, 5];
		weap_1_ammo = global.eggplanes[i, 6];
		weap_2 = global.eggplanes[i, 7];
		weap_2_ammo = global.eggplanes[i, 8];
		weap_3 = global.eggplanes[i, 9];
		weap_3_ammo = global.eggplanes[i, 10];
		if (weap_1_ammo < 1 && weap_2_ammo < 1 && weap_3_ammo < 1) continue;
		total_score_EGG = 0;
		target_index = autobattle_pick_random_santa_target();
		attack_side = 1;
		if (target_index == 0)
		{
		    if (global.debug) show_debug_message("Самолетов санты нет. Поиск самолетов игрока");
		    target_index = autobattle_pick_random_xmas_target();
		    attack_side = 0;
		}
		if (target_index == 0) continue;
		if (attack_side == 0) show_debug_message("Атакуются самолеты игрока");
		
		if (weap_1 == 1 && range < global.airweapon[1, 8] && weap_1_ammo > 0) { total_score_EGG += global.avia_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 6] -= global.cannons_shot_size; }
		else
		if (weap_1 == 2 && range < global.airweapon[2, 8] && weap_1_ammo > 0) { total_score_EGG += global.snegir_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 6] -= global.missiles_shot_size; }
		else
		if (weap_1 == 3 && range < global.airweapon[3, 8] && weap_1_ammo > 0) { total_score_EGG += global.stingray_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 6] -= global.missiles_shot_size; }
		else
		if (weap_1 == 4 && range < global.airweapon[4, 8] && weap_1_ammo > 0) { total_score_EGG += global.arrow_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 6] -= global.missiles_shot_size; }
		else
		if (weap_1 == 5 && range < global.airweapon[5, 8] && weap_1_ammo > 0) { total_score_EGG += global.avalance_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 6] -= global.missiles_shot_size; }
		else
		if (weap_1 == 8 && range < global.airweapon[8, 8] && weap_1_ammo > 0) { total_score_EGG += global.plasma_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 6] -= global.cannons_shot_size; }
		else
		if (weap_1 == 9 && range < global.airweapon[9, 8] && weap_1_ammo > 0) { total_score_EGG += global.elite_plasma_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 6] -= global.cannons_shot_size; }
		else
		if (weap_1 == 10 && range < global.airweapon[10, 8] && weap_1_ammo > 0) { total_score_EGG += global.plasma_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 6] -= global.missiles_shot_size; }
		else
		if (weap_1 == 11 && range < global.airweapon[11, 8] && weap_1_ammo > 0) { total_score_EGG += global.plasma_laser_damage_value * global.laser_shot_size; global.eggplanes[i, 6] -= global.laser_shot_size; }
		else
		if (weap_1 == 13 && range < global.airweapon[13, 8] && weap_1_ammo > 0) { total_score_EGG += global.advanced_avia_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 6] -= global.cannons_shot_size; }
		else
		if (weap_1 == 14 && range < global.airweapon[14, 8] && weap_1_ammo > 0) { total_score_EGG += global.zealot_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 6] -= global.missiles_shot_size; }
		global.eggplanes[i, 6] = max(0, global.eggplanes[i, 6]);
		
		
		if (weap_2 == 1 && range < global.airweapon[1, 8] && weap_2_ammo > 0) { total_score_EGG += global.avia_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 8] -= global.cannons_shot_size; }
		else
		if (weap_2 == 2 && range < global.airweapon[2, 8] && weap_2_ammo > 0) { total_score_EGG += global.snegir_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 8] -= global.missiles_shot_size; }
		else
		if (weap_2 == 3 && range < global.airweapon[3, 8] && weap_2_ammo > 0) { total_score_EGG += global.stingray_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 8] -= global.missiles_shot_size; }
		else
		if (weap_2 == 4 && range < global.airweapon[4, 8] && weap_2_ammo > 0) { total_score_EGG += global.arrow_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 8] -= global.missiles_shot_size; }
		else
		if (weap_2 == 5 && range < global.airweapon[5, 8] && weap_2_ammo > 0) { total_score_EGG += global.avalance_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 8] -= global.missiles_shot_size; }
		else
		if (weap_2 == 8 && range < global.airweapon[8, 8] && weap_2_ammo > 0) { total_score_EGG += global.plasma_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 8] -= global.cannons_shot_size; }
		else
		if (weap_2 == 9 && range < global.airweapon[9, 8] && weap_2_ammo > 0) { total_score_EGG += global.elite_plasma_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 8] -= global.cannons_shot_size; }
		else
		if (weap_2 == 10 && range < global.airweapon[10, 8] && weap_2_ammo > 0) { total_score_EGG += global.plasma_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 8] -= global.missiles_shot_size; }
		else
		if (weap_2 == 11 && range < global.airweapon[11, 8] && weap_2_ammo > 0) { total_score_EGG += global.plasma_laser_damage_value * global.laser_shot_size; global.eggplanes[i, 8] -= global.laser_shot_size; }
		else
		if (weap_2 == 13 && range < global.airweapon[13, 8] && weap_2_ammo > 0) { total_score_EGG += global.advanced_avia_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 8] -= global.cannons_shot_size; }
		else
		if (weap_2 == 14 && range < global.airweapon[14, 8] && weap_2_ammo > 0) { total_score_EGG += global.zealot_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 8] -= global.missiles_shot_size; }
		global.eggplanes[i, 8] = max(0, global.eggplanes[i, 6]);
		
		if (weap_3 == 1 && range < global.airweapon[1, 8] && weap_3_ammo > 0) { total_score_EGG += global.avia_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 10] -= global.cannons_shot_size; }
		else
		if (weap_3 == 2 && range < global.airweapon[2, 8] && weap_3_ammo > 0) { total_score_EGG += global.snegir_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 10] -= global.missiles_shot_size; }
		else
		if (weap_3 == 3 && range < global.airweapon[3, 8] && weap_3_ammo > 0) { total_score_EGG += global.stingray_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 10] -= global.missiles_shot_size; }
		else
		if (weap_3 == 4 && range < global.airweapon[4, 8] && weap_3_ammo > 0) { total_score_EGG += global.arrow_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 10] -= global.missiles_shot_size; }
		else
		if (weap_3 == 5 && range < global.airweapon[5, 8] && weap_3_ammo > 0) { total_score_EGG += global.avalance_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 10] -= global.missiles_shot_size; }
		else
		if (weap_3 == 8 && range < global.airweapon[8, 8] && weap_3_ammo > 0) { total_score_EGG += global.plasma_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 10] -= global.cannons_shot_size; }
		else
		if (weap_3 == 9 && range < global.airweapon[9, 8] && weap_3_ammo > 0) { total_score_EGG += global.elite_plasma_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 10] -= global.cannons_shot_size; }
		else
		if (weap_3 == 10 && range < global.airweapon[10, 8] && weap_3_ammo > 0) { total_score_EGG += global.plasma_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 10] -= global.missiles_shot_size; }
		else
		if (weap_3 == 11 && range < global.airweapon[11, 8] && weap_3_ammo > 0) { total_score_EGG += global.plasma_laser_damage_value * global.laser_shot_size; global.eggplanes[i, 10] -= global.laser_shot_size; }
		else
		if (weap_3 == 13 && range < global.airweapon[13, 8] && weap_3_ammo > 0) { total_score_EGG += global.advanced_avia_cannon_damage_value * global.cannons_shot_size; global.eggplanes[i, 10] -= global.cannons_shot_size; }
		else
		if (weap_3 == 14 && range < global.airweapon[14, 8] && weap_3_ammo > 0) { total_score_EGG += global.zealot_rocket_damage_value * global.missiles_shot_size; global.eggplanes[i, 10] -= global.missiles_shot_size; }
		global.eggplanes[i, 10] = max(0, global.eggplanes[i, 6]);
		//show_debug_message("Стреляет");
		
		weap_1_ammo = global.eggplanes[i, 6];
		weap_2_ammo = global.eggplanes[i, 8];
		weap_3_ammo = global.eggplanes[i, 10];
		avoid_chance = 0;
		//show_debug_message("Боеприпасы учтены");
		if (attack_side == 0)
		{
			show_debug_message($"Самолет {global.eggplanes[i, 13]}. Индекс {i}. Атакует цель {target_index}");
			if (global.planes[target_index, 0] == 1) avoid_chance = global.x_01_power_value * global.avoid_coeff;
			if (global.planes[target_index, 0] == 2) avoid_chance = global.x_02_power_value * global.avoid_coeff;
			if (global.planes[target_index, 0] == 3) avoid_chance = global.x_t_power_value * global.avoid_coeff;
			if (global.planes[target_index, 0] == 4) avoid_chance = global.x_03_power_value * global.avoid_coeff;
			if (global.planes[target_index, 0] == 5) avoid_chance = global.x_04_power_value * global.avoid_coeff;
			if (global.planes[target_index, 0] == 6) avoid_chance = global.x_MiG_power_value * global.avoid_coeff;
			if (global.planes[target_index, 0] == 7) avoid_chance = global.x_scout_power_value * global.avoid_coeff;
			if (global.planes[target_index, 0] == 8) avoid_chance = global.x_ranger_power_value * global.avoid_coeff;
			if (global.planes[target_index, 0] == 9) avoid_chance = global.x_vortex_power_value * global.avoid_coeff;
			
			if (random_range(0, 100) > avoid_chance)
			{
				damage = total_score_EGG;
				if (global.planes[target_index, 0] == 1) damage *= ((100 - global.x_01_power_value) / 100);
				if (global.planes[target_index, 0] == 2) damage *= ((100 - global.x_02_power_value) / 100);
				if (global.planes[target_index, 0] == 3) damage *= ((100 - global.x_t_power_value) / 100);
				if (global.planes[target_index, 0] == 4) damage *= ((100 - global.x_03_power_value) / 100);
				if (global.planes[target_index, 0] == 5) damage *= ((100 - global.x_04_power_value) / 100);
				if (global.planes[target_index, 0] == 6) damage *= ((100 - global.x_MiG_power_value) / 100);
				if (global.planes[target_index, 0] == 7) damage *= ((100 - global.x_scout_power_value) / 100);
				if (global.planes[target_index, 0] == 8) damage *= ((100 - global.x_ranger_power_value) / 100);
				if (global.planes[target_index, 0] == 9) damage *= ((100 - global.x_vortex_power_value) / 100);
				global.planes[target_index, 2] -= damage;
				show_debug_message($"Нанёс урон: {damage}");
			}
			else show_debug_message("Цель увернулась от удара");
		}
		if (attack_side == 1)
		{
			show_debug_message($"Самолет {global.eggplanes[i, 13]}. Индекс {i}. Атакует цель {target_index}");
			if (global.santaplanes[target_index, 0] == 1) avoid_chance = global.x_01_power_value * global.avoid_coeff;
			if (global.santaplanes[target_index, 0] == 2) avoid_chance = global.x_02_power_value * global.avoid_coeff;
			if (global.santaplanes[target_index, 0] == 3) avoid_chance = global.x_t_power_value * global.avoid_coeff;
			if (global.santaplanes[target_index, 0] == 4) avoid_chance = global.x_03_power_value * global.avoid_coeff;
			if (global.santaplanes[target_index, 0] == 5) avoid_chance = global.x_04_power_value * global.avoid_coeff;
			if (global.santaplanes[target_index, 0] == 6) avoid_chance = global.x_MiG_power_value * global.avoid_coeff;
			if (global.santaplanes[target_index, 0] == 7) avoid_chance = global.x_scout_power_value * global.avoid_coeff;
			if (global.santaplanes[target_index, 0] == 8) avoid_chance = global.x_ranger_power_value * global.avoid_coeff;
			if (global.santaplanes[target_index, 0] == 9) avoid_chance = global.x_vortex_power_value * global.avoid_coeff;
			
			if (random_range(0, 100) > avoid_chance)
			{
				damage = total_score_EGG;
				if (global.santaplanes[target_index, 0] == 1) damage *= ((100 - global.x_01_power_value) / 100);
				if (global.santaplanes[target_index, 0] == 2) damage *= ((100 - global.x_02_power_value) / 100);
				if (global.santaplanes[target_index, 0] == 3) damage *= ((100 - global.x_t_power_value) / 100);
				if (global.santaplanes[target_index, 0] == 4) damage *= ((100 - global.x_03_power_value) / 100);
				if (global.santaplanes[target_index, 0] == 5) damage *= ((100 - global.x_04_power_value) / 100);
				if (global.santaplanes[target_index, 0] == 6) damage *= ((100 - global.x_MiG_power_value) / 100);
				if (global.santaplanes[target_index, 0] == 7) damage *= ((100 - global.x_scout_power_value) / 100);
				if (global.santaplanes[target_index, 0] == 8) damage *= ((100 - global.x_ranger_power_value) / 100);
				if (global.santaplanes[target_index, 0] == 9) damage *= ((100 - global.x_vortex_power_value) / 100);
				global.santaplanes[target_index, 1] -= damage;
				show_debug_message($"Нанёс урон: {damage}");
			}
			else show_debug_message("Цель увернулась от удара");
		}
		
	}
	
	// участники - санта 
	for (i = 1; i <= global.santaplanes[0, 0]; i++)
	{
		if (global.santaplanes[i, 12] != global.SANTA_escort_onfight || global.SANTA_escort_onfight == 0) continue;
		if (global.santaplanes[i, 1] < 1) continue; 
		weap_1 = global.santaplanes[i, 5];
		weap_1_ammo = global.santaplanes[i, 6];
		weap_2 = global.santaplanes[i, 7];
		weap_2_ammo = global.santaplanes[i, 8];
		weap_3 = global.santaplanes[i, 9];
		weap_3_ammo = global.santaplanes[i, 10];
		if (weap_1_ammo < 1 && weap_2_ammo < 1 && weap_3_ammo < 1) continue;
		total_score_SANTA = 0;
		target_index = 0;
		target_index = autobattle_pick_random_egg_target();
		if (target_index == 0) continue;
		
		if (weap_1 == 1 && range < global.airweapon[1, 8] && weap_1_ammo > 0) { total_score_SANTA += global.avia_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 6] -= global.cannons_shot_size; }
		else
		if (weap_1 == 2 && range < global.airweapon[2, 8] && weap_1_ammo > 0) { total_score_SANTA += global.snegir_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 6] -= global.missiles_shot_size; }
		else
		if (weap_1 == 3 && range < global.airweapon[3, 8] && weap_1_ammo > 0) { total_score_SANTA += global.stingray_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 6] -= global.missiles_shot_size; }
		else
		if (weap_1 == 4 && range < global.airweapon[4, 8] && weap_1_ammo > 0) { total_score_SANTA += global.arrow_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 6] -= global.missiles_shot_size; }
		else
		if (weap_1 == 5 && range < global.airweapon[5, 8] && weap_1_ammo > 0) { total_score_SANTA += global.avalance_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 6] -= global.missiles_shot_size; }
		else
		if (weap_1 == 8 && range < global.airweapon[8, 8] && weap_1_ammo > 0) { total_score_SANTA += global.plasma_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 6] -= global.cannons_shot_size; }
		else
		if (weap_1 == 9 && range < global.airweapon[9, 8] && weap_1_ammo > 0) { total_score_SANTA += global.elite_plasma_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 6] -= global.cannons_shot_size; }
		else
		if (weap_1 == 10 && range < global.airweapon[10, 8] && weap_1_ammo > 0) { total_score_SANTA += global.plasma_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 6] -= global.missiles_shot_size; }
		else
		if (weap_1 == 11 && range < global.airweapon[11, 8] && weap_1_ammo > 0) { total_score_SANTA += global.plasma_laser_damage_value * global.laser_shot_size; global.santaplanes[i, 6] -= global.laser_shot_size; }
		else
		if (weap_1 == 13 && range < global.airweapon[13, 8] && weap_1_ammo > 0) { total_score_SANTA += global.advanced_avia_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 6] -= global.cannons_shot_size; }
		else
		if (weap_1 == 14 && range < global.airweapon[14, 8] && weap_1_ammo > 0) { total_score_SANTA += global.zealot_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 6] -= global.missiles_shot_size; }
		global.santaplanes[i, 6] = max(0, global.santaplanes[i, 6]);
		
		if (weap_2 == 1 && range < global.airweapon[1, 8] && weap_2_ammo > 0) { total_score_SANTA += global.avia_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 8] -= global.cannons_shot_size; }
		else
		if (weap_2 == 2 && range < global.airweapon[2, 8] && weap_2_ammo > 0) { total_score_SANTA += global.snegir_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 8] -= global.missiles_shot_size; }
		else
		if (weap_2 == 3 && range < global.airweapon[3, 8] && weap_2_ammo > 0) { total_score_SANTA += global.stingray_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 8] -= global.missiles_shot_size; }
		else
		if (weap_2 == 4 && range < global.airweapon[4, 8] && weap_2_ammo > 0) { total_score_SANTA += global.arrow_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 8] -= global.missiles_shot_size; }
		else
		if (weap_2 == 5 && range < global.airweapon[5, 8] && weap_2_ammo > 0) { total_score_SANTA += global.avalance_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 8] -= global.missiles_shot_size; }
		else
		if (weap_2 == 8 && range < global.airweapon[8, 8] && weap_2_ammo > 0) { total_score_SANTA += global.plasma_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 8] -= global.cannons_shot_size; }
		else
		if (weap_2 == 9 && range < global.airweapon[9, 8] && weap_2_ammo > 0) { total_score_SANTA += global.elite_plasma_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 8] -= global.cannons_shot_size; }
		else
		if (weap_2 == 10 && range < global.airweapon[10, 8] && weap_2_ammo > 0) { total_score_SANTA += global.plasma_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 8] -= global.missiles_shot_size; }
		else
		if (weap_2 == 11 && range < global.airweapon[11, 8] && weap_2_ammo > 0) { total_score_SANTA += global.plasma_laser_damage_value * global.laser_shot_size; global.santaplanes[i, 8] -= global.laser_shot_size; }
		else
		if (weap_2 == 13 && range < global.airweapon[13, 8] && weap_2_ammo > 0) { total_score_SANTA += global.advanced_avia_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 8] -= global.cannons_shot_size; }
		else
		if (weap_2 == 14 && range < global.airweapon[14, 8] && weap_2_ammo > 0) { total_score_SANTA += global.zealot_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 8] -= global.missiles_shot_size; }
		global.santaplanes[i, 8] = max(0, global.santaplanes[i, 8]);
		
		if (weap_3 == 1 && range < global.airweapon[1, 8] && weap_3_ammo > 0) { total_score_SANTA += global.avia_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 10] -= global.cannons_shot_size; }
		else
		if (weap_3 == 2 && range < global.airweapon[2, 8] && weap_3_ammo > 0) { total_score_SANTA += global.snegir_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 10] -= global.missiles_shot_size; }
		else
		if (weap_3 == 3 && range < global.airweapon[3, 8] && weap_3_ammo > 0) { total_score_SANTA += global.stingray_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 10] -= global.missiles_shot_size; }
		else
		if (weap_3 == 4 && range < global.airweapon[4, 8] && weap_3_ammo > 0) { total_score_SANTA += global.arrow_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 10] -= global.missiles_shot_size; }
		else
		if (weap_3 == 5 && range < global.airweapon[5, 8] && weap_3_ammo > 0) { total_score_SANTA += global.avalance_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 10] -= global.missiles_shot_size; }
		else
		if (weap_3 == 8 && range < global.airweapon[8, 8] && weap_3_ammo > 0) { total_score_SANTA += global.plasma_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 10] -= global.cannons_shot_size; }
		else
		if (weap_3 == 9 && range < global.airweapon[9, 8] && weap_3_ammo > 0) { total_score_SANTA += global.elite_plasma_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 10] -= global.cannons_shot_size; }
		else
		if (weap_3 == 10 && range < global.airweapon[10, 8] && weap_3_ammo > 0) { total_score_SANTA += global.plasma_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 10] -= global.missiles_shot_size; }
		else
		if (weap_3 == 11 && range < global.airweapon[11, 8] && weap_3_ammo > 0) { total_score_SANTA += global.plasma_laser_damage_value * global.laser_shot_size; global.santaplanes[i, 10] -= global.laser_shot_size; }
		else
		if (weap_3 == 13 && range < global.airweapon[13, 8] && weap_3_ammo > 0) { total_score_SANTA += global.advanced_avia_cannon_damage_value * global.cannons_shot_size; global.santaplanes[i, 10] -= global.cannons_shot_size; }
		else
		if (weap_3 == 14 && range < global.airweapon[14, 8] && weap_3_ammo > 0) { total_score_SANTA += global.zealot_rocket_damage_value * global.missiles_shot_size; global.santaplanes[i, 10] -= global.missiles_shot_size; }
		global.santaplanes[i, 10] = max(0, global.santaplanes[i, 10]);
		
		weap_1_ammo = global.santaplanes[i, 6];
		weap_2_ammo = global.santaplanes[i, 8];
		weap_3_ammo = global.santaplanes[i, 10];
		avoid_chance = 0;
		show_debug_message($"Самолет {global.santaplanes[i, 13]}. Индекс {i}. Атакует цель {target_index}");
		if (global.eggplanes[target_index, 0] == 1) avoid_chance = global.egg_recon_power_value  * global.avoid_coeff;
		if (global.eggplanes[target_index, 0] == 2) avoid_chance = global.egg_fighter_power_value  * global.avoid_coeff;
		if (global.eggplanes[target_index, 0] == 3) avoid_chance = global.egg_interceptor_power_value  * global.avoid_coeff;
		if (global.eggplanes[target_index, 0] == 4) avoid_chance = global.egg_bomber_power_value  * global.avoid_coeff;
		if (global.eggplanes[target_index, 0] == 5) avoid_chance = global.egg_cas_power_value  * global.avoid_coeff;
		if (global.eggplanes[target_index, 0] == 6) avoid_chance = global.egg_transport_power_value  * global.avoid_coeff;
		
		if (random_range(0, 100) > avoid_chance)
		{
			damage = total_score_SANTA;
			if (global.eggplanes[target_index, 0] == 1) damage *= ((100 - global.egg_recon_power_value) / 100)
			if (global.eggplanes[target_index, 0] == 2) damage *= ((100 - global.egg_fighter_power_value) / 100)
			if (global.eggplanes[target_index, 0] == 3) damage *= ((100 - global.egg_interceptor_power_value) / 100)
			if (global.eggplanes[target_index, 0] == 4) damage *= ((100 - global.egg_bomber_power_value) / 100)
			if (global.eggplanes[target_index, 0] == 5) damage *= ((100 - global.egg_cas_power_value) / 100)
			if (global.eggplanes[target_index, 0] == 6) damage *= ((100 - global.egg_transport_power_value) / 100)
			global.eggplanes[target_index, 1] -= damage;
			show_debug_message($"Нанёс урон: {damage}");
		}
		else show_debug_message("Цель увернулась от удара");
	}
	
	any_egg_planes = false;
	any_xmas_planes = false;
	any_santa_planes = false;
	
	for (i = 1; i <= global.planes[0,0]; i++)
	{
		if (global.planes[i, 14] != global.XMAS_escort_onfight || global.XMAS_escort_onfight == 0) continue;
		if (global.planes[i, 2] > 0) { any_xmas_planes = true; break; } 
	}
	for (i = 1; i <= global.eggplanes[0,0]; i++)
	{
		if (global.eggplanes[i, 12] != global.EGG_escort_onfight || global.EGG_escort_onfight == 0) continue;
		if (global.eggplanes[i, 1] > 0) { any_egg_planes = true; break; } 
	}
	for (i = 1; i <= global.santaplanes[0,0]; i++)
	{
		if (global.santaplanes[i, 12] != global.SANTA_escort_onfight || global.SANTA_escort_onfight == 0) continue;
		if (global.santaplanes[i, 1] > 0) { any_santa_planes = true; break; } 
	}
	
	if (!any_egg_planes && (any_xmas_planes || any_santa_planes)) { show_debug_message("Бой окончен. Победа X-MAS"); global.win = 2; battle_end = true; }
	else
	if (any_egg_planes && !any_xmas_planes && !any_santa_planes) { show_debug_message("Бой окончен. Победа Эггмана"); global.win = -2; battle_end = true; }
	else
	if (!any_egg_planes && !any_xmas_planes && !any_santa_planes) { show_debug_message("Бой окончен. Ничья"); global.win = 3;  battle_end = true; }
	else
	if (/*any_egg_planes && any_xmas_planes && any_santa_planes && */battle_rounds >= global.autobattle_max_rounds) { show_debug_message("Бой прерван. Ничья"); global.win = -3;  battle_end = true; }
	
}


/*
	
// фаза дальнего боя
for (i = 1; i <= global.planes[0,0]; i++)
{
	if (global.planes[i, 14] != global.XMAS_escort_onfight) continue;
	weap_1 = global.planes[i, 6];
	weap_1_ammo = global.planes[i, 7];
	weap_2 = global.planes[i, 8];
	weap_2_ammo = global.planes[i, 9];
	weap_3 = global.planes[i, 10];
	weap_3_ammo = global.planes[i, 11];
	
	if (weap_1 == 1) total_score_XMAS += global.avia_cannon_long_value * (weap_1_ammo / global.airweapon[1, 2]);
	else
	if (weap_1 == 2) total_score_XMAS += global.snegir_rocket_long_value * (weap_1_ammo / global.airweapon[2, 2]);
	else
	if (weap_1 == 3) total_score_XMAS += global.stingray_rocket_long_value * (weap_1_ammo / global.airweapon[3, 2]);
	else
	if (weap_1 == 4) total_score_XMAS += global.arrow_rocket_long_value * (weap_1_ammo / global.airweapon[4, 2]);
	else
	if (weap_1 == 5) total_score_XMAS += global.avalance_rocket_long_value * (weap_1_ammo / global.airweapon[5, 2]);
	else
	if (weap_1 == 8) total_score_XMAS += global.plasma_cannon_long_value * (weap_1_ammo / global.airweapon[8, 2]);
	else
	if (weap_1 == 9) total_score_XMAS += global.elite_plasma_cannon_long_value * (weap_1_ammo / global.airweapon[9, 2]);
	else
	if (weap_1 == 10) total_score_XMAS += global.plasma_rocket_long_value * (weap_1_ammo / global.airweapon[10, 2]);
	else
	if (weap_1 == 11) total_score_XMAS += global.plasma_laser_long_value * (weap_1_ammo / global.airweapon[11, 2]);
	
	if (weap_2 == 1) total_score_XMAS += global.avia_cannon_long_value * (weap_2_ammo / global.airweapon[1, 2]);
	else
	if (weap_2 == 2) total_score_XMAS += global.snegir_rocket_long_value * (weap_2_ammo / global.airweapon[2, 2]);
	else
	if (weap_2 == 3) total_score_XMAS += global.stingray_rocket_long_value * (weap_2_ammo / global.airweapon[3, 2]);
	else
	if (weap_2 == 4) total_score_XMAS += global.arrow_rocket_long_value * (weap_2_ammo / global.airweapon[4, 2]);
	else
	if (weap_2 == 5) total_score_XMAS += global.avalance_rocket_long_value * (weap_2_ammo / global.airweapon[5, 2]);
	else
	if (weap_2 == 8) total_score_XMAS += global.plasma_cannon_long_value * (weap_2_ammo / global.airweapon[8, 2]);
	else
	if (weap_2 == 9) total_score_XMAS += global.elite_plasma_cannon_long_value * (weap_2_ammo / global.airweapon[9, 2]);
	else
	if (weap_2 == 10) total_score_XMAS += global.plasma_rocket_long_value * (weap_2_ammo / global.airweapon[10, 2]);
	else
	if (weap_2 == 11) total_score_XMAS += global.plasma_laser_long_value * (weap_2_ammo / global.airweapon[11, 2]);
	
	if (weap_3 == 1) total_score_XMAS += global.avia_cannon_long_value * (weap_3_ammo / global.airweapon[1, 2]);
	else
	if (weap_3 == 2) total_score_XMAS += global.snegir_rocket_long_value * (weap_3_ammo / global.airweapon[2, 2]);
	else
	if (weap_3 == 3) total_score_XMAS += global.stingray_rocket_long_value * (weap_3_ammo / global.airweapon[3, 2]);
	else
	if (weap_3 == 4) total_score_XMAS += global.arrow_rocket_long_value * (weap_3_ammo / global.airweapon[4, 2]);
	else
	if (weap_3 == 5) total_score_XMAS += global.avalance_rocket_long_value * (weap_3_ammo / global.airweapon[5, 2]);
	else
	if (weap_3 == 8) total_score_XMAS += global.plasma_cannon_long_value * (weap_3_ammo / global.airweapon[8, 2]);
	else
	if (weap_3 == 9) total_score_XMAS += global.elite_plasma_cannon_long_value * (weap_3_ammo / global.airweapon[9, 2]);
	else
	if (weap_3 == 10) total_score_XMAS += global.plasma_rocket_long_value * (weap_3_ammo / global.airweapon[10, 2]);
	else
	if (weap_3 == 11) total_score_XMAS += global.plasma_laser_long_value * (weap_3_ammo / global.airweapon[11, 2]);
	

}


for (i = 1; i <= global.eggplanes[0,0]; i++)
{
	if (global.eggplanes[i, 12] != global.EGG_escort_onfight) continue;
	
}

for (i = 1; i <= global.eggplanes[0,0]; i++)
{
	if (total_score_XMAS < 1) break;
	if (global.eggplanes[i, 12] != global.EGG_escort_onfight) continue;
	if (global.eggplanes[i, 1] < 1) continue;
	var r = irandom_range(0, 100);
	var luck = 0;
	if (global.eggplanes[i, 0] == 1) luck = global.egg_recon_power_value;
	if (global.eggplanes[i, 0] == 2) luck = global.egg_fighter_power_value;
	if (global.eggplanes[i, 0] == 3) luck = global.egg_interceptor_power_value;
	if (global.eggplanes[i, 0] == 4) luck = global.egg_bomber_power_value;
	if (global.eggplanes[i, 0] == 5) luck = global.egg_cas_power_value;
	if (global.eggplanes[i, 0] == 6) luck = global.egg_transport_power_value;
	
	if (r > luck * 2) 
	{
		if (global.eggplanes[i, 1] > total_score_XMAS)
		global.eggplanes[i, 1] -= total_score_XMAS; 
		else
		{
			total_score_XMAS -= global.eggplanes[i, 1];
			global.eggplanes[i, 1] = 0;
		}
	}
	else
	if (r > luck) 
	{
		if (global.eggplanes[i, 1] > total_score_XMAS / 2)
		global.eggplanes[i, 1] -= total_score_XMAS / 2; 
		else
		{
			total_score_XMAS -= global.eggplanes[i, 1];
			global.eggplanes[i, 1] = 0;
		}
	}
	else
	{
		total_score_XMAS -= global.eggplanes[i, 1];
		if (total_score_XMAS < 1) total_score_XMAS = 0;
	}
}


// фаза среднего боя

// фаза ближнего боя

// фаза собачьей свалки
*/
}









function autobattle_pick_random_egg_target()
{
    var candidates = array_create(0);
    
    for (var i = 1; i <= global.eggplanes[0, 0]; i++)
    {
        if (global.eggplanes[i, 12] != global.EGG_escort_onfight || global.EGG_escort_onfight == 0) continue;
        if (global.eggplanes[i, 1] < 1) continue;
        array_push(candidates, i);
    }
    
    if (array_length(candidates) < 1) return 0;
    return candidates[irandom(array_length(candidates) - 1)];
}

function autobattle_pick_random_xmas_target()
{
    var candidates = array_create(0);
    
    for (var i = 1; i <= global.planes[0, 0]; i++)
    {
        if (global.planes[i, 14] != global.XMAS_escort_onfight || global.XMAS_escort_onfight == 0) continue;
        if (global.planes[i, 2] < 1) continue;
        array_push(candidates, i);
    }
    
    if (array_length(candidates) < 1) return 0;
    return candidates[irandom(array_length(candidates) - 1)];
}

function autobattle_pick_random_santa_target()
{
    var candidates = array_create(0);
    
    for (var i = 1; i <= global.santaplanes[0, 0]; i++)
    {
        if (global.santaplanes[i, 12] != global.SANTA_escort_onfight || global.SANTA_escort_onfight == 0) continue;
        if (global.santaplanes[i, 1] < 1) continue;
        array_push(candidates, i);
    }
    
    if (array_length(candidates) < 1) return 0;
    return candidates[irandom(array_length(candidates) - 1)];
}