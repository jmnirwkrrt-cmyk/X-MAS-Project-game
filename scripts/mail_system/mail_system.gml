/// Выдает случайное письмо или не выдает
function try_random_mail()
{
	var new_mail_chance = 1; // шанс получения нового письма, от 0 до 100
	if (irandom_range(0, 100) < new_mail_chance)
	{
		var mail_selected = false;
		var max_tries = 500;
		var tries = 0;
		var mails_array = array_create(0);
		if (global.team[1, 4] > 0) array_push(mails_array, 1);
		array_push(mails_array, 5);
		if (global.team[2, 4] > 0) array_push(mails_array, 19);
		if (global.team[2, 4] > 0) array_push(mails_array, 24);
		if (global.team[2, 4] > 0) array_push(mails_array, 25);
		array_push(mails_array, 31);
		if (global.team[10, 4] > 0) array_push(mails_array, 32);
		if (global.team[9, 4] > 0) array_push(mails_array, 33);
		if (global.team[3, 4] > 0) array_push(mails_array, 34);
		array_push(mails_array, 35);
		array_push(mails_array, 36);
		array_push(mails_array, 37);
		array_push(mails_array, 38);
		array_push(mails_array, 39);
		if (global.team[8, 4] > global.team[8, 5] - 1) array_push(mails_array, 41);
		while (!mail_selected && tries < max_tries)
		{
			var s = irandom_range(0, array_length(mails_array) - 1);
			if (!global.mail[mails_array[s]].available)
			{
				mail_selected = true;
				if (mails_array[s] == 41)
				{
					global.team[8, 4] = 1;
					global.silver_apples = true;
				}
				if (mails_array[s] == 24)
				{
					var back = instance_create(0, 0, background_map);
					back.type = 17;
					global.timespeed = 0;
				}
				if (mails_array[s] == 25)
				{
					if (global.mail[24].available)
					{
						var back = instance_create(0, 0, background_map);
						back.type = 17;
						global.timespeed = 0;
					}
					else
					{
						mail_selected = false;
					}
				}
				
				if (mail_selected)
				{
					global.mail[mails_array[s]].available = true;
					if (instance_exists(time_m))
					{
						time_m.menu_messages[0,0]++;
						time_m.menu_messages[time_m.menu_messages[0,0],0] = global.map_messages_text_5;
						time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
						time_m.new_messages = true;
					}
				}
			}
			tries++;
		}
		
	}
}

/// Если письмо с указанным индексом не открыто открывает его и уведомляет об этом
function new_mail(mail_index)
{
	if (!global.mail[mail_index].available)
	{
		global.mail[mail_index].available = true;
		if (instance_exists(time_m))
		{
			time_m.menu_messages[0,0]++;
			time_m.menu_messages[time_m.menu_messages[0,0],0] = global.map_messages_text_5;
			time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
			time_m.new_messages = true;
		}
		if (mail_index == 24 || mail_index == 25)
		{
			var back = instance_create(0, 0, background_map);
			back.type = 17;
			global.timespeed = 0;
		}
	}
}