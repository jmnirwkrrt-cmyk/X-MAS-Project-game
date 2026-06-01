if (instance_exists(text)) instance_destroy(text);
if (instance_exists(but1)) instance_destroy(but1);
if (type != 4 && instance_exists(but2)) instance_destroy(but2);
if (type != 4 && instance_exists(but3)) instance_destroy(but3);
if ((type == 2 || type == 4) && instance_exists(but4)) instance_destroy(but4);
instance_activate_object(text_obj_red_28);
global.timespeed = time_speed;