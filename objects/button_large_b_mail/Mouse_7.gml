if (indx > 0 && background != noone)
{
	instance_destroy(select_inmenu);
	if (background.opened_mail == 0) background.opened_mail = indx;
	else background.opened_mail = 0;
	
	if (indx == 5) 
	{ 
		show_debug_message("Миниигра разблокирована!"); 
		if (!global.is_minigame_unlocked) 
		{
			global.is_minigame_unlocked = true 
			ini_open("xmas_settings.ini");
			ini_write_string("save", "is_minigame_unlocked", string(global.is_minigame_unlocked));
			ini_close();
		}
	}
}
