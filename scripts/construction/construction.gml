function construction()
{
	if (!instance_exists(time_m)) exit;
	var i, i1;

	// [FIX] Пересчитываем спецресурсы с нуля, иначе они могут накапливаться каждый вызов функции
	time_m.splav       = 0;
	time_m.energo      = 0;
	time_m.energyscrap = 0;
	time_m.motobug     = 0;
	time_m.metalson    = 0;
	time_m.pawn        = 0;
	time_m.cyberdisc   = 0;
	time_m.turret      = 0;

	// ------------------------------------------------------------
	// Пересчёт доступных спецресурсов на складе
	// ------------------------------------------------------------
	for (i = 1; i <= global.atstockpile[0, 0]; i++)
	{
		if (global.atstockpile[i, 1] < 1) continue;

		if (global.atstockpile[i, 0] == 25) time_m.splav       += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 17) time_m.energo      += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 22) time_m.energyscrap += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 18) time_m.motobug     += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 19) time_m.metalson    += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 20) time_m.pawn        += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 21) time_m.cyberdisc   += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 23) time_m.turret      += global.atstockpile[i, 1];
	}

	// ------------------------------------------------------------
	// Обновление производства
	// ------------------------------------------------------------
	for (i = 1; i <= global.constructitem[0, 0]; i++)
	{
		var item_index = global.constructitem[i, 0];
		var item_count = global.constructitem[i, 1];
		var item_size  = global.items[item_index, 2];

		// [FIX] Если очередь уже пустая — освобождаем инженеров и место
		if (item_count < 1)
		{
			global.engineers     += global.constructitem[i, 8];
			global.workshopplace += global.constructitem[i, 8];
			global.constructitem[i, 8] = 0;
			continue;
		}

		// Проверка: можно ли сейчас строить
		var can_build = true;

		if (global.money < global.constructitem[i, 4])
		{
			can_build = false;
		}
		else
		{
			if (item_size > 0 && global.stock < item_size)
			{
				can_build = false;
			}
			else if (item_size == -1 && (global.maxciv - global.currentciv) < 1)
			{
				can_build = false;
			}
			else if (item_size == -2 && global.maxplanes < 1)
			{
				can_build = false;
			}
			else if (
				global.constructitem[i, 5]  > time_m.splav       ||
				global.constructitem[i, 6]  > time_m.energo      ||
				global.constructitem[i, 7]  > time_m.energyscrap ||
				global.constructitem[i, 10] > time_m.motobug     ||
				global.constructitem[i, 11] > time_m.metalson    ||
				global.constructitem[i, 12] > time_m.pawn        ||
				global.constructitem[i, 13] > time_m.cyberdisc   ||
				global.constructitem[i, 14] > time_m.turret
			)
			{
				can_build = false;
			}
		}

		if (can_build)
		{
			global.constructitem[i, 2] -= global.timespeed * global.constructitem[i, 8] * global.engineerpower;
		}

		// --------------------------------------------------------
		// Предмет/самолёт произведён
		// --------------------------------------------------------
		if (global.constructitem[i, 2] < 0)
		{
			global.constructitem[i, 1]--;
			global.money -= global.constructitem[i, 4];

			// Списание спецресурсов со склада
			var need_splav       = global.constructitem[i, 5];
			var need_energo      = global.constructitem[i, 6];
			var need_scrap       = global.constructitem[i, 7];
			var need_motobug     = global.constructitem[i, 10];
			var need_metalson    = global.constructitem[i, 11];
			var need_pawn        = global.constructitem[i, 12];
			var need_cyberdisc   = global.constructitem[i, 13];
			var need_turret      = global.constructitem[i, 14];

			for (i1 = 1; i1 <= global.atstockpile[0, 0]; i1++)
			{
				if (global.atstockpile[i1, 1] < 1) continue;

				if (global.atstockpile[i1, 0] == 25 && need_splav > 0)
				{
					global.atstockpile[i1, 1] -= need_splav;
					if (global.atstockpile[i1, 1] < 0) global.atstockpile[i1, 1] = 0;
					need_splav = 0;
				}
				if (global.atstockpile[i1, 0] == 17 && need_energo > 0)
				{
					global.atstockpile[i1, 1] -= need_energo;
					if (global.atstockpile[i1, 1] < 0) global.atstockpile[i1, 1] = 0;
					need_energo = 0;
				}
				if (global.atstockpile[i1, 0] == 22 && need_scrap > 0)
				{
					global.atstockpile[i1, 1] -= need_scrap;
					if (global.atstockpile[i1, 1] < 0) global.atstockpile[i1, 1] = 0;
					need_scrap = 0;
				}
				if (global.atstockpile[i1, 0] == 18 && need_motobug > 0)
				{
					global.atstockpile[i1, 1] -= need_motobug;
					if (global.atstockpile[i1, 1] < 0) global.atstockpile[i1, 1] = 0;
					need_motobug = 0;
				}
				if (global.atstockpile[i1, 0] == 19 && need_metalson > 0)
				{
					global.atstockpile[i1, 1] -= need_metalson;
					if (global.atstockpile[i1, 1] < 0) global.atstockpile[i1, 1] = 0;
					need_metalson = 0;
				}
				if (global.atstockpile[i1, 0] == 20 && need_pawn > 0)
				{
					global.atstockpile[i1, 1] -= need_pawn;
					if (global.atstockpile[i1, 1] < 0) global.atstockpile[i1, 1] = 0;
					need_pawn = 0;
				}
				if (global.atstockpile[i1, 0] == 21 && need_cyberdisc > 0) // [FIX]
				{
					global.atstockpile[i1, 1] -= need_cyberdisc;
					if (global.atstockpile[i1, 1] < 0) global.atstockpile[i1, 1] = 0;
					need_cyberdisc = 0;
				}
				if (global.atstockpile[i1, 0] == 23 && need_turret > 0)
				{
					global.atstockpile[i1, 1] -= need_turret;
					if (global.atstockpile[i1, 1] < 0) global.atstockpile[i1, 1] = 0;
					need_turret = 0;
				}
			}

			// ----------------------------------------------------
			// Обычный предмет -> на склад
			// ----------------------------------------------------
			if (item_size > 0)
			{
				var d = 0;

				for (i1 = 1; i1 <= global.atstockpile[0, 0]; i1++)
				{
					if (global.atstockpile[i1, 0] == item_index)
					{
						d = i1;
						break;
					}
				}

				if (d == 0)
				{
					global.atstockpile[0, 0]++;
					d = global.atstockpile[0, 0];
					global.atstockpile[d, 0] = item_index;
					global.atstockpile[d, 1] = 1;
					global.atstockpile[d, 2] = 0;
				}
				else
				{
					global.atstockpile[d, 1]++;
				}
			}

			// ----------------------------------------------------
			// Самолёт -> в массив самолётов
			// ----------------------------------------------------
			if (item_size == -2)
			{
				var plane_data_index = 0;

				for (var i3 = 1; i3 <= global.planedata[0, 0]; i3++)
				{
					if (global.planedata[i3, 16] == item_index)
					{
						plane_data_index = i3;
						break;
					}
				}

				if (plane_data_index != 0)
				{
					global.planes[0, 0]++;
					var t = global.planes[0, 0];

					global.planes[t, 0]  = plane_data_index;                             // индекс в planedata
					global.planes[t, 1]  = 0;                                            // текущее топливо
					global.planes[t, 2]  = global.planedata[plane_data_index, 1];        // хп
					global.planes[t, 3]  = 0;                                            // скорость
					global.planes[t, 4]  = global.planedata[plane_data_index, 12];       // место для десанта
					global.planes[t, 5]  = global.planedata[plane_data_index, 13];       // место для груза
					global.planes[t, 6]  = global.planedata[plane_data_index, 2];        // оружие 1
					global.planes[t, 7]  = 0;                                            // БК оружия 1
					global.planes[t, 8]  = global.planedata[plane_data_index, 3];        // оружие 2
					global.planes[t, 9]  = 0;                                            // БК оружия 2
					global.planes[t, 10] = global.planedata[plane_data_index, 4];        // оружие 3
					global.planes[t, 11] = 0;                                            // БК оружия 3
					global.planes[t, 12] = 3;                                            // статус: дозаправка
					global.planes[t, 13] = global.planedata[plane_data_index, 5] / 2;    // [FIX] корректное время дозаправки
					global.planes[t, 14] = 0;                                            // номер эскадрильи
					global.planes[t, 15] = global.planedata[plane_data_index, 0];        // название
					global.planes[t, 16] = 0;                                            // гранаты
					global.planes[t, 17] = 0;                                            // аптечки
				}
				else
				{
					show_debug_message("⚠ Не найден plane_data_index для предмета: " + string(item_index));
				}
			}

			// ----------------------------------------------------
			// Если в очереди ещё есть предметы — перезапускаем таймер
			// ----------------------------------------------------
			if (global.constructitem[i, 1] > 0)
			{
				global.constructitem[i, 2] = global.constructitem[i, 3];
			}
			else
			{
				if (!instance_exists(ask_parent))
				{
					var mess = instance_create(1200 / 2, 900 / 2, ask_message);
					mess.plane_indx = i;
					mess.event = 24;
					global.timespeed = 0;
				}
				else
				{
					time_m.menu_messages[0, 0]++;
					time_m.menu_messages[time_m.menu_messages[0, 0], 0] = global.txt344 + global.items[item_index, 0];
					time_m.menu_messages[time_m.menu_messages[0, 0], 1] = global.messages_life_time;
					time_m.new_messages = true;
				}

				global.constructitem[i, 2] = 0;

				// [FIX] освобождаем именно назначенных на этот проект инженеров
				global.engineers     += global.constructitem[i, 8];
				global.workshopplace += global.constructitem[i, 8];
				global.constructitem[i, 8] = 0;
			}
		}
	}
}