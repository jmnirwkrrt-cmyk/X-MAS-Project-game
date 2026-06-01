function __plane_prepare_reload_slot(_weapon_index, _current_ammo)
{
	var _result =
	{
		final_ammo   : _current_ammo,
		service_time : 0,
		needed       : false,
		loaded       : false
	};
	
	if (_weapon_index <= 0) return _result;
	
	var _max_ammo = global.airweapon[_weapon_index, 2];
	if (_max_ammo <= 0) return _result;
	
	var _missing_ammo = _max_ammo - _current_ammo;
	if (_missing_ammo <= 0) return _result;
	
	_result.needed = true;
	
	var _stock_row = 0;
	for (var i = 1; i <= global.atstockpile[0, 0]; i++)
	{
		if (global.atstockpile[i, 1] < 1) continue;
		if (global.airweapon[_weapon_index, 3] == global.atstockpile[i, 0])
		{
			_stock_row = i;
			break;
		}
	}
	
	if (_stock_row == 0) return _result;
	
	var _raw_stock = global.atstockpile[_stock_row, 1];
	var _effective_stock = _raw_stock;
	var _legacy_500_mode = (global.airweapon[_weapon_index, 0] == 10 || global.airweapon[_weapon_index, 0] == 35);
	
	// старый спец-кейс
	if (_legacy_500_mode && _effective_stock > 0)
	{
		_effective_stock += 499;
	}
	
	var _ammo_to_load = min(_missing_ammo, _effective_stock);
	if (_ammo_to_load <= 0) return _result;
	
	_result.final_ammo = _current_ammo + _ammo_to_load;
	_result.service_time = global.airweapon[_weapon_index, 4] * (_ammo_to_load / _max_ammo);
	_result.loaded = true;
	
	// списываем БК со склада сразу
	if (!_legacy_500_mode)
	{
		global.atstockpile[_stock_row, 1] -= _ammo_to_load;
		if (global.atstockpile[_stock_row, 1] < 0) global.atstockpile[_stock_row, 1] = 0;
	}
	else
	{
		var _remaining_effective = _effective_stock - _ammo_to_load;
		
		if (_remaining_effective <= 0)
		{
			global.atstockpile[_stock_row, 1] = 0;
		}
		else if (_remaining_effective <= 499)
		{
			global.atstockpile[_stock_row, 1] = 1;
		}
		else
		{
			global.atstockpile[_stock_row, 1] = _remaining_effective - 499;
		}
	}
	
	return _result;
}

function __plane_reload_warning(_plane_index)
{
	if (!instance_exists(ask_message))
	{
		var mes = instance_create(1200 / 2, 900 / 2, ask_message);
		mes.event = 13;
	}
	else
	{
		time_m.menu_messages[0,0]++;
		time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt239;
		time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
		time_m.new_messages = true;
	}
}


