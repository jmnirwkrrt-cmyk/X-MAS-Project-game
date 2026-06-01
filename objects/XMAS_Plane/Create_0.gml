enemy_target_indx = noone;
indx = 0; // 1 - ветер, пингвин, торнадо, альбатрос, фотон, МиГ, скаут, рейнджер
indx_esc = 0;

is_shell = false;

move_target_x = 0;
move_target_y = 0;
spd_div = global.spd_div; // делитель табличной скорости
w = 550;

side = 1;

name = "";
scale = 0.7;
speed = 0;
image_xscale = -scale;
image_yscale = -scale;
image_speed = 0;
ready = false;
ready_to_return = false;
hp = 0;
max_hp = 0;
max_speed = 0;
angl_velocity = 0;
can_avoid = 0;
acc = 0;
sup_speed = 0;
target_speed = 0;
roll = 0;
roll_cooldown = 0; 
dir = 0;

guidance_type = irandom_range(0, 1); // 0 - ближайший, 1 - случайный

w_1 = 0; //1 - пулемёт, 2 - воробей, 3 - скат, 4 - стрела, 5 - ПКР, 6 - излучатель, 13 - ул. пулемет, 14 - зилот
w_2 = 0;
w_3 = 0;
d_1 = 0; //1 - ПРО
a_1 = 0; //1 - ПВО
w_1a = 0;
w_2a = 0;
w_3a = 0;
w_1r = 0; // дистанции применения
w_2r = 0;
w_3r = 0;
w_1use = true;
w_2use = true;
w_3use = true;
beam_aause = true;
beam_aruse = true;
cooldown_1 = 0;
cooldown_2 = 0;
cooldown_3 = 0;

sprite_module_index = 0;

task = "patrol"; // avoid, patrol, attack, move

selected = false;

module_hp[4] = -1; // двигатель -1 = не представлен, -2 = уничтожен
module_hp[6] = -1; // левый двигатель
module_hp[5] = -1; // правый двигатель
module_hp[3] = -1; // левое крыло
module_hp[2] = -1; // правое крыло
module_hp[1] = -1; // кабина

