if (image_xscale = 1 and image_yscale = 1)
{
	instance_destroy(button_large_b_iweapon);
	instance_destroy(text_obj_white_28);
	instance_destroy(button_large_b_designation);
	if (mcurrent > 0)
	while (weapon[mcurrent, 1] < 1 and mcurrent < mmax) mcurrent++;
	
	if (mcurrent > mmax) mcurrent = mmin;
	if (mcurrent < mmin) mcurrent = mmax;
	
	
	if (mcurrent = 0) { text.txt = global.txt161; }
		if (mcurrent > 0)
		{
			if (global.atstockpile[weapon[mcurrent, 0], 0] = 1) { text.txt = global.txt159; }
			if (global.atstockpile[weapon[mcurrent, 0], 0] = 3) { text.txt = global.txt158; }
			if (global.atstockpile[weapon[mcurrent, 0], 0] = 16) { text.txt = global.txt160; }
		}
	
}

