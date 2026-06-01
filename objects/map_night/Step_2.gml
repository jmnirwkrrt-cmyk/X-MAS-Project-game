
visible = time_m.night_mode;
current_angle -= 0.004 * global.timespeed;
image_angle = current_angle; // на случай, если такие мелкие значения этой переменной не поддерживаются

image_xscale = map_obj.image_xscale;
image_yscale = map_obj.image_yscale;
if (base_x > map_obj.basic_x) new_x = base_x + (base_x - 450) * (map_obj.image_xscale - 1);
if (base_x < map_obj.basic_x) new_x = base_x - (450 - base_x) * (map_obj.image_xscale - 1);
if (base_y > map_obj.basic_y) new_y = base_y + (base_y - 450) * (map_obj.image_yscale - 1);
if (base_y < map_obj.basic_y) new_y = base_y - (450 - base_y) * (map_obj.image_yscale - 1);


x = new_x + (map_obj.x - map_obj.basic_x);
y = new_y + (map_obj.y - map_obj.basic_y);