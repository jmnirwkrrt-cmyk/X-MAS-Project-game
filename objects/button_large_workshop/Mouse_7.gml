if (!instance_exists(ask_build) and global.base_exists and !instance_exists(ask_message) and !instance_exists(ask_question))
{

button_sound_effect();
image_index = 0;
map = instance_create(0, 0, background_map);
map.type = 4;
}

