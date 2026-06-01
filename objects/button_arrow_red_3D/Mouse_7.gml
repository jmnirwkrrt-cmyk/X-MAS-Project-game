sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
if (menu_small.index > 0)
{
image_index = 0;
follower = instance_create(x, y, mouse_follower);
follower.type = menu_small.index;
instance_destroy(menu_small)
instance_create(x, y, tabletop)
instance_destroy(menu_small);
}

