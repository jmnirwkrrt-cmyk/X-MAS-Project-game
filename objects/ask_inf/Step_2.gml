if (image_xscale = 1 and image_yscale = 1 and !instance_exists(ask_infweapon) and !instance_exists(ask_question_i) and !instance_exists(ask_message) and !instance_exists(ask_infdesignation))
{
	instance_destroy(button_large_b_infdesc);
	instance_destroy(text_obj_white_28);
	instance_destroy(text_obj_red_28);
	instance_destroy(text_obj_red_28_left);
	instance_destroy(button_large_b_iremove);

	if (!instance_exists(button_large_b_infname) or !instance_exists(button_large_b_designation) or (!instance_exists(button_large_b_iweapon) and global.team[indx, 2] = "snowman")) 
	{
		but1 = instance_create(x - 300, y - 322, button_large_b_infname); but1.indx = indx;
		but2 = instance_create(x - 2, y - 222, button_large_b_designation); but2.indx = indx;
		if (global.team[indx, 2] = "snowman") { but3 = instance_create(x - 2, y - 108, button_large_b_iweapon); but3.indx = indx; }
	}
	but5 = instance_create(x - 333, y + 275, button_large_b_iremove);
	but5.indx = indx;
	but5.type = 1;
	but5.text.txt = global.txt156;
	but6 = instance_create(x + 32, y + 275, button_large_b_iremove);
	but6.indx = indx;
	but6.type = 2;
	but6.text.txt = global.txt24;
	
	
	text8 = instance_create(x - 300, y + 108, text_obj_white_28);
	text8.w = 500;
	text8.txt = global.team[indx, 4]; //global.team[indx, 4] / global.team[indx, 5] * 100;
	text8.txt = string_insert(global.txt157, text8.txt, 0);
	
	text9 = instance_create(x - 300, y + 158, text_obj_white_28);
	text9.w = 500;
	text9.txt = global.txt387 + string(global.team[indx, 6]);
	
}

