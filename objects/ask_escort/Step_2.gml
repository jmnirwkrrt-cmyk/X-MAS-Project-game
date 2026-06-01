if (image_xscale = 1 and image_yscale = 1 and !instance_exists(ask_message))
{

if (!ready)
{
var obj;
for (i = 0; i < instance_number(onmap_escort); i++)
{
	obj = instance_find(onmap_escort, i);
	if (obj.indx == indx) break;
}

but1 = instance_create(x - 333, y - 100, button_large_b_idesignation);
but1.indx = indx;
but5 = instance_create(x - 333, y + 275, button_large_b_premove);
but5.indx = indx;
but5.type = 1;
but5.txt = global.txt216;
but6 = instance_create(x + 32, y + 275, button_large_b_premove);
but6.indx = indx;
but6.type = 2;
but6.txt = global.txt24;

text8 = instance_create(x - 300, y, text_obj_white_28);
text8.w = 500;
text8.txt = global.planes[global.escortplayer[indx, 4], 2] / global.planedata[global.planes[global.escortplayer[indx, 4], 0], 1] * 100;
text8.txt = string_insert(global.txt125, text8.txt, 0);

text9 = instance_create(x - 300, y + 108, text_obj_white_28);
text9.w = 500;
text9.txt = global.planes[global.escortplayer[indx, 4], 1] / global.planedata[global.planes[global.escortplayer[indx, 4], 0], 5] * 100;
text9.txt = string_insert(global.txt124, text9.txt, 0);

text10 = instance_create(x - 300, y + 208, text_obj_white_28);
text10.w = 500;
text10.txt = global.txt236 + string(obj.height);

text11 = instance_create(x - 300, y - 308, text_obj_white_28);
text11.w = 500;
text11.txt = global.txt237 + string(indx);

text12 = instance_create(x - 300, y - 208, text_obj_white_28);
text12.w = 500;
text12.txt = global.txt238 + string(global.escortplayer[indx, 1]);

ready = true;

if (!instance_exists(obj)) instance_destroy(self);
}

but1.depth = -4;
but5.depth = -4;
but6.depth = -4;

}
else
{
instance_deactivate_object(text_obj_red_28);
instance_deactivate_object(text_obj_red_12);
instance_deactivate_object(text_obj_white_28);
instance_destroy(button_large_b_premove);
instance_destroy(button_large_b_idesignation);	
}

