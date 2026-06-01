var mouse_dist = point_distance(x, y, mouse_x, mouse_y);
var mouse_dir = point_direction(x, y, mouse_x, mouse_y);

image_angle = mouse_dir - 90.5;
if (mouse_dist < 150) speed = max_speed * mouse_dist / 150;
else speed = max_speed;
direction = mouse_dir;

x = min(room_width, max(0, x));
y = min(room_height, max(0, y));

if (Minigame_commander.is_game_winned != 0) speed = 0;
else
{
	
	
	if (Minigame_commander.is_sound_reloaded && keyboard_check_released(ord("Q")))
	{
		Minigame_commander.is_made_sound = true;
	}
	
	if (invisiblity)
	{
		scr_bounce_speed_direction(Minigame_human, 1, 0.9);
		if (inv_timer < 1)
		{
			invisiblity = false;
			image_alpha = 1;
		}
		else
		{
			if (image_alpha == 1) image_alpha = 0;
			else image_alpha = 1;
			inv_timer--;
		}
	}
	if (!sound_isplaying(Bethoven)) { sound_play(Bethoven); sound_volume(Bethoven, 0); }
	if (instance_exists(Minigame_human))
	{
		var human = instance_nearest(x, y, Minigame_human);
		if (distance_to_object(human) < 500) 
		{
			sound_volume(Bethoven, global.musicvolume * min(1, (50 / distance_to_object(human))));	
		}
		else sound_volume(Bethoven, 0)
		
	}
	
	if (Minigame_commander.minigame_score > 24999) { Minigame_commander.is_game_winned = 1; }
	scr_bounce_speed_direction(Minigame_house, 1, 0.9);
}