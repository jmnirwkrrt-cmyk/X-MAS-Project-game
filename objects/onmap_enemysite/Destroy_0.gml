show_debug_message("Террор удалился!");
if (instance_exists(text)) instance_destroy(text);
if (is_destroyed) global.xmas_score += global.xmas_score_for_success * 10;
if (type == 6)
{
	if (instance_exists(onmap_escort))
	{
		if (time > 1)
		{
			var random_chance = choose(false, true, false);
			if (random_chance)
			{
				global.technologies[20, 2] = true;
				new_tech_available_popup();
				new_mail(28);
				if (!global.technologies[11, 2]) new_tech_available_popup();
				global.technologies[11, 2] = true;
				
				var emitters_index = 0;
				var em_count = choose(1, 2);
				for (var i = 1; i <= global.atstockpile[0, 0]; i++)
				{
					if (global.atstockpile[i, 0] == 22)
					{
						emitters_index = i;
						break;
					}
				}
				
				if (emitters_index > 0)
				{
					global.atstockpile[emitters_index, 1] += em_count;
				}
				else
				{
					global.atstockpile[0, 0]++;
					global.atstockpile[global.atstockpile[0, 0], 0] = 22;
					global.atstockpile[global.atstockpile[0, 0], 1] = em_count;
					global.atstockpile[global.atstockpile[0, 0], 2] = 0;
				}
				
				var alloy_index = 0;
				var alloy_count = choose(2, 10);
				for (var i = 1; i <= global.atstockpile[0, 0]; i++)
				{
					if (global.atstockpile[i, 0] == 25)
					{
						alloy_index = i;
						break;
					}
				}
				
				if (alloy_index > 0)
				{
					global.atstockpile[alloy_index, 1] += alloy_count;
				}
				else
				{
					global.atstockpile[0, 0]++;
					global.atstockpile[global.atstockpile[0, 0], 0] = 25;
					global.atstockpile[global.atstockpile[0, 0], 1] = alloy_count;
					global.atstockpile[global.atstockpile[0, 0], 2] = 0;
				}
			}
		}
	}
}
if (type == 5)
{
		
}