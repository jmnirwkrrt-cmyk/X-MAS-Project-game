function new_tech_available_popup(){
	time_m.menu_messages[0,0]++;
	time_m.menu_messages[time_m.menu_messages[0,0],0] = global.map_messages_text_3;
	time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
	time_m.new_messages = true;
}
function new_assembly_available_popup(){
	time_m.menu_messages[0,0]++;
	time_m.menu_messages[time_m.menu_messages[0,0],0] = global.map_messages_text_4;
	time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
	time_m.new_messages = true;
}

function research(){
	
	//for (var i = 1; i <= global.atstockpile[0, 0]; i++)
	//{
	//	if (global.atstockpile[i, 1] < 1) continue;
	//	if (global.atstockpile[i, 0] == 18) global.technologies[4, 2] = true; // труп мотожука
	//	if (global.atstockpile[i, 0] == 19) global.technologies[5, 2] = true; // труп метала
	//	if (global.atstockpile[i, 0] == 20) global.technologies[6, 2] = true; // труп пешки
	//	if (global.atstockpile[i, 0] == 21) global.technologies[7, 2] = true; // труп нло
	//	if (global.atstockpile[i, 0] == 25) global.technologies[8, 2] = true; // суперсплав
	//	if (global.atstockpile[i, 0] == 22) global.technologies[11, 2] = true; // излучатель
	//	if (global.atstockpile[i, 0] == 23) global.technologies[15, 2] = true; // турель
	//}
	
	
	
	for (var i = 1; i <= global.technologies[0, 0]; i++)
	{
		if (global.technologies[i, 4] == 0) continue;
		global.technologies[i, 3] -= global.timespeed * global.technologies[i, 4] * global.scientistpower;
		if (global.technologies[i, 3] < 0) 
		{
			global.technologies[i, 3] = 0;
			global.scientist += global.technologies[i, 4];
			global.technologies[i, 4] = 0;
			global.technologies[i, 1] =  true;
			if (global.technologies[i, 5] > 0)
			{
				global.wiki[global.technologies[i, 5], 2] = true;
			}
			if (!instance_exists(ask_parent))
			{
				var mess = instance_create(1200 / 2, 900 / 2, ask_question);
				mess.event = 3;
				mess.tech_index = i;
				global.timespeed = 0;
			}
			else
			{
				time_m.menu_messages[0,0]++;
				time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt342 + global.technologies[i, 0];
				time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
				time_m.new_messages = true;
			}
			if (i == 22) global.can_search_emeralds = true;
			if (i == 20) global.can_decrypt_transmission = true;
			if (i == 21) { global.radar_chance *= 1.5; global.samchance *= 1.2; }
			global.xmas_score += global.xmas_score_for_research;
		}
	}
	
	var have_new_tech = false;
	var old_tech_aviability_massive = array_create(0);
	for (var i = 1; i <= global.technologies[0, 0]; i++) array_push(old_tech_aviability_massive, global.technologies[i, 2]);
	
	if (global.technologies[8, 1] && global.technologies[1, 1]) global.technologies[2, 2] = true;
	if (global.technologies[2, 1] && global.technologies[11, 1] && global.technologies[25, 1]) global.technologies[3, 2] = true;
	if (global.technologies[25, 1] && global.technologies[8, 1])  { global.technologies[12, 2] = true; global.technologies[13, 2] = true; } // разблокировка ручного лазера и лавины 
	if (global.technologies[8, 1]) global.technologies[9, 2] = true;
	if (global.technologies[8, 1] && global.technologies[9, 1]) global.technologies[10, 2] = true;
	if (global.technologies[5, 1]) global.technologies[8, 2] = true;
	if (global.technologies[13, 1]) global.technologies[14, 2] = true;
	if (global.technologies[8, 1]) { global.technologies[18, 2] = true; }
	if (global.technologies[8, 1] && global.technologies[23, 1]) { global.technologies[19, 2] = true; }
	
	if (time_m.metalson > 0) global.technologies[5, 2] = true;
		else if (!global.technologies[5, 1]) global.technologies[5, 2] = false;
	if (time_m.motobug > 0) global.technologies[4, 2] = true;
		else if (!global.technologies[4, 1]) global.technologies[4, 2] = false;
	if (time_m.pawn > 0) global.technologies[6, 2] = true;
		else if (!global.technologies[6, 1]) global.technologies[6, 2] = false;
	if (time_m.cyberdisc > 0) global.technologies[7, 2] = true;
		else if (!global.technologies[7, 1]) global.technologies[7, 2] = false;
	if (time_m.turret > 0) global.technologies[15, 2] = true;
		else if (!global.technologies[15, 1]) global.technologies[15, 2] = false;
	if (time_m.energyscrap > 0) global.technologies[11, 2] = true;
		else if (!global.technologies[11, 1]) global.technologies[11, 2] = false;
	if (global.technologies[11, 1] && global.technologies[8, 1]) global.technologies[25, 2] = true;
	
	if (global.technologies[4, 1] && global.technologies[5, 1] && global.technologies[6, 1]) global.technologies[23, 2] = true;
	if (global.technologies[24, 1]) { global.buildings[10, 1] = true; global.wiki[34, 2] = true; }
	
	if (global.total_emerald_counts - global.passed_emeralds_counts >= 3
	&& !global.technologies[24, 2] 
	&& global.technologies[22, 1]
	&& global.technologies[20, 1]
	&& global.technologies[23, 1]
	)
	{
		var is_no_emeralds_at_this_moment = true;	
		for (var i = 0; i < instance_number(onmap_enemysite); i++)
		{
			var emerald_site = instance_find(onmap_enemysite, i);
			if (emerald_site.type != 5) continue;
			is_no_emeralds_at_this_moment = false;
			break;
		}
		if (is_no_emeralds_at_this_moment)
		{
			global.technologies[24, 2] = true;
			show_debug_message("Разблокировано окончательное решение вопроса!");
		}
	}
	
	for (var i = 1; i <= global.technologies[0, 0]; i++)
	{
	    var old_available = old_tech_aviability_massive[i - 1];
	    var new_available = global.technologies[i, 2];
	
	    if (!old_available && new_available && !global.technologies[i, 1])
	    {
	        have_new_tech = true;
	        show_debug_message($"Новая технология: {i}");
	        break;
	    }
	}
	if (have_new_tech) new_tech_available_popup();

	
	if (global.technologies[11, 1] && !global.constructitem[2, 9])  { global.constructitem[2, 9] = true;  new_assembly_available_popup(); }
	if (global.technologies[12, 1] && !global.constructitem[1, 9])  { global.constructitem[1, 9] = true;  new_assembly_available_popup(); }
	if (global.technologies[13, 1] && !global.constructitem[3, 9])  { global.constructitem[3, 9] = true;  new_assembly_available_popup(); }
	if (global.technologies[1, 1] && !global.constructitem[5, 9])   { global.constructitem[5, 9] = true;  new_assembly_available_popup(); }
	if (global.technologies[2, 1] && !global.constructitem[6, 9])   { global.constructitem[6, 9] = true;  new_assembly_available_popup(); }
	if (global.technologies[3, 1] && !global.constructitem[7, 9])   { global.constructitem[7, 9] = true;  new_assembly_available_popup(); }
	if (global.technologies[14, 1] && !global.constructitem[8, 9])  { global.constructitem[8, 9] = true;  new_assembly_available_popup(); }
	if (global.technologies[9, 1] && !global.constructitem[9, 9])   { global.constructitem[9, 9] = true;  new_assembly_available_popup(); }
	if (global.technologies[10, 1] && !global.constructitem[10, 9]) { global.constructitem[10, 9] = true; new_assembly_available_popup(); }
	if (global.technologies[16, 1] && !global.constructitem[11, 9]) { global.constructitem[11, 9] = true; new_assembly_available_popup(); }
	if (global.technologies[6, 1] && global.technologies[8, 1] && !global.constructitem[4, 9]) { global.constructitem[4, 9] = true; new_assembly_available_popup(); }
	if (global.technologies[18, 1] && !global.constructitem[12, 9]) { global.constructitem[12, 9] = true; new_assembly_available_popup(); }
	if (global.technologies[19, 1] && !global.constructitem[13, 9]) { global.constructitem[13, 9] = true; new_assembly_available_popup(); }
	if (global.technologies[15, 1] && global.technologies[8, 1] && global.technologies[25, 1] && !global.constructitem[14, 9]) { global.constructitem[14, 9] = true; new_assembly_available_popup(); }
	
	
	
	if (global.technologies[22, 1]) global.can_search_emeralds = true;
}