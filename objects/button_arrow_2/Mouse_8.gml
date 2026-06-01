sound_volume(button_sound, global.soundvolume);
sound_play(button_sound);
image_index = 0;

var is_minus = (image_xscale == 1);
var is_plus  = (image_xscale == -1);

// Исследования
if (tech_index > -1 && background_map.type == 0)
{
	if (is_minus)
	{
		if (global.technologies[tech_index, 4] > 9)
		{
			global.technologies[tech_index, 4] -= 10;
			global.scientist += 10;
			global.laboratoryplace += 10;
		}
		else
		{
			global.scientist += global.technologies[tech_index, 4];
			global.laboratoryplace += global.technologies[tech_index, 4];
			global.technologies[tech_index, 4] = 0;
		}
	}
	else if (is_plus)
	{
		var add_scientists = min(10, min(global.scientist, global.laboratoryplace));
		if (add_scientists > 0)
		{
			global.technologies[tech_index, 4] += add_scientists;
			global.scientist -= add_scientists;
			global.laboratoryplace -= add_scientists;
		}
	}
}

// Производство
if (buy_index > -1 && background_map.type == 4)
{
	// Назначение инженеров
	if (tech_index < 0)
	{
		if (is_minus)
		{
			if (global.constructitem[buy_index, 8] > 9)
			{
				global.constructitem[buy_index, 8] -= 10;
				global.engineers += 10;
				global.workshopplace += 10;
			}
			else
			{
				global.engineers += global.constructitem[buy_index, 8];
				global.workshopplace += global.constructitem[buy_index, 8];
				global.constructitem[buy_index, 8] = 0;
			}
		}
		else if (is_plus)
		{
			var add_engineers = min(10, min(global.engineers, global.workshopplace));
			if (add_engineers > 0)
			{
				global.constructitem[buy_index, 8] += add_engineers;
				global.engineers -= add_engineers;
				global.workshopplace -= add_engineers;
			}
		}
	}
	// Количество предметов в очереди
	else
	{
		if (is_minus)
		{
			global.constructitem[buy_index, 1] -= 10;
			if (global.constructitem[buy_index, 1] < 0) global.constructitem[buy_index, 1] = 0;
		}
		else if (is_plus)
		{
			global.constructitem[buy_index, 1] += 10;
		}
	}
}

// Покупка
if (buy_index > -1 && background_map.type == 1)
{
	if (is_minus)
	{
		global.buyable[buy_index, 1] -= 10;
		if (global.buyable[buy_index, 1] < 0) global.buyable[buy_index, 1] = 0;
	}
	else if (is_plus)
	{
		global.buyable[buy_index, 1] += 10;
	}
}

// Выкладка предметов
if (buy_index > -1 && background_map.type == 3)
{
	if (is_minus)
	{
		global.atstockpile[buy_index, 2] -= 10;
		if (global.atstockpile[buy_index, 2] < 0) global.atstockpile[buy_index, 2] = 0;
	}
	else if (is_plus)
	{
		global.atstockpile[buy_index, 2] += 10;
		if (global.atstockpile[buy_index, 2] > global.atstockpile[buy_index, 1])
		{
			global.atstockpile[buy_index, 2] = global.atstockpile[buy_index, 1];
		}
	}
}

// Учёные
if (buy_index == -2 && background_map.type == 3)
{
	if (is_minus)
	{
		background_map.amounts -= 10;
		if (background_map.amounts < 0) background_map.amounts = 0;
	}
	else if (is_plus)
	{
		background_map.amounts += min(10, global.scientist - background_map.amounts);
		if (background_map.amounts < 0) background_map.amounts = 0;
	}
}

// Инженеры
if (buy_index == -3 && background_map.type == 3)
{
	if (is_minus)
	{
		background_map.amounte -= 10;
		if (background_map.amounte < 0) background_map.amounte = 0;
	}
	else if (is_plus)
	{
		background_map.amounte += min(10, global.engineers - background_map.amounte);
		if (background_map.amounte < 0) background_map.amounte = 0;
	}
}