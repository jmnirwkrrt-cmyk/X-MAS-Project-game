if (!instance_exists(ask_build_onmap) and global.base_exists and !instance_exists(ask_parent))
{
	if (global.technologies[17, 1])
	{
		if (global.base_exists) global.isbuild = true;
		button_sound_effect();
		image_index = 0;
	}
	else
	{
		if (!instance_exists(ask_parent)) 
		{
			mess = instance_create(1200 / 2, 900 / 2, ask_message);
			mess.event = 27;	
		}
		button_sound_effect();
		image_index = 0;
	}
}
for (i = 1; i < global.planes[0, 0]; i++)
{
	if (global.planes[i, 14] == -2) global.planes[i, 14] = 0;
}

