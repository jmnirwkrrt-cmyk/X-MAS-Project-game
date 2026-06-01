/// @description  для лазера

if (instance_exists(target_obj) && ready && (index == 9 || index == 11 || index == 12))
{
	if (time_delay_current < time_delay / 2 and alpha < 1) { alpha += 1 / (time_delay / 2) } 
	if (alpha > 0.9 && !effect)
	{
		effect = true;
		for (z = 0; z < distance_to_object(target_obj); z += 10)
		{
			if (side == 2) effect_create_above(ef_spark, x + lengthdir_x(z, direction), y + lengthdir_y(z, direction), 1, c_aqua);
			else effect_create_above(ef_spark, x + lengthdir_x(z, direction), y + lengthdir_y(z, direction), 1, c_purple);
		}
	} 
	if (time_delay_current > time_delay / 2 and alpha > 0) { alpha -= 1 / (time_delay / 2) } 
	
	draw_set_alpha(alpha);
	draw_set_alpha_test(false);
	draw_set_colour(c_aqua);
	if (side == 1) draw_set_colour(c_purple);
	draw_line(x,y, target_obj.x, target_obj.y);
	
	time_delay_current++;
	
	if (time_delay_current > time_delay) { instance_destroy(self); }
}
draw_set_alpha(1);

