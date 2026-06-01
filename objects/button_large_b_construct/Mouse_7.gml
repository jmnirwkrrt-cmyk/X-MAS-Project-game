if (!instance_exists(ask_parent))
{
	button_sound_effect();
	image_index = 0;
	var i;
	var n = false;
	for (i = 1; i <= global.constructitem[0, 0]; i++)
	{
		if (global.constructitem[i, 1] < 1 and global.constructitem[i, 9] and global.constructitem[i, 8] < 1 and global.engineers > 0 and global.workshopplace > 0) { n = true; break; } 
	}
	if (n and !instance_exists(ask_constrselect)) { instance_create(1200 / 2, 900 / 2, ask_constrselect); }
}
