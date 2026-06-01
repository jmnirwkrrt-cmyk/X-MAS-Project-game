basic_size = 0.9;
base_x = x;
base_y = y;
new_x = x;
new_y = y;
debug = global.debug; // видимый всегда
radar_range = 0;
speed_deviation = 0;
depth++;

type = 0; // 1 - разведка, 2 - господство в воздухе, 3 - грузоперевозки из города в город

scanning_time = 0;

infight = false;

var founded = true;
visible = founded;

image_speed = 0.25;
name = "";
text = instance_create(x, y, text_obj_red_14);
text.depthh = 8;
text.w = 500;
text.txt = "";
ready = false;
drw = noone;

first_spawn = true;

height = 25000;

status = 2; // 0 - полёт к точке, 1 - атака цели, 2 - перенацеливание, 3 - возврат
point_x = 0;
point_y = 0;
point_xn = 0;
point_yn = 0;
target = noone;
indx = 0;
var i;


global.objects_ids++;
own_id = global.objects_ids;
target_id = noone;