function current_stock(){

	var i;
	for (i = 0; i < 37; i++)
	{
		if (global.basebuilding[i, 1] > 0) global.basebuilding[i, 1] -= global.timespeed;
		if (global.basebuilding[i, 1] < 0) global.basebuilding[i, 1] = 0;
	}
	for (i = 1; i <= global.itemsonway[0, 0]; i++)
	{
		if (global.itemsonway[i, 0] = 7) global.currentciv+=global.itemsonway[i, 1];
		if (global.itemsonway[i, 0] = 2) global.maxplanes-=global.itemsonway[i, 1];
	}
	
	for (i = 0; i < 37; i++)
	{
		if (global.basebuilding[i, 0] = "barracks" and global.basebuilding[i, 1] = 0) global.maxciv += global.onebarrack;
		if (global.basebuilding[i, 0] = "stockpile" and global.basebuilding[i, 1] = 0) global.stock += global.onestock;
		if (global.basebuilding[i, 0] = "radar" and global.basebuilding[i, 1] = 0) global.radarrange += global.oneradar;
		if (global.basebuilding[i, 0] = "hangar" and global.basebuilding[i, 1] = 0) global.maxplanes += 2;
		if (global.basebuilding[i, 0] = "factory" and global.basebuilding[i, 1] = 0) global.workshopplace += global.workshopone;
		if (global.basebuilding[i, 0] = "laboratory" and global.basebuilding[i, 1] = 0) global.laboratoryplace += global.laboratoryone;
	}
	
	for (i = 1; i <= global.team[0, 0]; i++)
	{
		if (global.team[i, 4] < 1) continue;
		global.currentciv++;
	}
	
	for (i = 1; i <= global.atstockpile[0, 0]; i++)
	{
		if (global.atstockpile[i, 1] < 1) continue;
		global.stock -= global.items[global.atstockpile[i, 0], 2] * global.atstockpile[i, 1];
	}
	
	for (i = 1; i <= global.planes[0, 0]; i++)
	{
		if (global.planes[i, 2] > 0) global.maxplanes--;
	}
	
	for (i = 1; i <= global.constructitem[0, 0]; i++)
	{
		global.workshopplace -= global.constructitem[i, 8];
	}
	for (i = 1; i <= global.technologies[0, 0]; i++)
	{
		global.laboratoryplace -= global.technologies[i, 4];
	}
	
	for (i = 1; i <= global.itemsonway[0, 0]; i++)
	{
		if (global.itemsonway[i, 1] = 0) continue;
		//
		if (global.itemsonway[i, 2] < 1)
		{
			if (global.items[global.itemsonway[i, 0], 0] = global.txt55)
			{
				global.scientist += global.itemsonway[i, 1];
				global.itemsonway[i, 1] = 0;
				continue;
			}
			if (global.items[global.itemsonway[i, 0], 0] = global.txt56)
			{
				global.engineers += global.itemsonway[i, 1];
				global.itemsonway[i, 1] = 0;
				continue;
			}
			if (global.items[global.itemsonway[i, 0], 0] = global.txt54)
			{
				while (global.itemsonway[i, 1] > 0)
				{
					global.team[0, 0]++;
					global.team[global.team[0, 0], 0] = 0;
					var name = global.name[irandom_range(1, global.name[0, 0]), 1];
					name = string_insert(global.name[irandom_range(1, global.name[0, 0]), 0], name, 0);
					global.team[global.team[0, 0], 1] = name;
					global.team[global.team[0, 0], 2] = "snowman";
					global.team[global.team[0, 0], 3] = "";
					global.team[global.team[0, 0], 4] = global.snowmanmaxhp;
					global.team[global.team[0, 0], 5] = global.snowmanmaxhp;
					global.team[global.team[0, 0], 6] = 0;
					global.team[global.team[0, 0], 7] = false;
					global.itemsonway[i, 1]--;
				}
				continue;
			}
			if (global.items[global.itemsonway[i, 0], 2] = -2)
			{
				while (global.itemsonway[i, 1] > 0)
				{
					var i1;
					for (i1 = 1; i1 <= global.planedata[0, 0]; i1++)
					{
						if (global.itemsonway[i, 0] = global.planedata[i1, 16])
						{
							var i2;
							var t = global.planes[0, 0] + 1;
							global.planes[t, 0] = i1; // индекс в planedata
							global.planes[t, 1] = global.planedata[global.planes[t, 0], 5]; // топливо
							global.planes[t, 2] = global.planedata[global.planes[t, 0], 1]; // хп
							global.planes[t, 3] = 0; // скорость
							global.planes[t, 4] = global.planedata[global.planes[t, 0], 12]; // место для десанта
							global.planes[t, 5] = global.planedata[global.planes[t, 0], 13]; // место для груза
							global.planes[t, 6] = global.planedata[global.planes[t, 0], 2]; // оружие 1
							global.planes[t, 7] = 0; // БК оружия 1
							global.planes[t, 8] = global.planedata[global.planes[t, 0], 3]; // оружие 2
							global.planes[t, 9] = 0; // БК оружия 2
							global.planes[t, 10] = global.planedata[global.planes[t, 0], 4]; // оружие 3
							global.planes[t, 11] = 0; // БК оружия 3
							global.planes[t, 12] = 0; // Статус (0 - готов, 1 - ремонт, 2 - перезарядка, 3 - дозаправка)
							global.planes[t, 13] = 0; // Текущее время обслуживания
							global.planes[t, 14] = 0; // номер эскадрильи, 0 = на базе
							global.planes[t, 15] = global.planedata[global.planes[t, 0], 0]; // название
							global.planes[t, 16] = 0; // гранат на борту
							global.planes[t, 17] = 0; // аптечек на борту
							global.planes[0, 0]++;
						}
					}
					global.itemsonway[i, 1]--;
				}
				continue;
			}
		}
		//
		if (global.items[global.itemsonway[i, 0], 2] > 0) global.stock -= global.items[global.itemsonway[i, 0], 2] * global.itemsonway[i, 1];
		else if (global.items[global.itemsonway[i, 0], 2] = -1) global.currentciv += global.itemsonway[i, 1];
		else if (global.items[global.itemsonway[i, 0], 2] = -2) global.maxplanes -= global.itemsonway[i, 1];
		global.itemsonway[i, 2] -= global.timespeed;
			if (global.itemsonway[i, 2] < 1 and global.items[global.itemsonway[i, 0], 2] > 0)
			{
				var d = 0
				var i1;
				for (i1 = 1; i1 <= global.atstockpile[0, 0]; i1++)
				{
				if (global.itemsonway[i, 0] = global.atstockpile[i1, 0]) d = i1;
				}
				if (d = 0)
				{
					global.atstockpile[global.atstockpile[0, 0] + 1, 0] = global.itemsonway[i, 0];
					global.atstockpile[global.atstockpile[0, 0] + 1, 1] = global.itemsonway[i, 1];
					global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0;
					global.atstockpile[0, 0]++;
				}
				else global.atstockpile[d, 1] += global.itemsonway[i, 1]
				global.itemsonway[i, 1] = 0;
				if (!instance_exists(ask_message))
				{
					var mess = instance_create(1200 / 2, 900 / 2, ask_message);
					mess.event = 9;
					mess.item_index = global.itemsonway[i, 0];
				}
				else
				{
					time_m.menu_messages[0,0]++;
					time_m.menu_messages[time_m.menu_messages[0,0],0] = string_insert(global.items[global.itemsonway[i, 0], 0], global.txt88, 0);
					time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
					time_m.new_messages = true;
				}
			}
	}
	for (i = 1; i <= global.technologies[0, 0]; i++)
	{
		global.currentciv += global.technologies[i, 4];
	}
	for (i = 1; i <= global.constructitem[0, 0]; i++)
	{
		global.currentciv += global.constructitem[i, 8];
	}
	global.currentciv += global.scientist;
	global.currentciv += global.engineers;
	
	for (i = 1; i <= global.atstockpile[0, 0]; i++)
	{
		if (global.atstockpile[i, 1] < 1) continue;
		if (global.atstockpile[i, 0] == 25) time_m.splav += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 17) time_m.energo += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 22) time_m.energyscrap += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 18) time_m.motobug += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 19) time_m.metalson += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 20) time_m.pawn += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 21) time_m.cyberdisc += global.atstockpile[i, 1];
		if (global.atstockpile[i, 0] == 23) time_m.turret += global.atstockpile[i, 1];
	}

}