//image_alpha = 1;
indx = instance_number(select_inmenu) - 1;
x_orig = x;
y_orig = y;
x = x_orig + 54;
y = y_orig - 2;

if (place_meeting(x, y, select_inmenu)) instance_destroy(self);

//for (i = 0; i < instance_number(select_inmenu); i++)
//if (distance_to_object(instance_find(select_inmenu, i)) == 0 && instance_find(select_inmenu, i).indx != indx) { instance_destroy(self); break; }
