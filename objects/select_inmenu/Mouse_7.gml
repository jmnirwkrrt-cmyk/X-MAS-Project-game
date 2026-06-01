if (sprite_index != select_inmenu_black_S)
{
	if (global.planes[indx, 12] < 1)
	{
		if (global.planes[indx, 14] > 0) // номер эскадрильи
		{
			if (global.planes[indx, 12] == 0) // статус
			{
				global.planes[indx, 12] = -1;
				for (i = 1; i <= global.planes[0, 0]; i++)
				{
					if (global.planes[i, 14] != global.planes[indx, 14]) continue;
					global.planes[i, 12] = -1;
				}
			}
			else
			{
				for (i = 1; i <= global.planes[0, 0]; i++)
				{
					global.planes[indx, 12] = 0;
					if (global.planes[i, 14] != global.planes[indx, 14]) continue;
					global.planes[i, 12] = 0;
				}
			}
		}
		else
		{
			if (global.planes[indx, 12] == 0) global.planes[indx, 12] = -1;
			else global.planes[indx, 12] = 0;
		}
	}
	
}
else visible = true;

