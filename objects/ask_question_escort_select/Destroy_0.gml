if (instance_exists(text)) instance_destroy(text);
if (instance_exists(but1)) instance_destroy(but1);
if (instance_exists(but2)) instance_destroy(but2);
if (instance_exists(text2)) instance_destroy(text2);
if (instance_exists(left_arrow)) instance_destroy(left_arrow);
if (instance_exists(right_arrow)) instance_destroy(right_arrow);
instance_activate_object(text_obj_red_28);
global.timespeed = time_speed;