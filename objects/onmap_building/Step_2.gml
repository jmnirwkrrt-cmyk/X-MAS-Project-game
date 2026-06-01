if (instance_exists(map_obj))
{
	image_xscale = map_obj.image_xscale - basic_size;
	image_yscale = map_obj.image_yscale - basic_size;
	if (base_x > map_obj.basic_x) new_x = base_x + (base_x - 450) * (map_obj.image_xscale - 1);
	if (base_x < map_obj.basic_x) new_x = base_x - (450 - base_x) * (map_obj.image_xscale - 1);
	if (base_y > map_obj.basic_y) new_y = base_y + (base_y - 450) * (map_obj.image_yscale - 1);
	if (base_y < map_obj.basic_y) new_y = base_y - (450 - base_y) * (map_obj.image_yscale - 1);
	
	
	x = new_x + (map_obj.x - map_obj.basic_x);
	y = new_y + (map_obj.y - map_obj.basic_y);
	if (instance_exists(text))
	{
		if (image_xscale < 1.3) text.txt = "";
		text.x = x;
		text.y = y;
		if (instance_exists(ask_parent)) text.image_alpha = 1;
		else text.image_alpha = 0;
	}
}

