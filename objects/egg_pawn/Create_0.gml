sound_play(pawn_go); sound_volume(pawn_go, global.voicevolume);

z = 0; // переменная высоты
zmax = 10; // макс. высота 
hp = 100; // здоровье
spd = 4; // скорость движения
damage = 10; // наносимый урон

hit_1_index = 1; // номер спрайта с моментом 1 удара
hit_2_index = 2; // номер спрайта с моментом 2 удара
hit_3_index = 3; // номер спрайта с моментом нокаута
jump_start_index = 2; // номер начала роста z
jump_end_index = 4; // номер начала падения z

start = 0;
index = "pawn";
jump = 0; // прыжок
fight = 0; // битва
fall = 0;
flash = 0;
hit = 0;

armor = 0;

back = 0;
direct = "right"; // направление 
status = "idle"; // статус

up = 0;
down = 0;
left = 0;
right = 0;

