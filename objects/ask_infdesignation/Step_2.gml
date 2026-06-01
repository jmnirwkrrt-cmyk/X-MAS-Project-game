if (image_xscale = 1 and image_yscale = 1)
{
instance_destroy(button_large_b_iweapon);
instance_destroy(button_large_b_designation);
instance_destroy(text_obj_white_28);
if (mcurrent > mmax) mcurrent = mmin;
if (mcurrent < mmin) mcurrent = mmax;


if (mcurrent = 0) text.txt = global.txt164;
if (mcurrent > 0) text.txt = global.planes[plane[mcurrent, 0], 15];
}

