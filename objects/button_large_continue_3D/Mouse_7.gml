sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
image_index = 0;
if (instance_exists(hero_obj))
{
instance_destroy(menu_small);
}

