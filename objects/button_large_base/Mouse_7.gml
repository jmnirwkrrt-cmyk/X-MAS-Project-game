if (!instance_exists(ask_build) and global.base_exists and !instance_exists(ask_parent))
{

button_sound_effect();
if (!instance_exists(map_base)) instance_create(0, 0, map_base); 
else instance_destroy(map_base);
image_index = 0;

}

