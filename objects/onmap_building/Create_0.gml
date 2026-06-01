basic_size = 0.5;
base_x = x;
base_y = y;
new_x = x;
new_y = y;

image_speed = 0.25;
name = "";
radar_range = 0;
AA_range = 0;
AA_damage = 0;
building_time = 0;
text = instance_create(x, y, text_obj_red_14);
text.depthh = 8;
drawradar = instance_create(x, y, draw_onmap);
drawaa = instance_create(x, y, draw_onmap);
drawaa.color = 1;
text.w = 500;
text.txt = "";
type = 0; // 1 - база, 2 - РЛС, 3 - ЗРК, 4 - завод
revealed = false; // обнаружена противником или нет

global.objects_ids++;
own_id = global.objects_ids;
target_id = noone;
money_addition = 0;