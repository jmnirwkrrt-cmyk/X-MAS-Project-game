if (!mouse_check_button_pressed(mb_left) and !mouse_check_button_released(mb_left))
{
if (global.timespeed = global.speed_1 and d = 1) { image_index = 0; }
else
if (global.timespeed = global.speed_2 and d = 3) { image_index = 2; }
else
if (global.timespeed = global.speed_3 and d = 5) { image_index = 4; }
else
if (global.timespeed = global.speed_4 and d = 7) { image_index = 6; }
else
{ image_index = d; }
}

