if (invisiblity)
{
	
}
else
{
	if (Minigame_commander.is_game_winned == 0)
	{
		invisiblity = true;
		inv_timer = 150;
		Minigame_commander.tries--;
		sound_play(Squeeze_sound);
		sound_volume(Squeeze_sound, global.voicevolume);
		if (sprite_index == Whisper_sprite)
		{
			Minigame_commander.is_game_winned = -1;
			Minigame_commander.tries = 0;
			exit;
		}
		if (sprite_index == Tangle_sprite) sprite_index = Sonia_sprite;
		else sprite_index = Whisper_sprite;
		x = Minigame_commander.spawn_x;
		y = Minigame_commander.spawn_y;
	}
}