if (keyboard_check_released(vk_end)) sound_stop_all();

if (room == map_room) 
{
	if (!instance_exists(background_map))
	{
		no_playing = true;
		for (i = 1; i <= map_room_music[0]; i++)
		{
			if (sound_isplaying(map_room_music[i])) { no_playing = false; break; }
		}
		if (no_playing)
		{
			sound_stop_all();
			var random_index = irandom_range(1, map_room_music[0]);
			sound_play(map_room_music[random_index]);
			sound_volume(map_room_music[random_index], global.musicvolume);
		}
	}
	else
	{
		var back = instance_find(background_map, 0);
		if (back.type == 7) // мемориал
		{
			no_playing = true;
			for (i = 1; i <= lost_music[0]; i++)
			{
				if (sound_isplaying(lost_music[i])) { no_playing = false; break; }
			}
			if (no_playing)
			{
				sound_stop_all();
				var random_index = irandom_range(1, lost_music[0]);
				sound_play(lost_music[random_index]);
				sound_volume(lost_music[random_index], global.musicvolume);
			}
		}
		else
		if (back.type == 11) // брифинг (начало боя)
		{
			if (global.ground_battle_type != 5)
			{
				no_playing = true;
				for (i = 1; i <= briefieng_music[0]; i++)
				{
					if (sound_isplaying(briefieng_music[i])) { no_playing = false; break; }
				}
				if (no_playing)
				{
					sound_stop_all();
					var random_index = irandom_range(1, briefieng_music[0]);
					sound_play(briefieng_music[random_index]);
					sound_volume(briefieng_music[random_index], global.musicvolume);
				}	
			}
			else
			{
				no_playing = true;
				for (i = 1; i <= assault_music[0]; i++)
				{
					if (sound_isplaying(assault_music[i])) { no_playing = false; break; }
				}
				if (no_playing)
				{
					sound_stop_all();
					var random_index = irandom_range(1, assault_music[0]);
					sound_play(assault_music[random_index]);
					sound_volume(assault_music[random_index], global.musicvolume);
				}	
			}
		}
		else
		if (back.type == 12) // брифинг (конец боя)
		{
			if (global.win = -1)
			{
				no_playing = true;
				for (i = 1; i <= lost_music[0]; i++)
				{
					if (sound_isplaying(lost_music[i])) { no_playing = false; break; }
				}
				if (no_playing)
				{
					sound_stop_all();
					var random_index = irandom_range(1, lost_music[0]);
					sound_play(lost_music[random_index]);
					sound_volume(lost_music[random_index], global.musicvolume);
				}	
			}
			else
			{
				no_playing = true;
				for (i = 1; i <= win_music[0]; i++)
				{
					if (sound_isplaying(win_music[i])) { no_playing = false; break; }
				}
				if (no_playing)
				{
					sound_stop_all();
					var random_index = irandom_range(1, win_music[0]);
					sound_play(win_music[random_index]);
					sound_volume(win_music[random_index], global.musicvolume);
				}		
			}
		}
		else
		if (back.type == 15) // поражение проекта
		{
			no_playing = true;
			for (i = 1; i <= lost_music[0]; i++)
			{
				if (sound_isplaying(lost_music[i])) { no_playing = false; break; }
			}
			if (no_playing)
			{
				sound_stop_all();
				var random_index = irandom_range(1, lost_music[0]);
				sound_play(lost_music[random_index]);
				sound_volume(lost_music[random_index], global.musicvolume);
			}
		}
		else
		if (back.type == 16) // победа проекта
		{
			no_playing = true;
			for (i = 1; i <= win_music[0]; i++)
			{
				if (sound_isplaying(win_music[i])) { no_playing = false; break; }
			}
			if (no_playing)
			{
				sound_stop_all();
				var random_index = irandom_range(1, win_music[0]);
				sound_play(win_music[random_index]);
				sound_volume(win_music[random_index], global.musicvolume);
			}
		}
		else
		if (back.type == 17) // победа проекта
		{
			no_playing = true;
		}
		else
		{
			no_playing = true;
			for (i = 1; i <= map_room_music[0]; i++)
			{
				if (sound_isplaying(map_room_music[i])) { no_playing = false; break; }
			}
			if (no_playing)
			{
				sound_stop_all();
				var random_index = irandom_range(1, map_room_music[0]);
				sound_play(map_room_music[random_index]);
				sound_volume(map_room_music[random_index], global.musicvolume);
			}
		}
	}
}

if (room == plane_map || room == Air_Test_Arena_2D) 
{
	no_playing = true;
	for (i = 1; i <= plane_room_music[0]; i++)
	{
		if (sound_isplaying(plane_room_music[i])) { no_playing = false; break; }
	}
	if (no_playing)
	{
		sound_stop_all();
		var random_index = irandom_range(1, plane_room_music[0]);
		sound_play(plane_room_music[random_index]);
		sound_volume(plane_room_music[random_index], global.musicvolume);
	}
}

if (room == Ground_Test_Arena_3D || room == ground_map) 
{
	no_playing = true;
	if (sound_isplaying(Metal_Depot) || sound_isplaying(Ocean_Base))
	{
		no_playing = false;
	}
	else
	{
		for (i = 1; i <= battle_room_music[0]; i++)
		{
			if (sound_isplaying(battle_room_music[i])) { no_playing = false; break; }
		}
	}
	if (no_playing)
	{
		if (global.ground_battle_type != 4 && global.ground_battle_type != 5)
		{
			sound_stop_all();
			var random_index = irandom_range(1, battle_room_music[0]);
			sound_play(battle_room_music[random_index]);
			sound_volume(battle_room_music[random_index], global.musicvolume);
		}
		else
		{
			if (global.ground_battle_type == 4)
			{
				sound_play(Metal_Depot);
				sound_volume(Metal_Depot, global.musicvolume);
			}
			else
			if (global.ground_battle_type == 5)
			{
				sound_play(Ocean_Base);
				sound_volume(Ocean_Base, global.musicvolume);
			}
		}
	}
}

if (room == menu_room) 
{
	no_playing = true;
	for (i = 1; i <= menu_room_music[0]; i++)
	{
		if (sound_isplaying(menu_room_music[i])) { no_playing = false; break; }
	}
	if (no_playing)
	{
		sound_stop_all();
		var random_index = irandom_range(1, menu_room_music[0]);
		sound_play(menu_room_music[random_index]);
		sound_volume(menu_room_music[random_index], global.musicvolume);
	}
}

if (room == mini_game) 
{
	no_playing = true;
	for (i = 1; i <= minigame_music[0]; i++)
	{
		if (sound_isplaying(minigame_music[i])) { no_playing = false; break; }
	}
	if (no_playing)
	{
		sound_stop_all();
		var random_index = irandom_range(1, minigame_music[0]);
		sound_play(minigame_music[random_index]);
		sound_volume(minigame_music[random_index], global.musicvolume);
	}
}



