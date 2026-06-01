if (!instance_exists(ask_build) and global.base_exists and !instance_exists(ask_parent))
{
var back = noone;
button_sound_effect();
if (!instance_exists(background_map)) back = instance_create(0, 0, background_map); 
else instance_destroy(background_map);
if (back != noone) back.type = 10;
image_index = 0;

}

