if (Minigame_commander.is_game_winned == 0 && instance_exists(Minigame_player))
{
	var player = instance_nearest(x, y, Minigame_player);
	if (speed < max_speed) speed += 0.1;
	direction = point_direction(x, y, player.x, player.y);
	image_angle = direction - 90.5;
}
else
{
	speed = 0;	
}

scr_bounce_speed_direction(Minigame_house, 1, 0.9);