function planes_and_infantry_service()
{
	var i, i1;
	var lazar = false;
	
	// ленивое создание служебных массивов
	global.plane_reload_ammo[0, 0] = 0;
	global.plane_reload_warned[0] = false;
	
	// есть ли лазарет
	for (i = 1; i <= global.basebuilding[0, 0]; i++)
	{
		if (global.basebuilding[i, 0] == "clinic")
		{
			lazar = true;
			break;
		}
	}
	
	// проверяем не сбит ли транспорт с пехотой
	for (i = 1; i <= global.team[0, 0]; i++)
	{
		if (global.team[i, 0] < 1) continue;
		var is_lost_transport = false;
		var is_transport_exists = false;
		for (i1 = 1; i1 <= global.planes[0, 0]; i1++)
		{
			if (i1 != global.team[i, 0]) continue;
			is_transport_exists = true;
			if (global.planes[i1, 2] < 1) is_lost_transport = true;
			break;
		}
		
		if (is_lost_transport)
		{
			global.team[i, 0] = 0;
			if (global.operatives_can_die) global.team[i, 4] = 0;
			else global.team[i, 4] = 1;
		}
		if (!is_transport_exists)
		{
			show_debug_message("У пехоты несуществующий транспорт!!!");
			global.team[i, 0] = 0;
		}
	}
	
	// лечение пехоты
	for (i = 1; i <= global.team[0, 0]; i++)
	{
		if (global.team[i, 4] >= global.team[i, 5]) global.team[i, 4] = global.team[i, 5];
		if (global.team[i, 4] < global.team[i, 5] && global.team[i, 0] > 0) 
		{
			if (global.planes[global.team[i, 0], 14] < 1) global.team[i, 0] = 0; 
		}
		if (global.team[i, 0] == 0 && global.team[i, 4] < global.team[i, 5] && (global.team[i, 4] > 0 || !global.operatives_can_die))
		{
			global.team[i, 0] = 0;
			global.team[i, 4] += global.timespeed / 1000;
			if (lazar) global.team[i, 4] += global.timespeed / 1000;
			if (global.team[i, 4] > global.team[i, 5]) global.team[i, 4] = global.team[i, 5];
			if (global.team[i, 4] == global.team[i, 5] && i == 8) global.silver_apples = false;
		}
	}
	// перезарядка пехоты
	for (i = 1; i <= global.team[0, 0]; i++)
	{
		if (global.team[i, 7])
		{
			if (global.team[i, 3] == "") global.team[i, 7] = false;
			if (global.team[i, 3] == "laser") global.team[i, 7] = false;
			if (global.team[i, 3] == "ak")
			{
				for (var q = 1; q <= global.atstockpile[0, 0]; q++)
				{
					if (global.atstockpile[q, 0] != 4 || global.atstockpile[q, 1] < 1) continue;
					global.atstockpile[q, 1]--;
					global.team[i, 7] = false;
				}
				if (global.team[i, 7]) 
				{
					if (instance_exists(map_obj) && !instance_exists(ask_parent))
					{
						var mes = instance_create(1200 / 2, 900 / 2, ask_message);
						mes.event = 29;
					}
					else
					{
						time_m.menu_messages[0,0]++;
						time_m.menu_messages[time_m.menu_messages[0,0],0] = global.map_messages_text_8;
						time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
						time_m.new_messages = true;
					}
					global.team[i, 3] = "";
				}
			}
			if (global.team[i, 3] == "rifle")
			{
				for (var q = 1; q <= global.atstockpile[0, 0]; q++)
				{
					if (global.atstockpile[q, 0] != 5 || global.atstockpile[q, 1] < 1) continue;
					global.atstockpile[q, 1]--;
					global.team[i, 7] = false;
				}
				if (global.team[i, 7]) 
				{
					if (instance_exists(map_obj) && !instance_exists(ask_parent))
					{
						var mes = instance_create(1200 / 2, 900 / 2, ask_message);
						mes.event = 29;
					}
					else
					{
						time_m.menu_messages[0,0]++;
						time_m.menu_messages[time_m.menu_messages[0,0],0] = global.map_messages_text_8;
						time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
						time_m.new_messages = true;
					}
					global.team[i, 3] = "";
				}
			}
		}
	}
	
	// =========================================================
	// 1) ОБРАБОТКА УЖЕ ИДУЩЕГО ОБСЛУЖИВАНИЯ
	// =========================================================
	for (i = 1; i <= global.planes[0, 0]; i++)
	{
		if (global.planes[i, 2] < 1 || global.planes[i, 14] != 0) continue;
		
		// универсальный тик таймера обслуживания
		if (global.planes[i, 12] != 0 && global.planes[i, 13] > 0)
		{
			global.planes[i, 13] -= global.timespeed;
			if (global.planes[i, 13] < 0) global.planes[i, 13] = 0;
		}
		
		// -------------------------
		// состояние 4
		// -------------------------
		if (global.planes[i, 12] == 4)
		{
			if (global.planes[i, 13] <= 0)
			{
				global.planes[i, 2] = global.planedata[global.planes[i, 0], 1];
				global.planes[i, 12] = 0;
				global.planes[i, 13] = 0;
			}
			continue;
		}
		
		// -------------------------
		// перезарядка
		// -------------------------
		if (global.planes[i, 12] == 2)
		{
			if (global.planes[i, 13] <= 0)
			{
				global.planes[i, 7]  = global.plane_reload_ammo[i, 1];
				global.planes[i, 9]  = global.plane_reload_ammo[i, 2];
				global.planes[i, 11] = global.plane_reload_ammo[i, 3];
				
				// если после завершения всё ещё не полный БК — предупреждаем
				var still_missing = false;
				
				if (global.planes[i, 6] > 0 && global.planes[i, 7] < global.airweapon[global.planes[i, 6], 2]) still_missing = true;
				if (global.planes[i, 8] > 0 && global.planes[i, 9] < global.airweapon[global.planes[i, 8], 2]) still_missing = true;
				if (global.planes[i, 10] > 0 && global.planes[i, 11] < global.airweapon[global.planes[i, 10], 2]) still_missing = true;
				
				if (still_missing)
				{
					__plane_reload_warning(i);
					global.plane_reload_warned[i] = true;
				}
				else
				{
					global.plane_reload_warned[i] = false;
				}
				
				global.plane_reload_ammo[i, 1] = 0;
				global.plane_reload_ammo[i, 2] = 0;
				global.plane_reload_ammo[i, 3] = 0;
				
				global.planes[i, 12] = 0;
				global.planes[i, 13] = 0;
			}
			continue;
		}
		
		// -------------------------
		// заправка
		// -------------------------
		if (global.planes[i, 12] == 3)
		{
			global.planes[i, 1] += 2 * global.timespeed;
			
			if (global.planes[i, 1] > global.planedata[global.planes[i, 0], 5])
			{
				global.planes[i, 1] = global.planedata[global.planes[i, 0], 5];
			}
			
			if (global.planes[i, 1] >= global.planedata[global.planes[i, 0], 5] || global.planes[i, 13] <= 0)
			{
				global.planes[i, 1] = global.planedata[global.planes[i, 0], 5];
				global.planes[i, 12] = 0;
				global.planes[i, 13] = 0;
			}
			continue;
		}
		
		// -------------------------
		// ремонт
		// -------------------------
		if (global.planes[i, 12] == 1)
		{
			var max_hp = global.planedata[global.planes[i, 0], 1];
			var full_repair_time = max_hp * 100;
			var repair_per_time = max_hp / full_repair_time;
			
			global.planes[i, 2] += repair_per_time * global.timespeed;
			
			if (global.planes[i, 2] > max_hp)
			{
				global.planes[i, 2] = max_hp;
			}
			
			if (global.planes[i, 2] >= max_hp || global.planes[i, 13] <= 0)
			{
				global.planes[i, 2] = max_hp;
				global.planes[i, 12] = 0;
				global.planes[i, 13] = 0;
			}
			continue;
		}
	}
	
	
	// =========================================================
	// 2) НАЗНАЧАЕМ НОВОЕ ОБСЛУЖИВАНИЕ ВСЕМ СВОБОДНЫМ САМОЛЁТАМ
	// =========================================================
	for (i = 1; i <= global.planes[0, 0]; i++)
	{
		if (global.planes[i, 2] < 1 || global.planes[i, 14] != 0 || global.planes[i, 12] != 0 || global.planes[i, 12] == 4) continue;
		
		// приоритет 1: заправка
		if (global.planes[i, 1] < global.planedata[global.planes[i, 0], 5])
		{
			global.planes[i, 12] = 3;
			global.planes[i, 13] = (global.planedata[global.planes[i, 0], 5] - global.planes[i, 1]) / 2;
			if (global.planes[i, 13] < 0) global.planes[i, 13] = 0;
			continue;
		}
		
		// приоритет 2: перезарядка
		var slot1 = __plane_prepare_reload_slot(global.planes[i, 6],  global.planes[i, 7]);
		var slot2 = __plane_prepare_reload_slot(global.planes[i, 8],  global.planes[i, 9]);
		var slot3 = __plane_prepare_reload_slot(global.planes[i, 10], global.planes[i, 11]);
		
		var reload_time = max(slot1.service_time, max(slot2.service_time, slot3.service_time));
		
		var need_reload = slot1.needed || slot2.needed || slot3.needed;
		var loaded_any  = slot1.loaded || slot2.loaded || slot3.loaded;
		
		if (reload_time > 0)
		{
			global.plane_reload_ammo[i, 1] = slot1.final_ammo;
			global.plane_reload_ammo[i, 2] = slot2.final_ammo;
			global.plane_reload_ammo[i, 3] = slot3.final_ammo;
			
			// БК НЕ обнуляем во время обслуживания.
			// Самолёт и так недоступен из-за статуса 2, зато не будет ощущения, что он "съел" ракеты.
			
			global.planes[i, 12] = 2;
			global.planes[i, 13] = reload_time;
			global.plane_reload_warned[i] = false;
			continue;
		}
		else if (need_reload && !loaded_any)
		{
			// Нужно перезарядиться, но на складе вообще нечем
			if (!global.plane_reload_warned[i])
			{
				__plane_reload_warning(i);
				global.plane_reload_warned[i] = true;
			}
		}
		else
		{
			// либо БК не нужен, либо удалось хотя бы что-то зарезервировать ранее
			global.plane_reload_warned[i] = false;
		}
		
		// приоритет 3: ремонт
		if (global.planes[i, 2] < global.planedata[global.planes[i, 0], 1])
		{
			var max_hp = global.planedata[global.planes[i, 0], 1];
			var missing_hp = max_hp - global.planes[i, 2];
			var full_repair_time = max_hp * 100;
			var repair_ratio = missing_hp / max_hp;
			
			global.planes[i, 12] = 1;
			global.planes[i, 13] = full_repair_time * repair_ratio;
			if (global.planes[i, 13] < 0) global.planes[i, 13] = 0;
			continue;
		}
	}
}