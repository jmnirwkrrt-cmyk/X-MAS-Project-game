if (!instance_exists(ask_build) and global.base_exists and !instance_exists(ask_parent))
{
button_sound_effect();
image_index = 0;
instance_create(0, 0, background_map);
}

