seconds_current = 0;
minutes_current = 0;
hours_current = 0;
minutes_spawn_enemy_current = 0;
minutes_spawn_ally_current = 0;
day_current = global.startday;
month_current = global.startmonth;
year_current = global.startyear;
night_mode = true;
messages_mode = false
new_messages = false;
txt = "";
w = 200;
do_autosave = false;

string_max_length = 185;
current_message = 0;
enemies_per_day = 0;
allies_per_day = 0;

menu_messages[0,0] = 0;
menu_messages[1,0] = global.map_messages_text_1;
menu_messages[1,1] = global.messages_life_time;
menu_messages[0,0]++;
menu_messages[2,0] = global.map_messages_text_2;
menu_messages[2,1] = global.messages_life_time;
menu_messages[0,0]++;
new_messages = true;

report_day = 0;

time_speed_saved = 0;

// пасхалки
global.silver_apples = false;