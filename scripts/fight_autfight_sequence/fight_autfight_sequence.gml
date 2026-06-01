/// Добавляет ручной воздушный бой. XMAS, EGG, SANTA - индексы эскадрилий сторон, -1 если не представлены.
/// BATTLE_TYPE обозначает тип боя. 1 - воздушный ручной бой, 2 - воздушный автобой, 3 - воздушный террор, 4 - воздушный автотеррор, 5 - ручной наземный бой
/// REMOVE_OBJECT_ID_IF_WIN означает ID объекта который должен быть удалён в случае победы в бою. меньше 1 если не нужен
function add_fight_to_sequence(XMAS, XMAS_ID, EGG, EGG_ID, SANTA, SANTA_ID, BATTLE_TYPE, REMOVE_OBJECT_ID_IF_WIN)
{
	var air_fight = 
	{ 
		battle_type: BATTLE_TYPE, 
		xmas: XMAS, 
		xmas_id: XMAS_ID, 
		egg: EGG, 
		egg_id: EGG_ID, 
		santa: SANTA, 
		santa_id: SANTA_ID, 
		remove_obj_id: REMOVE_OBJECT_ID_IF_WIN,
		was_been: false
	}
	array_push(global.fight_sequence, air_fight);
}



/// Отрабатывает очередь боев проходя каждую эскадрилью по очереди.
function fight_autofight_sequence()
{
	if (is_array(global.fight_sequence) && (array_length(global.fight_sequence) > 0)) global.timespeed = 0;
	if (!global.fight && !global.autofight)
	{
		for (var i = 0; i < array_length(global.fight_sequence); i++)
		{
			var fight = global.fight_sequence[i];
			if (fight.battle_type == 2 || fight.battle_type == 4) global.autofight = true;
			else global.fight = true;
			global.win = 0;
			
			break;
		}
	}
	if ((global.fight || global.autofight) && is_array(global.fight_sequence) && global.win == 0)
	{
		for (var i = 0; i < array_length(global.fight_sequence); i++)
		{
			var fight = global.fight_sequence[i];
			
			if (global.win == 0 && !fight.was_been)
			{
				global.fight_sequence[i].was_been = true;
				if (fight.battle_type == 1)
				{
					if (fight.xmas_id > 0)
					for (var q = 0; q < instance_number(onmap_escort); q++)
					{
						var escort = instance_find(onmap_escort, q);
						if (escort.own_id != fight.xmas_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.egg_id > 0)
					for (var q = 0; q < instance_number(onmap_enemy); q++)
					{
						var escort = instance_find(onmap_enemy, q);
						if (escort.own_id != fight.egg_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.santa_id > 0)
					for (var q = 0; q < instance_number(onmap_ally); q++)
					{
						var escort = instance_find(onmap_ally, q);
						if (escort.own_id != fight.santa_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.xmas > 0) global.XMAS_escort_onfight = fight.xmas;
					else global.XMAS_escort_onfight = -1;
					if (fight.egg > 0) global.EGG_escort_onfight = fight.egg;
					else global.EGG_escort_onfight = -1;
					if (fight.santa > 0) global.SANTA_escort_onfight = fight.santa;
					else global.SANTA_escort_onfight = -1;
					
					if (global.EGG_escort_onfight == -1 || (global.XMAS_escort_onfight == -1 && global.SANTA_escort_onfight = -1))
					{
						show_debug_message("Бой не смог начаться: ошибка при выборе сторон");
						fight_win_drop();
						break;
					}
					else
					if (room == map_room) room_goto(plane_map);
				}
				else
				if (fight.battle_type == 2)
				{
					if (fight.xmas_id > 0)
					for (var q = 0; q < instance_number(onmap_escort); q++)
					{
						var escort = instance_find(onmap_escort, q);
						if (escort.own_id != fight.xmas_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.egg_id > 0)
					for (var q = 0; q < instance_number(onmap_enemy); q++)
					{
						var escort = instance_find(onmap_enemy, q);
						if (escort.own_id != fight.egg_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.santa_id > 0)
					for (var q = 0; q < instance_number(onmap_ally); q++)
					{
						var escort = instance_find(onmap_ally, q);
						if (escort.own_id != fight.santa_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.xmas > 0) global.XMAS_escort_onfight = fight.xmas;
					else global.XMAS_escort_onfight = -1;
					if (fight.egg > 0) global.EGG_escort_onfight = fight.egg;
					else global.EGG_escort_onfight = -1;
					if (fight.santa > 0) global.SANTA_escort_onfight = fight.santa;
					else global.SANTA_escort_onfight = -1;
					
					if (global.EGG_escort_onfight == -1 || (global.XMAS_escort_onfight == -1 && global.SANTA_escort_onfight = -1))
					{
						show_debug_message("Бой не смог начаться: ошибка при выборе сторон");
						fight_win_drop();
						break;
					}
					else
					air_autobattle();
				}
				else
				if (fight.battle_type == 3)
				{
					if (fight.xmas_id > 0)
					for (var q = 0; q < instance_number(onmap_escort); q++)
					{
						var escort = instance_find(onmap_escort, q);
						if (escort.own_id != fight.xmas_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.egg_id > 0)
					for (var q = 0; q < instance_number(onmap_enemy); q++)
					{
						var escort = instance_find(onmap_enemy, q);
						if (escort.own_id != fight.egg_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.santa_id > 0)
					for (var q = 0; q < instance_number(onmap_ally); q++)
					{
						var escort = instance_find(onmap_ally, q);
						if (escort.own_id != fight.santa_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.xmas > 0) global.XMAS_escort_onfight = fight.xmas;
					else global.XMAS_escort_onfight = -1;
					if (fight.egg > 0) global.EGG_escort_onfight = fight.egg;
					else global.EGG_escort_onfight = -1;
					if (fight.santa > 0) global.SANTA_escort_onfight = fight.santa;
					else global.SANTA_escort_onfight = -1;
					
					if (global.EGG_escort_onfight == -1 || (global.XMAS_escort_onfight == -1 && global.SANTA_escort_onfight = -1))
					{
						show_debug_message("Бой не смог начаться: ошибка при выборе сторон");
						fight_win_drop();
						break;
					}
					else
					if (room == map_room) room_goto(plane_map);
				}
				else
				if (fight.battle_type == 4)
				{
					if (fight.xmas_id > 0)
					for (var q = 0; q < instance_number(onmap_escort); q++)
					{
						var escort = instance_find(onmap_escort, q);
						if (escort.own_id != fight.xmas_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.egg_id > 0)
					for (var q = 0; q < instance_number(onmap_enemy); q++)
					{
						var escort = instance_find(onmap_enemy, q);
						if (escort.own_id != fight.egg_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.santa_id > 0)
					for (var q = 0; q < instance_number(onmap_ally); q++)
					{
						var escort = instance_find(onmap_ally, q);
						if (escort.own_id != fight.santa_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.xmas > 0) global.XMAS_escort_onfight = fight.xmas;
					else global.XMAS_escort_onfight = -1;
					if (fight.egg > 0) global.EGG_escort_onfight = fight.egg;
					else global.EGG_escort_onfight = -1;
					if (fight.santa > 0) global.SANTA_escort_onfight = fight.santa;
					else global.SANTA_escort_onfight = -1;
					
					if (global.EGG_escort_onfight == -1 || (global.XMAS_escort_onfight == -1 && global.SANTA_escort_onfight = -1))
					{
						show_debug_message("Бой не смог начаться: ошибка при выборе сторон");
						fight_win_drop();
						break;
					}
					else
					air_autobattle();
				}
				else
				if (fight.battle_type == 5)
				{
					if (fight.xmas_id > 0)
					for (var q = 0; q < instance_number(onmap_escort); q++)
					{
						var escort = instance_find(onmap_escort, q);
						if (escort.own_id != fight.xmas_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.egg_id > 0)
					for (var q = 0; q < instance_number(onmap_enemy); q++)
					{
						var escort = instance_find(onmap_enemy, q);
						if (escort.own_id != fight.egg_id) continue;
						escort.infight = true;
						break;
					}
					if (fight.santa_id > 0)
					for (var q = 0; q < instance_number(onmap_ally); q++)
					{
						var escort = instance_find(onmap_ally, q);
						if (escort.own_id != fight.santa_id) continue;
						escort.infight = true;
						break;
					}
					
					if (fight.xmas >= 0) global.XMAS_squad_onfight = fight.xmas;
					else global.XMAS_squad_onfight = -1;
					if (fight.egg > 0) global.EGG_squad_onfight = fight.egg;
					else global.EGG_squad_onfight = -1;
					if (fight.santa > 0) global.SANTA_squad_onfight = fight.santa;
					else global.SANTA_squad_onfight = -1;
				}
			}
			else 
			{
				show_debug_message("Победа не была сброшена!");
			}
			break;
		}	
	}
}

/// Сбрасывает флаг победы с последствиями
function fight_win_drop()
{
	if (array_length(global.fight_sequence) > 0)
	for (var i = 0; i < array_length(global.fight_sequence); i++)
	{
		var fight = global.fight_sequence[i];
		global.fight = false;
		global.autofight = false;
		global.XMAS_escort_onfight = -1;
		global.XMAS_squad_onfight = -1;
		global.EGG_escort_onfight = -1;
		global.EGG_squad_onfight = -1;
		global.SANTA_escort_onfight = -1;
		global.SANTA_squad_onfight = -1;
		if (fight.xmas_id > 0)
		for (var q = 0; q < instance_number(onmap_escort); q++)
		{
			if (fight.battle_type == 5) break;
			var escort = instance_find(onmap_escort, q);
			if (escort.own_id != fight.xmas_id) continue;
			escort.infight = false;
			break;
		}
		if (fight.egg_id > 0)
		for (var q = 0; q < instance_number(onmap_enemy); q++)
		{
			var escort = instance_find(onmap_enemy, q);
			if (escort.own_id != fight.egg_id) continue;
			escort.infight = false;
			break;
		}
		if (fight.santa_id > 0)
		for (var q = 0; q < instance_number(onmap_ally); q++)
		{
			var escort = instance_find(onmap_ally, q);
			if (escort.own_id != fight.santa_id) continue;
			escort.infight = false;
			break;
		}
		if (global.win > 0 && fight.remove_obj_id > 0)
		{
			for (var q = 0; q < instance_number(map_escort_objects); q++)
			{
				var map_object = instance_find(map_escort_objects, q);
				if (map_object.own_id != fight.remove_obj_id) continue;
				instance_destroy(map_object);
				global.xmas_score += 500;
				show_debug_message("Был уничтожен объект по данным очередности боев так как была достигнута победа");
			}
			for (var q = 0; q < instance_number(map_objects); q++)
			{
				var map_object = instance_find(map_objects, q);
				if (map_object.own_id != fight.remove_obj_id) continue;
				instance_destroy(map_object);
				global.xmas_score += 500;
				show_debug_message("Был уничтожен объект по данным очередности боев так как была достигнута победа");
			}
		}
		else
		if (global.win < 0 && global.ground_battle_type == 5)
		{
			game_over();	
		}
		
		global.ground_battle_type = 0;
		global.win = 0;
		show_debug_message("Флаги победы и боя сброшены");
		array_delete(global.fight_sequence, i, 1);
		break;
	}	
	else
	{
		show_debug_message("Флаги победы и боя сброшены, но очерёдность боёв пустая!");
		if (global.win < 0 && global.ground_battle_type == 5)
		{
			game_over();	
		}
		global.ground_battle_type = 0;
		global.win = 0;
		global.fight = false;
		global.autofight = false;
		global.XMAS_escort_onfight = -1;
		global.XMAS_squad_onfight = -1;
		global.EGG_escort_onfight = -1;
		global.EGG_squad_onfight = -1;
		global.SANTA_escort_onfight = -1;
		global.SANTA_squad_onfight = -1;
	}
}