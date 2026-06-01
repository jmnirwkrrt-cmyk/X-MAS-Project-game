//instance_destroy(text_obj_red_28);
instance_destroy(text_obj_white_28);
instance_deactivate_object(text_obj_red_28);

global.timespeed = 0;

if (!instance_exists(target) && instance_exists(owner) && (type == 2 || type == 3 || type == 4 || type == 5 || type == 6) ) { instance_destroy(self); owner.status = 3; exit; }


if (image_xscale = 1 and image_yscale = 1 and !ready)
{
	but1 = instance_create(x - 288, y + 62, button_large_q_yes)
	but2 = instance_create(x + 17, y + 62, button_large_q_no)
	but3 = instance_create(x - 288, y - 0, button_large_q_ok)
	if (type == 2 || type == 4) but4 = instance_create(x + 17, y - 0, button_large_q_ok)
	text = instance_create(x, y - 125, text_obj_red);
	text.w = 500;
	ready = true;
	
}
if (ready)
{
	
if (type == 1)
{
	text.txt = global.txt231 + string(indx);
	
	but1.text.txt = global.txt219; 
	but2.txt = global.txt220;
	but3.text.txt = global.txt19;
	
	if (but1.yes)
	{
		if (!instance_exists(ask_message) and !instance_exists(mouse_target_inter))
		{
			global.click = true;
			sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
			image_index = 0;
			
			var mos = instance_create(0, 0, mouse_target_inter);
			mos.indx = indx;
			var mes = instance_create(1200 / 2, 100, ask_message);
			mes.event = -10;
			instance_destroy(self);
		}
	}
	else
	if (but2.no) 
	{ 
		for (var i = 0; i < instance_number(onmap_escort); i++)
		{
			if (instance_find(onmap_escort, i).indx != indx) continue;
			var obj = instance_find(onmap_escort, i);
			obj.status = 3;
			instance_destroy(self);
			break;
		}
	}
	else
	if (but3.ok) 
	{
		instance_destroy(self);
	}
}
if (type == 2)
{
	text.txt = global.txt234 + string(indx);
	
	but1.text.txt = global.txt232; // ручной бой
	but2.txt = global.txt220; // на базу
	but3.text.txt = global.txt233; // преследовать
	but4.text.txt = global.txt250; // автобой
	
	if (!instance_exists(target) && instance_exists(owner)) { instance_destroy(self); owner.status = 3; exit; }
	
	if (but1.yes)
	{
		if (instance_exists(owner) && instance_exists(target))
		add_fight_to_sequence(indx, owner.own_id, target.indx, target.own_id, 0, 0, 1, 0);
		else show_debug_message("Попытка начать бой провалилась: не существует одного из объектов!");
		instance_destroy(self);
	}
	else
	if (but2.no) 
	{ 
		owner.status = 3;
		instance_destroy(self);
	}
	else
	if (but3.ok) 
	{
		owner.status = 5;
		instance_destroy(self);
	}
	else
	if (but4.ok) 
	{
		if (instance_exists(owner) && instance_exists(target))
		add_fight_to_sequence(indx, owner.own_id, target.indx, target.own_id, 0, 0, 2, 0);
		else show_debug_message("Попытка начать бой провалилась: не существует одного из объектов!");
		instance_destroy(self);
	}
}

if (type == 3)
{
	text.txt = global.txt235 + string(indx);
	
	but1.text.txt = global.txt219; 
	but2.txt = global.txt220;
	but3.text.txt = global.txt233;
	
	if (!instance_exists(target) && instance_exists(owner)) { instance_destroy(self); owner.status = 3; exit; }
	
	if (but1.yes)
	{
		if (!instance_exists(ask_message) and !instance_exists(mouse_target_inter))
		{
		global.click = true;
		sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
		image_index = 0;
		
		var mos = instance_create(0, 0, mouse_target_inter);
		mos.indx = indx;
		var mes = instance_create(1200 / 2, 100, ask_message);
		mes.event = -10;
		instance_destroy(self);
		}
	}
	else
	if (but2.no) 
	{ 
		if (instance_exists(onmap_escort))
		{
			var obj;
			for (var i = 0; i < instance_number(onmap_escort); i++)
			{
				obj = instance_find(onmap_escort, i);
				if (obj.indx == ufo_number) break;
			}
				obj.status = 3;
		}
		instance_destroy(self);
	}
	else
	if (but3.ok) 
	{
		if (instance_exists(onmap_escort))
		{
			var obj;
			for (var i = 0; i < instance_number(onmap_escort); i++)
			{
				obj = instance_find(onmap_escort, i);
				if (obj.indx == ufo_number) break;
			}
			obj.status = 6;
		}
		instance_destroy(self);
	}
}



if (type == 4)
{
	instance_destroy(but2);
	instance_destroy(but3);
	
	var target_killed = true;
	for (var i = 0; i < instance_number(onmap_enemy); i++)
	{
		var obj = instance_find(onmap_enemy, i);
		if (obj.indx == indx) { target_killed = false; break; }
	}
	if (target_killed) { instance_destroy(self); exit; }
	text.txt = global.txt259 + string(indx);
	
	but1.text.txt = global.txt232; // ручной бой
	if (instance_exists(but2)) but2.txt = global.txt220; // на базу
	if (instance_exists(but3)) but3.text.txt = global.txt233; // преследовать
	but4.text.txt = global.txt250; // автобой
	
	if (!instance_exists(target) && instance_exists(owner)) { instance_destroy(self); owner.status = 3; exit; }
	
	
	
	if (but1.yes)
	{
		if (instance_exists(owner) && instance_exists(target))
		add_fight_to_sequence(target.indx, target.own_id, indx, owner.own_id, 0, 0, 1, 0);
		else show_debug_message("Попытка начать бой провалилась: не существует одного из объектов!");
		instance_destroy(self);
	}
	else
	if (but4.ok) 
	{
		if (instance_exists(owner) && instance_exists(target))
		add_fight_to_sequence(target.indx, target.own_id, indx, owner.own_id, 0, 0, 2, 0);
		else show_debug_message("Попытка начать бой провалилась: не существует одного из объектов!");
		instance_destroy(self);
	}
}




if (type == 5)
{
	text.txt = global.txt231 + string(indx);
	
	but1.text.txt = global.txt291; // начать высадку
	but2.txt = global.txt220; // на базу
	but3.text.txt = global.txt292; // атака с воздуха
	but3.x = x;
	
	if (!instance_exists(target) && instance_exists(owner)) { instance_destroy(self); owner.status = 3; exit; }
	
	if (but1.yes)
	{
		var can_invade_from_air = false;
		for (var i = 1; i <= global.planes[0, 0]; i++)
		{
			if (global.planes[i, 14] != indx) continue;
			if (global.planes[i, 4] < 1) continue;
			for (i1 = 1; i1 <= global.team[0, 0]; i1++)
			{
				if (global.team[i1, 0] == i && global.team[i1, 4] > 0) {can_invade_from_air = true; break; }
			}
			
		}
		
		if (can_invade_from_air)
		{
			if (instance_exists(owner) && instance_exists(target))
			//add_fight_to_sequence(target.squad_index, 0, indx, obj.own_id, target.santa_squad_index, 0, 5, target.own_id);
			//else show_debug_message("Попытка начать бой провалилась: не существует одного из объектов!");
			owner.infight = true;
			
			//but1.yes = false;
			if (but1 != noone) instance_activate_object(but1);
			if (but2 != noone) instance_activate_object(but2);
			if (but3 != noone) instance_activate_object(but3);
			if (but4 != noone) instance_activate_object(but4);
			instance_destroy(self);
		}
		else
		{
			but1.yes = false;
			instance_deactivate_object(button_large_q_no);
			instance_deactivate_object(button_large_q_ok);
			instance_deactivate_object(button_large_q_yes);
			instance_deactivate_object(text_obj_red);
			var mes = instance_create(x, y, ask_message); // нет пехоты на корабле
			mes.event = 23;
			instance_deactivate_object(self);
		}
	}
	else
	if (but2.no) 
	{ 
		for (var i = 0; i < instance_number(onmap_escort); i++)
		{
			if (instance_find(onmap_escort, i).indx != indx) continue;
			var obj = instance_find(onmap_escort, i);
			obj.status = 3;
			break;
		}
		if (but1 != noone) instance_activate_object(but1);
		if (but2 != noone) instance_activate_object(but2);
		if (but3 != noone) instance_activate_object(but3);
		if (but4 != noone) instance_activate_object(but4);
		instance_destroy(self);
	}
	else
	if (but3.ok) 
	{
		but3.ok = false;
		// Авиаудар по наземной цели

		var cas_power = 0;
		
		// [FIX] Сначала проверяем, существует ли цель
		if (!instance_exists(target))
		{
		    instance_deactivate_object(button_large_q_no);
		    instance_deactivate_object(button_large_q_ok);
		    instance_deactivate_object(button_large_q_yes);
		    instance_deactivate_object(text_obj_red);
		
		    var mes = instance_create(x, y, ask_message);
		    mes.event = 16; // или свой отдельный event "цель исчезла"
		
		    instance_deactivate_object(self);
		    exit;
		}
		
		// Подсчёт огневой мощи
		for (var i = 1; i <= global.planes[0, 0]; i++)
		{
		    if (global.planes[i, 14] != indx) continue;
		
		    if (global.planes[i, 6] > 0 && global.airweapon[global.planes[i, 6], 6] && global.planes[i, 7] > 0)
		    {
		        cas_power += global.airweapon[global.planes[i, 6], 9] * global.planes[i, 7];
		    }
		
		    if (global.planes[i, 8] > 0 && global.airweapon[global.planes[i, 8], 6] && global.planes[i, 9] > 0)
		    {
		        cas_power += global.airweapon[global.planes[i, 8], 9] * global.planes[i, 9];
		    }
		
		    if (global.planes[i, 10] > 0 && global.airweapon[global.planes[i, 10], 6] && global.planes[i, 11] > 0)
		    {
		        cas_power += global.airweapon[global.planes[i, 10], 9] * global.planes[i, 11];
		    }
		}
		
		show_debug_message($"Огневая мощь для бомбардировки: {cas_power}");
		
		// [FIX] Во всех отказах одинаково закрываем интерфейс
		if (target.type == 5)
		{
		    instance_deactivate_object(button_large_q_no);
		    instance_deactivate_object(button_large_q_ok);
		    instance_deactivate_object(button_large_q_yes);
		    instance_deactivate_object(text_obj_red);
		
		    var mes = instance_create(x, y, ask_message);
		    mes.event = 30;
		
		    instance_deactivate_object(self);
		    exit;
		}
		
		if (cas_power < global.bombing_power_to_get_one_kill_chance)
		{
		    instance_deactivate_object(button_large_q_no);
		    instance_deactivate_object(button_large_q_ok);
		    instance_deactivate_object(button_large_q_yes);
		    instance_deactivate_object(text_obj_red);
		
		    var mes = instance_create(x, y, ask_message);
		    mes.event = 21;
		
		    instance_deactivate_object(self);
		    exit;
		}
		
		// Списываем весь пригодный для штурмовки БК
		for (var i = 1; i <= global.planes[0, 0]; i++)
		{
		    if (global.planes[i, 14] != indx) continue;
		
		    if (global.planes[i, 6] > 0 && global.airweapon[global.planes[i, 6], 6] && global.planes[i, 7] > 0)
		    {
		        global.planes[i, 7] = 0;
		    }
		
		    if (global.planes[i, 8] > 0 && global.airweapon[global.planes[i, 8], 6] && global.planes[i, 9] > 0)
		    {
		        global.planes[i, 9] = 0;
		    }
		
		    if (global.planes[i, 10] > 0 && global.airweapon[global.planes[i, 10], 6] && global.planes[i, 11] > 0)
		    {
		        global.planes[i, 11] = 0;
		    }
		}
		
		// [FIX] Берём squad_index прямо у цели
		var squad_index = 0;
		var count = 0;
		
		if (variable_instance_exists(target, "squad_index"))
		{
		    squad_index = target.squad_index;
		}
		
		show_debug_message($"Индекс отряда: {squad_index}");
		
		// [FIX] Если индекс невалиден — просто выходим с сообщением
		if (squad_index <= 0)
		{
		    instance_deactivate_object(button_large_q_no);
		    instance_deactivate_object(button_large_q_ok);
		    instance_deactivate_object(button_large_q_yes);
		    instance_deactivate_object(text_obj_red);
		
		    var mes = instance_create(x, y, ask_message);
		    mes.event = 16; // или отдельный event "не найден отряд цели"
		
		    instance_deactivate_object(self);
		    exit;
		}
		
		// Наносим потери
		for (var i = 1; i <= global.eggteam[0, 0]; i++)
		{
		    if (global.eggteam[i, 0] != squad_index) continue;
		    if (global.eggteam[i, 1] < 1) continue;
		    if (cas_power < global.bombing_power_to_get_one_kill_chance) break;
		
		    // [FIX] Сохраняем исходное число бойцов, не ломая цикл уменьшением массива
		    var unit_count = global.eggteam[i, 1];
			
			if (target.type == 3)
			{
				cas_power -= global.bombing_power_to_get_one_kill_chance * global.eggteam[i, 1];
				count += global.eggteam[i, 1];
				global.eggteam[i, 1] = 0;
				global.xmas_score -= global.xmas_score_for_success * 10; // обнуление награды за победу в терроре
				new_mail(40);
			}
			else
			{
				for (var t = 1; t <= unit_count; t++)
				{
				    if (global.eggteam[i, 1] < 1) break;
				    if (cas_power < global.bombing_power_to_get_one_kill_chance) break;
				
				    cas_power -= global.bombing_power_to_get_one_kill_chance;
				
				    var rand = irandom_range(0, 100);
				    if (rand < global.bombing_power_kill_chance)
				    {
				        global.eggteam[i, 1]--;
				        count++;
				        show_debug_message($"Робот {i} ({global.eggteam[i, 2]}) был уничтожен");
				    }
				    else
				    {
				        // Здесь можно потом добавить ранение
				        // show_debug_message($"Робот {i} ({global.eggteam[i, 2]}) пережил удар");
				    }
				}
			}
		}
		
		// Завершение
		instance_deactivate_object(button_large_q_no);
		instance_deactivate_object(button_large_q_ok);
		instance_deactivate_object(button_large_q_yes);
		instance_deactivate_object(text_obj_red);
		
		var mes = instance_create(x, y, ask_message);
		mes.event = 22;
		mes.txt = global.txt294 + string(count);
		
		instance_deactivate_object(self);
		
		for (var i = 0; i < instance_number(onmap_escort); i++)
		{
			if (instance_find(onmap_escort, i).indx != indx) continue;
			var obj = instance_find(onmap_escort, i);
			obj.status = 3;
			break;
		}
		instance_destroy(self);
		if (but1 != noone) instance_activate_object(but1);
		if (but2 != noone) instance_activate_object(but2);
		if (but3 != noone) instance_activate_object(but3);
		if (but4 != noone) instance_activate_object(but4);
	}
}
	

if (type == 6)
{
	text.txt = global.txt231 + string(indx);
	
	but1.text.txt = global.txt232; // ручной бой
	but2.txt = global.txt220; // на базу
	but3.text.txt = global.txt250; // автобой
	
	if (!instance_exists(target) && instance_exists(owner)) { instance_destroy(self); owner.status = 3; exit; }
	
	if (but1.yes)
	{
		var obj = noone;
		for (var i = 0; i < instance_number(onmap_escort); i++)
		{
			if (instance_find(onmap_escort, i).indx != indx) continue;
			obj = instance_find(onmap_escort, i);
			break;
		}
		if (instance_exists(obj) && instance_exists(target))
		add_fight_to_sequence(obj.indx, obj.own_id, target.escort_index, target.own_id, target.santa_escort_index, 0, 3, target.own_id);
		else show_debug_message("Попытка начать бой провалилась: не существует одного из объектов!");
		
		if (but1 != noone) instance_activate_object(but1);
		if (but2 != noone) instance_activate_object(but2);
		if (but3 != noone) instance_activate_object(but3);
		if (but4 != noone) instance_activate_object(but4);
		instance_destroy(self);
	}
	else
	if (but2.no) 
	{ 
		for (var i = 0; i < instance_number(onmap_escort); i++)
		{
			if (instance_find(onmap_escort, i).indx != indx) continue;
			var obj = instance_find(onmap_escort, i);
			obj.status = 3;
			break;
		}
		
		if (but1 != noone) instance_activate_object(but1);
		if (but2 != noone) instance_activate_object(but2);
		if (but3 != noone) instance_activate_object(but3);
		if (but4 != noone) instance_activate_object(but4);
		instance_destroy(self);
	}
	else
	if (but3.ok) 
	{
		var obj = noone;
		for (var i = 0; i < instance_number(onmap_escort); i++)
		{
			if (instance_find(onmap_escort, i).indx != indx) continue;
			obj = instance_find(onmap_escort, i);
			break;
		}
		if (instance_exists(obj) && instance_exists(target))
		add_fight_to_sequence(obj.indx, obj.own_id, target.escort_index, target.own_id, target.santa_escort_index, 0, 4, target.own_id);
		else show_debug_message("Попытка начать бой провалилась: не существует одного из объектов!");
		
		if (but1 != noone) instance_activate_object(but1);
		if (but2 != noone) instance_activate_object(but2);
		if (but3 != noone) instance_activate_object(but3);
		if (but4 != noone) instance_activate_object(but4);
		instance_destroy(self);
	}
}



}

