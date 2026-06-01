sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
image_index = 0;

if (image_xscale = 1)
{
	parent.selected_escort--;
	
}
if (image_xscale = -1)
{
	parent.selected_escort++;
}

if (parent.selected_escort > parent.acces_escorts[0]) parent.selected_escort = 1;
if (parent.selected_escort < 1) parent.selected_escort = parent.acces_escorts[0];
