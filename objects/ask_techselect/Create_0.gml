instance_destroy(text_obj_red_28_left);
image_xscale = 0;
image_yscale = 0;
image_speed = 0;
image_index = 2;

mcurrent = 0;
mmax = global.technologies[0, 0];
mmin = 0;
text = instance_create(x, y + 50, text_obj_red);
text.w = 500;
text1 = instance_create(x, y - 50, text_obj_red_28);
text1.w = 500;
text1.txt = global.txt26;




