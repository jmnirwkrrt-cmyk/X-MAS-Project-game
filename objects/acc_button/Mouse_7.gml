if (!instance_exists(ask_parent))
{
if (time_m.messages_mode == true) time_m.menu_messages[time_m.current_message, 1] = 0;
	
if (d = 1) { global.timespeed = global.speed_1; }
if (d = 3) { global.timespeed = global.speed_2; }
if (d = 5) { global.timespeed = global.speed_3; }
if (d = 7) { global.timespeed = global.speed_4; }
if (d = 13) { time_m.night_mode = !time_m.night_mode; }
if (d = 11) { time_m.messages_mode = !time_m.messages_mode; }
sound_play(button_sound); sound_volume(button_sound, global.soundvolume);

}


