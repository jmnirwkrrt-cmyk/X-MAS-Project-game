if (!instance_exists(ask_message) and !instance_exists(ask_question))
{
	button_sound_effect();
	image_index = 0;
	background_map.esc = true;
	instance_destroy(background_map);
}

