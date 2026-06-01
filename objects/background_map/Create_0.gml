image_speed = 0;
image_index = image_number - 1;
type = 0; // 0 - исследования, 1 - магазин, 2 - статистика, 3 - продажа, 4 - производство, 5 - самолеты и пехота, 6 - казарма, 7 - мемориал, 101 - уфопедия
// 8 - отправка перехватчиков, 9 - еженедельный репорт, 10 - почта, 11 - начало наземного боя 12 - итоги наземного боя
// 13 - окно бомбардировки базы, 14 - окно вторжения на базу, 15 - окно поражения, 16 - окно победы,
// 17 - окно отключения энергии на базе
but1 = noone;
but2 = noone;
costtext = "";
moneytext = "";
cost = 0;

sam_history = array_create(0);
bomb_history = array_create(0);
time_between_events_max = 50;
time_between_events = time_between_events_max;
start_base_defense = false;
events_opened = 0;
timer = 0;

skip_runs = 1; // пропуск первого step чтобы не удалился следующий background если закрылся этот

amounts = 0;
amounte = 0;
splav = 0;
energo = 0;
energyscrap = 0;
list = 1; 
maxonlist = 9;
target_x = 0;
target_y = 0;
target = noone;
esc = false;
opened_mail = 0;
instance_destroy(ask_question_inter);
instance_deactivate_all(true);
instance_activate_object(music_commander);
instance_create(0, 0, background_line);

wikipage = 1; // страница в уфопедии



