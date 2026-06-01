if (sprite_index != select_inmenu_black_S)
{
	if (global.planes[indx, 12] == -1)  visible = true; 
	else visible = false;
	x = x_orig;
	y = y_orig;
	image_xscale = 1;
	
	for (i = 1; i <= global.planes[0, 0]; i++)
	{
		if (i == indx) continue;
		if (global.planes[indx, 12] == global.planes[i, 12] && global.planes[indx, 14] != global.planes[i, 14])
		{
			global.planes[i, 12] = 0;
		}
		
	}
}
else 
{
	visible = true;
	image_xscale = 0.57;
}

if (instance_exists(ask_parent)) instance_destroy(self);
if (background_map.type == 7) instance_destroy(self);

