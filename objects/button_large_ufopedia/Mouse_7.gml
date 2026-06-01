if (!instance_exists(ask_build) and !instance_exists(ask_parent))
{

	button_sound_effect();
	image_index = 0;
	
	global.timespeed = 0;
	
	if (type == 0) // портал в сантапедию
	{
		instance_create(1200 / 2 - 100, 900 / 2, ask_ufopedia);
	}

}

if (!instance_exists(ask_build))
{
	if (type == 1) // снаряга
	{
		instance_destroy(ask_ufopedia);
		back = instance_create(0, 0, background_map);
		back.type = 101;
		for (var i = 1; i < global.wiki[0,0]; i++)
		{
			if (!global.wiki[i, 2]) continue;
			if (global.wiki[i, 0] == global.wikit1)
			{
				background_map.wikipage = i; 
				break;	
			}
		}
	}
	if (type == 2) // солдаты
	{
		instance_destroy(ask_ufopedia);
		back = instance_create(0, 0, background_map);
		back.type = 101;
		for (var i = 1; i < global.wiki[0,0]; i++)
		{
			if (!global.wiki[i, 2]) continue;
			if (global.wiki[i, 0] == global.wikit75)
			{
				background_map.wikipage = i; 
				break;	
			}
		}
	}
	if (type == 3) // постройки
	{
		instance_destroy(ask_ufopedia);
		back = instance_create(0, 0, background_map);
		back.type = 101;
		for (var i = 1; i < global.wiki[0,0]; i++)
		{
			if (!global.wiki[i, 2]) continue;
			if (global.wiki[i, 0] == global.wikit25)
			{
				background_map.wikipage = i; 
				break;	
			}
		}
	}
	if (type == 4) // авиаоружие
	{
		instance_destroy(ask_ufopedia);
		back = instance_create(0, 0, background_map);
		back.type = 101;
		for (var i = 1; i < global.wiki[0,0]; i++)
		{
			if (!global.wiki[i, 2]) continue;
			if (global.wiki[i, 0] == global.wikit7)
			{
				background_map.wikipage = i; 
				break;	
			}
		}	
	}
	if (type == 5) // авиация
	{
		instance_destroy(ask_ufopedia);
		back = instance_create(0, 0, background_map);
		back.type = 101;
		for (var i = 1; i < global.wiki[0,0]; i++)
		{
			if (!global.wiki[i, 2]) continue;
			if (global.wiki[i, 0] == global.wikit43)
			{
				background_map.wikipage = i; 
				break;	
			}
		}		
	}
	if (type == 6) // технологии роботов
	{
		instance_destroy(ask_ufopedia);
		back = instance_create(0, 0, background_map);
		back.type = 101;
		for (var i = 1; i < global.wiki[0,0]; i++)
		{
			if (!global.wiki[i, 2]) continue;
			if (global.wiki[i, 0] == global.wikit99)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit101)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit107)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit119)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit121)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit123)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit117)
			{
				background_map.wikipage = i; 
				break;	
			}
		}	
	}
	if (type == 7) // роботы
	{
		instance_destroy(ask_ufopedia);
		back = instance_create(0, 0, background_map);
		back.type = 101;
		for (var i = 1; i < global.wiki[0,0]; i++)
		{
			if (!global.wiki[i, 2]) continue;
			if (global.wiki[i, 0] == global.wikit91)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit103)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit93)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit95)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit97)
			{
				background_map.wikipage = i; 
				break;	
			}
		}	
	}
	if (type == 8) // авиация роботов
	{
		instance_destroy(ask_ufopedia);
		back = instance_create(0, 0, background_map);
		back.type = 101;
		for (var i = 1; i < global.wiki[0, 0]; i++)
		{
			if (!global.wiki[i, 2]) continue;
			if (global.wiki[i, 0] == global.wikit61)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit63)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit65)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit67)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit69)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit71)
			{
				background_map.wikipage = i; 
				break;	
			}
			if (global.wiki[i, 0] == global.wikit73)
			{
				background_map.wikipage = i; 
				break;	
			}
		}	
	}	
	if (type == 9) // учебные материалы
	{
		instance_destroy(ask_ufopedia);
		back = instance_create(0, 0, background_map);
		back.type = 101;
		for (var i = 1; i <= global.wiki[0,0]; i++)
		{
			if (!global.wiki[i, 2]) continue;
			if (global.wiki[i, 0] == global.wikit141)
			{
				background_map.wikipage = i; 
				break;	
			}
		}	
	}
	
}

