
global.pause = 1;
index = 0;

instance_deactivate_all(true);
instance_activate_object(room_control);

x = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.HBorder, 0 ) - 250;
y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.VBorder, 0 ) - 350;
but1 = instance_create(x + 24, y + 70, button_large_continue);
but2 = instance_create(x + 24, y + 130, button_large_evac);
but3 = instance_create(x + 24, y + 190, button_large_exit);
but4 = instance_create(x + 680, y + 173, button_arrow_red);
but5 = instance_create(x + 384, y + 54, button_arrow);
but6 = instance_create(x + 805, y + 54, button_arrow);
but6.image_xscale = -1;
text1 = instance_create(x + 594, y + 85, text_obj_red);
text1.w = 244;
text1.txt = "";
text2 = instance_create(x + 560, y + 182, text_obj_red);
text2.txt = global.txt5;
text3 = instance_create(x + 556, y + 321, text_obj_red);
text3.w = 200;
text3.txt = "Задача: уничтожить всех противников";


