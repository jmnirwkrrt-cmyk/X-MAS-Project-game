//movie_resume(global.video);
if (video_get_status() == video_status_closed) 
{
	if (file_exists("xmas_settings.ini"))
	{
		ini_open("xmas_settings.ini");
		ini_write_string("save", "skip_intro", "1");
		ini_close();
	}
	game_restart(); 
	exit; 
}
//if (!window_has_focus())
//{ 
//movie_close(global.video);
//room_goto_next();
//}

