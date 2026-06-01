if (keyboard_check_released(vk_escape)) room_goto(menu_room);

if (is_made_sound && is_game_winned == 0)
{
	if (instance_exists(Minigame_player) && is_sound_reloaded)
	{
		if (Minigame_player.sprite_index == Tangle_sprite) { sound_play(Lemur_sound); sound_volume(Lemur_sound, global.voicevolume); }	
		if (Minigame_player.sprite_index == Sonia_sprite) { sound_play(Hedgehog_sound); sound_volume(Hedgehog_sound, global.voicevolume); }	
		if (Minigame_player.sprite_index == Whisper_sprite) { sound_play(Wolf_sound); sound_volume(Wolf_sound, global.voicevolume); }	
	
		minigame_score += 500;
		sound_timer = 200;
		is_sound_reloaded = false;
	}
	if (sound_timer > 0)
	{
		with (Minigame_human)
		{
			speed = max_speed * 1.5;	
		}	
		sound_timer--;
	}
	else
	{
		with (Minigame_human)
		{
			speed = max_speed;	
		}
		is_made_sound = false;
		is_sound_reloaded = true;
	}
}
if (is_game_winned == 0)
{
	minigame_score++;	
}