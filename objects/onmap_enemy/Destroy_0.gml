if (instance_exists(text)) instance_destroy(text);

{
	var had_transport = false;
	var had_emitters  = false;
	var had_alloys    = false;
	var had_radar     = false;
	var had_codes     = false;
	var is_destroyed = true;

	var alloys   = 0;
	var emitters = 0;

	// ------------------------------------------------------------
	// Сначала определяем:
	// 1) уничтожена ли эскадрилья полностью
	// 2) что вообще было в её составе
	// ------------------------------------------------------------
	for (var q = 4; q < global.escortfoe[indx, 0] + 4; q++)
	{
		var plane_index = global.escortfoe[indx, q];
		var plane_hp    = global.eggplanes[plane_index, 1];
		var type_s      = global.eggplanes[plane_index, 0];

		show_debug_message($"Проверили самолет {q - 3}");
		show_debug_message($"escortfoe {plane_index}");
		show_debug_message($"eggplanes {type_s}");

		// Если кто-то жив — эскадрилья не уничтожена
		if (plane_hp > 0) is_destroyed = false;

		// [FIX] Состав эскадрильи считаем НЕ по живым, а по тому, что в ней было вообще
		if (type_s == 2 || type_s == 4 || type_s == 5 || type_s == 6)
		{
			had_alloys = true;
			alloys += choose(type_s, 1, 0); // оставил твою старую логику как есть
		}

		if (type_s == 3 || type_s == 5)
		{
			had_emitters = true;
			emitters += choose(1, 0); // оставил твою старую логику как есть
		}

		if (type_s == 3) had_radar = true;
		if (type_s == 6)
		{
			had_transport = true;
			// had_codes = true; // если вернёшь логику кодов
		}
	}

	if (is_destroyed)
	{
		show_debug_message($"Эскадрилья противника {indx} уничтожена!");
	}
	else
	{
		show_debug_message($"Эскадрилья противника {indx} пропала с карты мира...");
	}

	show_debug_message($"Содержит транспорт: {had_transport}");

	// ------------------------------------------------------------
	// Сообщение от Эггмана — только если действительно уничтожена
	// ------------------------------------------------------------
	if (is_destroyed)
	{
		new_mail(2);
	}
	
	if (type == 9 && global.final_battle_starts)
	{
		game_win();
	}
	
	// ------------------------------------------------------------
	// Лут / технологии — ТОЛЬКО если эскадрилья уничтожена
	// ------------------------------------------------------------
	if (is_destroyed && had_alloys)
	{
		global.technologies[8, 2] = true;

		var alloy_index = 0;
		for (var i = 1; i <= global.atstockpile[0, 0]; i++)
		{
			if (global.atstockpile[i, 0] == 25)
			{
				alloy_index = i;
				break;
			}
		}

		if (alloy_index > 0)
		{
			global.atstockpile[alloy_index, 1] += alloys;
		}
		else
		{
			global.atstockpile[0, 0]++;
			global.atstockpile[global.atstockpile[0, 0], 0] = 25;
			global.atstockpile[global.atstockpile[0, 0], 1] = alloys;
			global.atstockpile[global.atstockpile[0, 0], 2] = 0;
		}
	}

	if (is_destroyed && had_radar)
	{
		var random_chance = choose(false, false, false, true);
		if (random_chance)
		{
			if (!global.technologies[21, 2]) new_tech_available_popup();
			global.technologies[21, 2] = true;
		}
	}

	if (is_destroyed && had_emitters)
	{
		if (!global.technologies[11, 2]) new_tech_available_popup();
		global.technologies[11, 2] = true;

		var emitters_index = 0;
		for (var i = 1; i <= global.atstockpile[0, 0]; i++)
		{
			if (global.atstockpile[i, 0] == 22)
			{
				emitters_index = i;
				break;
			}
		}

		if (emitters_index > 0)
		{
			global.atstockpile[emitters_index, 1] += emitters;
		}
		else
		{
			global.atstockpile[0, 0]++;
			global.atstockpile[global.atstockpile[0, 0], 0] = 22;
			global.atstockpile[global.atstockpile[0, 0], 1] = emitters;
			global.atstockpile[global.atstockpile[0, 0], 2] = 0;
		}
	}

	if (is_destroyed && had_codes)
	{
		// global.technologies[20, 2] = true;
		// перенёс в удаление террора
	}

	// ------------------------------------------------------------
	// Место крушения / террор транспорта
	// [FIX] теперь создаётся только если эскадрилья УНИЧТОЖЕНА
	// ------------------------------------------------------------
	var is_collision_with_map = place_meeting(base_x, base_y, map_obj);

	if (is_destroyed && had_transport && is_collision_with_map && !terror_created_already)
	{
		show_debug_message("Эскадрилья сбита, смотрим, нужно ли место крушения");
		get_must_to_deploy_transport(indx, false);
		squad_array = unite_or_split_squads(indx, 0);
		if (array_length(squad_array) > 0)
		{
			show_debug_message("Создаем место крушения");

			var terror_site = instance_create(base_x, base_y, onmap_enemysite);
			terror_site.base_x = base_x;
			terror_site.base_y = base_y;
			terror_site.name   = global.txt300 + string(indx);
			terror_site.type   = 6;
			terror_site.squad_index = squad_array[array_length(squad_array) - 1].new_squad_index;
			
			if (!instance_exists(ask_parent))
			{
				var mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
				mes.event = 14;
				mes.ufo_number = indx;
				mes.target = terror_site;
			}
			else
			{
				time_m.menu_messages[0, 0]++;
				time_m.menu_messages[time_m.menu_messages[0, 0], 0] = global.txt300 + string(indx);
				time_m.menu_messages[time_m.menu_messages[0, 0], 1] = global.messages_life_time;
				time_m.new_messages = true;
			}
		}
	}
}