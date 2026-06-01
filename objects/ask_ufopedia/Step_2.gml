if (image_xscale = 1 and image_yscale = 1 and !instance_exists(ask_question_i) and !instance_exists(ask_message))
{
instance_deactivate_object(text_obj_red_28);


if (!ready && image_yscale > 0.9)
{
text = instance_create(x, y - 300, text_obj_white_28_c);
text.w = 500;
text.txt = global.txt290;
but1 = instance_create(x - 300, y - 225, button_large_ufopedia);
but1.type = 1;
but2 = instance_create(x - 300, y - 150, button_large_ufopedia);
but2.type = 2;
but3 = instance_create(x - 300, y - 75, button_large_ufopedia);
but3.type = 3;
but4 = instance_create(x - 300, y + 0, button_large_ufopedia);
but4.type = 4;
but5 = instance_create(x + 10, y - 225, button_large_ufopedia);
but5.type = 5;
but6 = instance_create(x + 10, y - 150, button_large_ufopedia);
but6.type = 6;
but7 = instance_create(x + 10, y - 75, button_large_ufopedia);
but7.type = 7;
but8 = instance_create(x + 10, y + 0, button_large_ufopedia);
but8.type = 8;
but10 = instance_create(x + 10, y + 75, button_large_ufopedia);
but10.type = 9;

but9 = instance_create(x - 150, y + 250, button_large_q_no);
but9.txt = global.txt24
	
ready = true;
}

if (but9.no) instance_destroy(self);


}

