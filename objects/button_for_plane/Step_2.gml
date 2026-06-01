image_xscale = 1 * (__view_get( e__VW.WView, 0 ) / 1500);
image_yscale = 1 * (__view_get( e__VW.WView, 0 ) / 1500);
if (index > 6) image_index = 24;

if (ready && z == 0 && instance_exists(current_plane))
{
	z = 1;
	if (index == 0) 
	{
		image_angle = -90;
	}
	if (index == 1) 
	{
		image_index = 2;
		image_angle = 0;
	}
	if (index == 2) 
	{
		image_angle = 90;
	}
	if (index == 3) 
	{
		image_angle = 0;
		image_index = 4;
	}
	if (index == 4) 
	{
		image_angle = 0;
		image_index = 6;
	}
	if (index == 5) 
	{
		if (current_plane.roll_cooldown < 1)
		{
			image_angle = 0;
			image_index = 8;
		}
		else
		{
			image_angle = 0;
			image_index = 24;
		}
	}
}
if (ready)
{
	if (index == 6) 
	{
		image_angle = 0;
		image_index = 10;
		if (plane_commander.pause) image_index = 11;
	}	
}
if (ready && instance_exists(current_plane))
{
	if (index == 7 && current_plane != 0) 
	{
		image_angle = 0;
		image_index = 24;
		if (current_plane.w_1 == 1) image_index = 13;
		if (current_plane.w_1 == 2) image_index = 15;
		if (current_plane.w_1 == 3) image_index = 17;
		if (current_plane.w_1 == 4) image_index = 19;
		if (current_plane.w_1 == 5) image_index = 21;
		if (current_plane.w_1 == 13) image_index = 13;
		if (current_plane.w_1 == 14) image_index = 29;
		if (!current_plane.w_1use && image_index != 24) image_index--;
	}
	if (index == 8 && current_plane != 0) 
	{
		image_angle = 0;
		image_index = 24;
		if (current_plane.w_2 == 1) image_index = 13;
		if (current_plane.w_2 == 2) image_index = 15;
		if (current_plane.w_2 == 3) image_index = 17;
		if (current_plane.w_2 == 4) image_index = 19;
		if (current_plane.w_2 == 5) image_index = 21;
		if (current_plane.w_2 == 13) image_index = 13;
		if (current_plane.w_2 == 14) image_index = 29;
		if (!current_plane.w_2use && image_index != 24) image_index--;
	}
	if (index == 9 && current_plane != 0) 
	{
		image_angle = 0;
		image_index = 24;
		if (current_plane.w_3 == 1) image_index = 13;
		if (current_plane.w_3 == 2) image_index = 15;
		if (current_plane.w_3 == 3) image_index = 17;
		if (current_plane.w_3 == 4) image_index = 19;
		if (current_plane.w_3 == 5) image_index = 21;
		if (current_plane.w_2 == 13) image_index = 13;
		if (current_plane.w_2 == 14) image_index = 29;
		if (!current_plane.w_3use && image_index != 24) image_index--;
	}
	if (index == 10 && current_plane != 0) 
	{
		image_angle = 0;
		image_index = 23;
		if (!current_plane.beam_aause && image_index != 24) image_index--;
		if (global.planedata[global.planes[current_plane.indx, 0], 10] == 0) image_index = 24;
	}
	if (index == 11 && current_plane != 0) 
	{
		image_angle = 0;
		image_index = 27
		if (!current_plane.beam_aruse && image_index != 24) image_index--;
		if (global.planedata[global.planes[current_plane.indx, 0], 11] == 0) image_index = 24;
	}	
}
