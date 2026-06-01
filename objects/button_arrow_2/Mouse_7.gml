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
		if (global.technologies[tech_index, 4] > 0)
		{
			global.technologies[tech_index, 4]--;
			global.scientist++;
			global.laboratoryplace++;
		}
	}
	else if (is_plus)
	{
		if (global.scientist > 0 && global.laboratoryplace > 0)
		{
			global.technologies[tech_index, 4]++;
			global.scientist--;
			global.laboratoryplace--;
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
			if (global.constructitem[buy_index, 8] > 0)
			{
				global.constructitem[buy_index, 8]--;
				global.engineers++;
				global.workshopplace++;
			}
		}
		else if (is_plus)
		{
			if (global.engineers > 0 && global.workshopplace > 0)
			{
				global.constructitem[buy_index, 8]++;
				global.engineers--;
				global.workshopplace--;
			}
		}
	}
	// Количество предметов в очереди
	else
	{
		if (is_minus)
		{
			if (global.constructitem[buy_index, 1] > 0)
			{
				global.constructitem[buy_index, 1]--;
			}
		}
		else if (is_plus)
		{
			global.constructitem[buy_index, 1]++;
		}
	}
}

// Покупка
if (buy_index > -1 && background_map.type == 1)
{
	if (is_minus)
	{
		global.buyable[buy_index, 1]--;
		if (global.buyable[buy_index, 1] < 0) global.buyable[buy_index, 1] = 0;
	}
	else if (is_plus)
	{
		global.buyable[buy_index, 1]++;
	}
}

// Выкладка предметов на миссию
if (buy_index > -1 && background_map.type == 3)
{
	if (is_minus && global.atstockpile[buy_index, 2] > 0)
	{
		global.atstockpile[buy_index, 2]--;
	}
	else if (is_plus && global.atstockpile[buy_index, 2] < global.atstockpile[buy_index, 1])
	{
		global.atstockpile[buy_index, 2]++;
	}
}

// Назначение учёных на миссию/операцию
if (buy_index == -2 && background_map.type == 3)
{
	if (is_minus && background_map.amounts > 0)
	{
		background_map.amounts--;
	}
	else if (is_plus && background_map.amounts < global.scientist)
	{
		background_map.amounts++;
	}
}

// Назначение инженеров на миссию/операцию
if (buy_index == -3 && background_map.type == 3)
{
	if (is_minus && background_map.amounte > 0)
	{
		background_map.amounte--;
	}
	else if (is_plus && background_map.amounte < global.engineers)
	{
		background_map.amounte++;
	}
}