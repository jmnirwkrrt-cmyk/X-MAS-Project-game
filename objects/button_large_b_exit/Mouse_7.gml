if (!instance_exists(ask_techselect) and !instance_exists(ask_plane) and !instance_exists(ask_inf) and !instance_exists(ask_question_b) and !instance_exists(ask_message) and visible)
{
	button_sound_effect();
	image_index = 0;
	if (instance_exists(background_map)) instance_destroy(instance_find(background_map, 0));
	instance_destroy(self);
	exit;
}

