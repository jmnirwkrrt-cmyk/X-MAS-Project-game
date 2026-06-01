//indx_plane = 0;
//indx_type = 0;

sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
image_index = 0;

if (image_xscale = 1 and background_map.wikipage > 1)
{ 
	background_map.wikipage--; 
	while(!global.wiki[background_map.wikipage, 2]) 
	{ 
		if ( background_map.wikipage == 1)
		{ 
			background_map.wikipage = 1; 
		} 
		background_map.wikipage--; 
	}
}
else
if (image_xscale = 1 and background_map.wikipage <= 1) 
{ 
	background_map.wikipage = global.wiki[0, 0] - 1; 
	while(!global.wiki[background_map.wikipage, 2])
	{
		if ( background_map.wikipage == 1) 
		{
			background_map.wikipage = 1;
		}
		background_map.wikipage--;
	}
}
if (image_xscale = -1 and background_map.wikipage < global.wiki[0, 0] - 1) 
{ 
	background_map.wikipage++;
	while(!global.wiki[background_map.wikipage, 2]) 
	{
		if ( background_map.wikipage == global.wiki[0, 0]) 
		{
			background_map.wikipage = 1; 
		}
		background_map.wikipage++;
	}
}
else
if (image_xscale = -1 and background_map.wikipage >= global.wiki[0, 0] - 1) 
{ 
	background_map.wikipage = 1;
	while(!global.wiki[background_map.wikipage, 2]) 
	{ 
		if ( background_map.wikipage == global.wiki[0, 0]) 
		{
			background_map.wikipage = 1; 
		} 
		background_map.wikipage++;
	}
}


