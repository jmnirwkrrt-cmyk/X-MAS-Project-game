/// Main Menu: End Step


if (image_xscale < 1)
{
	image_xscale += 0.1;
}
else
if (image_yscale < 1)
{
	image_xscale = 1;
	image_yscale += 0.1;
}
else // Готово
{
	image_yscale = 1;
	image_xscale = 1;
	
	
	
	
	
	//var gw = display_get_gui_width();
	//var gh = display_get_gui_height();
	
	mx = device_mouse_x(0);
	my = device_mouse_y(0);
	var clk_pressed = mouse_check_button_pressed(mb_left);
	var clk_released = mouse_check_button_released(mb_left);
	
	if (global.current_diff_mn == global.light_diff_mn) but[9].txt = global.txt334;
		else
			if (global.current_diff_mn == global.normal_diff_mn) but[9].txt = global.txt335;
				else
					if (global.current_diff_mn == global.heavy_diff_mn) but[9].txt = global.txt336;
	if (global.operatives_can_die) but[16].image_index = 1;
		else but[16].image_index = 0;
	if (global.intros) but[15].image_index = 1;
	else but[15].image_index = 0;
	if (global.autosave) but[18].image_index = 1;
	else but[18].image_index = 0;
	if (global.wait_if_target) but[17].image_index = 1;
	else but[17].image_index = 0;
	but[12].y = but[10].y; but[12].x = but[10].x - 300 + global.soundvolume * 600;
	but[13].y = but[11].y; but[13].x = but[11].x - 300 + global.musicvolume * 600;
	
	if (clk_released) // Мышь отжала кнопку
	{
		
		but[0].image_index = 0;
		but[1].image_index = 0;
		but[2].image_index = 0;
		but[3].image_index = 0;
		but[4].image_index = 0;
		but[5].image_index = 0;
		but[6].image_index = 0;
		but[7].image_index = 0;
		but[8].image_index = 0;
		but[9].image_index = 0;
		//but[10].image_index = 0;
		//but[11].image_index = 0;
		//but[12].image_index = 0;
		//but[13].image_index = 0;
		but[14].image_index = 0;
		//but[15].image_index = 0;
		//but[16].image_index = 0;
		
	    if (ui_hit_sprite(but[0].spr, but[0].x, but[0].y, but[0].xs, but[0].ys, but[0].menu_type)) { ///*начать игру*/
			button_sound_effect();
			but[0].image_index = 0;
			image_xscale = 0;
			image_yscale = 0.05;
			menu_type = 3;
			
	    }
	    else if (ui_hit_sprite(but[1].spr, but[1].x, but[1].y, but[1].xs, but[1].ys, but[1].menu_type)) { ///*новая игра*/
			button_sound_effect();
			but[1].image_index = 0;
			global.money /= global.current_diff_mn;
			if (file_exists($"XMAS_savegame_v_{string(global.game_version)}_{string(global.save_number)}.dat"))
			{
				if (!instance_exists(ask_parent))
				{
					var ask = instance_create(1200 / 2, 900 / 2, ask_question);
					ask.event = 4;
				}
				//global.save_number++;	
				//if (file_exists("xmas_settings.ini"))
				//{
				//	ini_open("xmas_settings.ini");
				//	ini_write_real("save", "save_number", global.save_number);
				//	ini_close();
				//}
			}
			else
			{
				if (global.current_diff_mn == global.normal_diff_mn) global.money -= 500000;
				if (global.current_diff_mn == global.heavy_diff_mn) global.money -= 1000000;
				room_goto(map_room);
			}
	    }
	    else if (ui_hit_sprite(but[2].spr, but[2].x, but[2].y, but[2].xs, but[2].ys, but[2].menu_type)) { ///*продолжить игру*/
			button_sound_effect();
			but[2].image_index = 0;
			
			if (!instance_exists(ask_parent))
			{
				if (file_exists("XMAS_savegame_autosave.dat") && global.autosave)
				{
					var ask = instance_create(1200 / 2, 900 / 2, ask_question);
					ask.event = 5;
				}
				else
				{
					room_goto(map_room);
					global.game_loading = true;
				}
			}
	    }
	    else if (ui_hit_sprite(but[3].spr, but[3].x, but[3].y, but[3].xs, but[3].ys, but[3].menu_type)) { ///*настройки*/
			button_sound_effect();
			but[3].image_index = 0;
			image_xscale = 0;
			image_yscale = 0.05;
			menu_type = 2;
	    }
	    else if (ui_hit_sprite(but[4].spr, but[4].x, but[4].y, but[4].xs, but[4].ys, but[4].menu_type)) { ///*выход*/
			button_sound_effect();
			but[4].image_index = 0;
			
			game_end();
	    }
		 else if (ui_hit_sprite(but[19].spr, but[19].x, but[19].y, but[19].xs, but[19].ys, but[19].menu_type) && (global.is_minigame_unlocked || global.debug)) { ///*миниигра*/
			button_sound_effect();
			but[19].image_index = 0;
			
			room_goto(intro_minigame);
	    }
	    else if (ui_hit_sprite(but[5].spr, but[5].x, but[5].y, but[5].xs, but[5].ys, but[5].menu_type)) { ///*назад*/
			button_sound_effect();
			but[5].image_index = 0;
			if (!instance_exists(ask_parent))
			{
				image_xscale = 0;
				image_yscale = 0.05;
				menu_type = 1;
			}
	    }
		else if (ui_hit_sprite(but[6].spr, but[6].x, but[6].y, but[6].xs, but[6].ys, but[6].menu_type)) { ///*тестовый воздушный бой*/
			button_sound_effect();
			but[6].image_index = 0;
			
			script_execute(test_squads);
			room_goto(Air_Test_Arena_2D);
	    }
		else if (ui_hit_sprite(but[7].spr, but[7].x, but[7].y, but[7].xs, but[7].ys, but[7].menu_type)) { ///*тестовый наземный бой*/
			button_sound_effect();
			but[7].image_index = 0;
			
			script_execute(test_squads);
			room_goto(Ground_Test_Arena_3D);
	    }
		else if (ui_hit_sprite(but[8].spr, but[8].x, but[8].y, but[8].xs, but[8].ys, but[8].menu_type)) { ///*назад (из настроек)*/
			button_sound_effect();
			but[8].image_index = 0;
			
			image_xscale = 0;
			image_yscale = 0.05;
			menu_type = 1;
			
			if (file_exists("xmas_settings.ini"))
			{
				ini_open("xmas_settings.ini");
				if (global.txt1 == "Гранаты") ini_write_string("settings", "language", "ru");
				else ini_write_string("settings", "language", "eng");
				ini_write_real("settings", "music_volume", global.musicvolume);
				ini_write_real("settings", "sound_volume", global.soundvolume);
				ini_write_string("settings", "show_intro", string(global.intros));
				ini_write_string("settings", "operatives_can_die", string(global.operatives_can_die));
				ini_write_string("settings", "wait_if_target", string(global.wait_if_target));
				ini_write_real("settings", "difficult", global.current_diff_mn);
				ini_write_real("save", "save_number", global.save_number);
				ini_write_string("save", "autosave", string(global.autosave));
				ini_write_string("save", "is_minigame_unlocked", string(global.is_minigame_unlocked));
				ini_write_string("save", "skip_intro", "0");
				ini_close();
			}
			
	    }
		else if (ui_hit_sprite(but[9].spr, but[9].x, but[9].y, but[9].xs, but[9].ys, but[9].menu_type)) { ///*сложность*/
			button_sound_effect();
			but[9].image_index = 0;
			if (global.current_diff_mn == global.heavy_diff_mn) global.current_diff_mn = global.light_diff_mn;
				else if (global.current_diff_mn == global.normal_diff_mn) global.current_diff_mn = global.heavy_diff_mn;
					else if (global.current_diff_mn == global.light_diff_mn) global.current_diff_mn = global.normal_diff_mn;
		}
		else if (ui_hit_sprite(but[10].spr, but[10].x, but[10].y, but[10].xs, but[10].ys, but[10].menu_type)) { ///*громкость звука*/
			button_sound_effect();
			
			
	    }
		else if (ui_hit_sprite(but[11].spr, but[11].x, but[11].y, but[11].xs, but[11].ys, but[11].menu_type)) { ///*громкость музыки*/
			button_sound_effect();
			
			
	    }
		else if (ui_hit_sprite(but[12].spr, but[12].x, but[12].y, but[12].xs, but[12].ys, but[12].menu_type)) { ///*кнопка ползунка звука*/
			button_sound_effect();
			
			
	    }
		else if (ui_hit_sprite(but[13].spr, but[13].x, but[13].y, but[13].xs, but[13].ys, but[13].menu_type)) { ///*кнопка ползунка музыки*/
			button_sound_effect();
			
			
	    }
		else if (ui_hit_sprite(but[14].spr, but[14].x, but[14].y, but[14].xs, but[14].ys, but[14].menu_type)) { ///**/
			button_sound_effect();
			but[14].image_index = 0;
			
	    }
		else if (ui_hit_sprite(but[15].spr, but[15].x, but[15].y, but[15].xs, but[15].ys, but[15].menu_type)) { ///**/
			button_sound_effect();
			global.intros = !global.intros;
			
	    }
		else if (ui_hit_sprite(but[16].spr, but[16].x, but[16].y, but[16].xs, but[16].ys, but[16].menu_type)) { ///*чекбокс смерти оперативников*/
			button_sound_effect();
			global.operatives_can_die = !global.operatives_can_die;
			
	    }
		else if (ui_hit_sprite(but[17].spr, but[17].x, but[17].y, but[17].xs, but[17].ys, but[17].menu_type)) { ///*чекбокс удаление мест террора*/
			button_sound_effect();
			global.wait_if_target = !global.wait_if_target;
			
	    }
		else if (ui_hit_sprite(but[18].spr, but[18].x, but[18].y, but[18].xs, but[18].ys, but[18].menu_type)) { ///*чекбокс удаление мест террора*/
			button_sound_effect();
			global.autosave = !global.autosave;
			
	    }
	}
	else
		if (clk_pressed) // Мышь нажала кнопку
		{
			if (ui_hit_sprite(but[0].spr, but[0].x, but[0].y, but[0].xs, but[0].ys, but[0].menu_type)) {
				but[0].image_index = 1;
		    }
		    else if (ui_hit_sprite(but[1].spr, but[1].x, but[1].y, but[1].xs, but[1].ys, but[1].menu_type)) {
				but[1].image_index = 1;
		    }
		    else if (ui_hit_sprite(but[2].spr, but[2].x, but[2].y, but[2].xs, but[2].ys, but[2].menu_type)) {
				but[2].image_index = 1;
		    }
		    else if (ui_hit_sprite(but[3].spr, but[3].x, but[3].y, but[3].xs, but[3].ys, but[3].menu_type)) {
				but[3].image_index = 1;
		    }
		    else if (ui_hit_sprite(but[4].spr, but[4].x, but[4].y, but[4].xs, but[4].ys, but[4].menu_type)) {
				but[4].image_index = 1;
		    }
		    else if (ui_hit_sprite(but[5].spr, but[5].x, but[5].y, but[5].xs, but[5].ys, but[5].menu_type)) {
				but[5].image_index = 1;
		    }
			else if (ui_hit_sprite(but[6].spr, but[6].x, but[6].y, but[6].xs, but[6].ys, but[6].menu_type)) {
				but[6].image_index = 1;
		    }
			else if (ui_hit_sprite(but[7].spr, but[7].x, but[7].y, but[7].xs, but[7].ys, but[7].menu_type)) {
				but[7].image_index = 1;
		    }
			else if (ui_hit_sprite(but[8].spr, but[8].x, but[8].y, but[8].xs, but[8].ys, but[8].menu_type)) {
				but[8].image_index = 1;
		    }
			else if (ui_hit_sprite(but[9].spr, but[9].x, but[9].y, but[9].xs, but[9].ys, but[9].menu_type)) {
				but[9].image_index = 1;
		    }
			else if (ui_hit_sprite(but[10].spr, but[10].x, but[10].y, but[10].xs, but[10].ys, but[10].menu_type)) {
				global.soundvolume = (100 + (mouse_x - but[10].x - 300) * 0.16666666666666666666666666666667) / 100;
				show_debug_message($"Громкость звука изменена на {global.soundvolume}");
				if (global.soundvolume < 0) global.soundvolume = 0;
				if (global.soundvolume > 1) global.soundvolume = 1;
		    }
			else if (ui_hit_sprite(but[11].spr, but[11].x, but[11].y, but[11].xs, but[11].ys, but[11].menu_type)) {
				global.musicvolume = (100 + (mouse_x - but[11].x - 300) * 0.16666666666666666666666666666667) / 100;
				if (global.musicvolume < 0) global.musicvolume = 0;
				if (global.musicvolume > 1) global.musicvolume = 1;
				
				sound_stop_all();
		    }
			else if (ui_hit_sprite(but[12].spr, but[12].x, but[12].y, but[12].xs, but[12].ys, but[12].menu_type)) {
				
		    }
			else if (ui_hit_sprite(but[13].spr, but[13].x, but[13].y, but[13].xs, but[13].ys, but[13].menu_type)) {
				
		    }
			else if (ui_hit_sprite(but[14].spr, but[14].x, but[14].y, but[14].xs, but[14].ys, but[14].menu_type)) {
				but[14].image_index = 1;
		    }
			else if (ui_hit_sprite(but[15].spr, but[15].x, but[15].y, but[15].xs, but[15].ys, but[15].menu_type)) {
				
		    }
			else if (ui_hit_sprite(but[16].spr, but[16].x, but[16].y, but[16].xs, but[16].ys, but[16].menu_type)) {
				
		    }
			
		}
	
}


