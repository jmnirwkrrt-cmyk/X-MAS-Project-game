spawn_x = 0;
spawn_y = 0;
is_made_sound = false;
is_sound_reloaded = true;
minigame_score = 0;
outline = true;
outline_color = c_black;
outline_thickness = 1;
tries = 3;
is_game_winned = 0;
w = 900;
sound_timer = 00;

var tree_count = irandom_range(0, 50);
var house_count = 5;
var max_errors = 500;
var errors = 0;
var space = 100;
var min_distance = 600;

for (var i = 0; i < room_width && errors < max_errors; i += 200)
{
	for (var i1 = 0; i1 < room_height; i1 += 200)
	{
		var ground = instance_create(i + 100, i1 + 100, Minigame_ground);
		ground.image_index = choose(0, 0, 0, 1);
		ground.depth = 10;
		ground.image_angle = choose(0, 90, 180, 270);
	}
}

for (var i = tree_count; i > 0 && errors < max_errors; i--)
{
	var rand_x = irandom_range(space, room_width - space);
	var rand_y = irandom_range(space, room_height - space);
	
	var tree = instance_create(rand_x + 100, rand_y + 100, Minigame_tree);
	tree.image_index = choose(0, 1);
	tree.depth = 7;
	tree.image_angle = choose(0, 90, 180, 270);
}

for (var i = house_count; i > 0 && errors < max_errors; i--)
{
	var rand_x = irandom_range(space, room_width - space);
	var rand_y = irandom_range(space, room_height - space);
	
	if (instance_exists(Minigame_tree))
	{
		var nearest_tree = instance_nearest(rand_x, rand_y, Minigame_tree);
		if (point_distance(rand_x, rand_y, nearest_tree.x, nearest_tree.y) < min_distance)
		{
			errors++;
			i++;
			show_debug_message("Дом отбракован: дерево");
			continue;
		}
	}
	if (instance_exists(Minigame_house))
	{
		var nearest_house = instance_nearest(rand_x, rand_y, Minigame_house);
		if (point_distance(rand_x, rand_y, nearest_house.x, nearest_house.y) < min_distance)
		{
			errors++;
			i++;
			show_debug_message("Дом отбракован: дом");
			continue;
		}
	}
	
	var house = instance_create(rand_x, rand_y, Minigame_house);
	house.depth = 9;
}

for (; errors < max_errors; )
{
	var rand_x = irandom_range(space, room_width - space);
	var rand_y = irandom_range(space, room_height - space);
	
	if (instance_exists(Minigame_house))
	{
		var nearest_house = instance_nearest(rand_x, rand_y, Minigame_house);
		if (point_distance(rand_x, rand_y, nearest_house.x, nearest_house.y) < min_distance)
		{
			show_debug_message($"Спавн отбракован {rand_x}:{rand_y} из-за дома на расстоянии {point_distance(rand_x, rand_y, nearest_house.x, nearest_house.y)}");
			errors++;
			continue;
		}
	}
	
	var player = instance_create(rand_x, rand_y, Minigame_player);
	player.depth = 8;
	spawn_x = rand_x;
	spawn_y = rand_y;
	break;
}

if (errors >= max_errors) { show_debug_message("Комната пересоздана: генерация признана провальной"); room_restart(); exit; }