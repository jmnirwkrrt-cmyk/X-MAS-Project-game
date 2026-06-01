if (!instance_exists(ask_parent))
{
	button_sound_effect();
	image_index = 0;
	var i;
	var n = false;
	for (i = 1; i <= global.technologies[0, 0]; i++)
	{
		if (!global.technologies[i, 1] and global.technologies[i, 2] and global.technologies[i, 4] == 0 and global.scientist > 0 and global.laboratoryplace > 0) { n = true; break; } 
	}
	if (n and !instance_exists(ask_techselect)) { instance_create(1200 / 2, 900 / 2, ask_techselect); }
}
