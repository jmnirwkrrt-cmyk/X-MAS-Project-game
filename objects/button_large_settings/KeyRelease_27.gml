if (!instance_exists(ask_build) and global.base_exists and !instance_exists(ask_parent))
{

	var question = instance_create(1200 / 2, 900 / 2, ask_question);
	question.event = 2;
	button_sound_effect();
	image_index = 0;

}

