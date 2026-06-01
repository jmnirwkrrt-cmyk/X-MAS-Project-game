sound_type = "";
enemy_count = 0; // Для ИИ
massive_index = 0; // индекс в массиве для возврата хп
startsound = 0;

instance_create(x, y, button_grenade);
instance_create(x, y, button_medkit);
tx = 0;
ty = 0;



/*
1 - tails
2 - amy
3 - sonic
4 - knuckles
5 - rouge
6 - shadow
7 - silver
8 - snowman
9 - snowman_ak
10 - snowman_rifle
11 - snowman_laser
*/

hero_numb = 1; 
z = 0; // переменная высоты
zmax = 10; // макс. высота 
hp = 100; // здоровье
spd = 4; // скорость движения
damage = 10; // наносимый урон
ammo = 0;

ammomax = 0;
hpmax = 0;

hit_1_index = 1; // номер спрайта с моментом 1 удара
hit_2_index = 2; // номер спрайта с моментом 2 удара
hit_3_index = 3; // номер спрайта с моментом нокаута
jump_start_index = 2; // номер начала роста z
jump_end_index = 4; // номер начала падения z

start = 0;
hero_index = "tails";
jump = 0; // прыжок
fight = 0; // битва
super = 0; // способность
fall = 0;
delay = 0; // кол-во наносимых сразу ударов
flash = 0;
hit = 0;

back = 0;
direct = "right"; // направление 
status = "idle"; // статус

up = 0;
down = 0;
left = 0;
right = 0;


/* */
/*  */



// Доработки до 3D
px = x;
py = y;
pz = z;
//