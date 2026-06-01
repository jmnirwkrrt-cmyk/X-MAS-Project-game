function sound_functions(){










}

function button_sound_effect()
{
	rand = irandom_range(1, 3);
	if (rand == 1) { sound_play(ui_select); sound_volume(ui_select, global.soundvolume); }
	if (rand == 2) { sound_play(ui_back); sound_volume(ui_back, global.soundvolume); }
	if (rand == 3) { sound_play(ui_message); sound_volume(ui_message, global.soundvolume); }
	
}

function window_sound_effect()
{
	rand = irandom_range(1, 3);
	if (rand == 1) { sound_play(ui_select); sound_volume(ui_select, global.soundvolume); }
	if (rand == 2) { sound_play(ui_back); sound_volume(ui_back, global.soundvolume); }
	if (rand == 3) { sound_play(ui_message); sound_volume(ui_message, global.soundvolume); }
	
}