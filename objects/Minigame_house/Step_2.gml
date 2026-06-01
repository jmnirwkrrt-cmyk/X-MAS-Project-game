if (Minigame_commander.is_game_winned == 0)
{
	if (timer == 0)
	{
		show_debug_message($"Человек создается");
		timer = timer_max;
		var human_created = false;
		var tries = 500;
		while (!human_created)
		{
			tries--;
			var rand_x = 0;
			var rand_y = 0;
			rand_x = irandom_range(x - sprite_width / 2 - 200, x + sprite_width / 2 + 200)
			rand_y = irandom_range(y - sprite_height / 2 - 200, y + sprite_height / 2 + 200)
			if (rand_x < 0 || rand_x > room_width) continue;
			if (rand_y < 0 || rand_y > room_height) continue;
			
			var human = instance_create(rand_x, rand_y, Minigame_human);
			if (place_meeting(x, y, human)) 
			{
				instance_destroy(human);
				continue;
			}
			human.depth = 8;
			human_created = true;
			if (human_created) show_debug_message($"Человек создан с {499 - tries} попытки");
			else if (tries < 1) { show_debug_message("Человека не удалось создать!"); break; }
		}
	}
	else timer--;
	
}