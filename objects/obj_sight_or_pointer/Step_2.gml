//depth=room_height - y;


if (type == 1) // Стрельба
{
	image_blend = c_white;
	x = device_mouse_x(0);
	y = device_mouse_y(0);
	z = floor_z;
	sprite_index = attack_icon;
		
	var hit = gm3d_mouse_surface();

	if (is_array(hit)) {
	    x = hit[0];
	    y = -hit[1];
	    z = hit[2];
		//show_debug_message($"Каст {x} {y} {z}");
	    floor_z = z;
	}
	else show_debug_message("Каст не используется");
	if (mouse_check_button_released(mb_right) || keyboard_check_released(vk_escape))
	{
		instance_destroy(self);
	}
	
}

if (type == 2) // Высадка игрока\союзников
{
	image_blend = c_white;
	x = device_mouse_x(0);
	y = device_mouse_y(0);
	z = floor_z;
	sprite_index = deploy_icon;
	
	var hit = gm3d_mouse_surface();

	if (is_array(hit)) {
	    x = hit[0];
	    y = -hit[1];
	    z = hit[2];
	
	    floor_z = z;
	}
	else show_debug_message("Каст не используется");
	
	var can_be_deployed = true;
	if (instance_exists(landed_transport))
	{
		var transport = instance_nearest(x, y, landed_transport);
		if (transport.image_index != 3 && point_distance_3d(x, y, z, transport.x, transport.y, transport.z) < 100) can_be_deployed = true;
		else can_be_deployed = false;
	}
	if (!can_be_deployed) image_blend = c_maroon;
	
	if (mouse_check_button_pressed(mb_left) && can_be_deployed)
	{
		var unit = noone;
		instance_activate_object(oPlayer3D);
		if (!instance_exists(oPlayer3D))
		{
			instance_deactivate_object(oPlayer3D);
			unit = instance_create(x, y, oPlayer3D);
			
		}
		else
		{
			instance_deactivate_object(oPlayer3D);
			unit = instance_create(x, y, ally_obj_3D);
		}
		
		unit.z = z + 60;
		unit.jump = 3;
		
		unit.massive_index = index;
		global.team[index, 4] = -1;
		if (global.team[index, 2] = "tails") unit.hero_numb = 1;
		if (global.team[index, 2] = "amy") unit.hero_numb = 2;
		if (global.team[index, 2] = "sonic") unit.hero_numb = 3;
		if (global.team[index, 2] = "knuckles") unit.hero_numb = 4;
		if (global.team[index, 2] = "rouge") unit.hero_numb = 5;
		if (global.team[index, 2] = "shadow") unit.hero_numb = 6;
		if (global.team[index, 2] = "silver") unit.hero_numb = 7;
		if (global.team[index, 2] = "snowman") unit.hero_numb = 8;
		if (global.team[index, 2] = "snowman" and global.team[index, 3] = "ak") unit.hero_numb = 9;
		if (global.team[index, 2] = "snowman" and global.team[index, 3] = "rifle") unit.hero_numb = 10;
		if (global.team[index, 2] = "snowman" and global.team[index, 3] = "laser") unit.hero_numb = 11;
		
		instance_destroy(tabletop_3D);
		oArena3D.drop_pause = true;
		instance_destroy(self);
	}
	if (mouse_check_button_released(mb_right) || keyboard_check_released(vk_escape))
	{
		instance_destroy(tabletop_3D);
		if (!keyboard_check_released(vk_escape)) instance_create(x, y, menu_small_3D);
		instance_destroy(self);
	}
}

if (type == 3) // Бросок гранаты
{
	image_blend = c_white;
	x = device_mouse_x(0);
	y = device_mouse_y(0);
	z = floor_z;
	sprite_index = attack_icon;
	
	var hit = gm3d_mouse_surface();

	if (is_array(hit)) {
	    x = hit[0];
	    y = -hit[1];
	    z = hit[2];
	
	    floor_z = z;
	}
	else show_debug_message("Каст не используется");
	if (mouse_check_button_released(mb_right) || keyboard_check_released(vk_escape))
	{
		instance_destroy(self);
	}
}

if (type == 4) // Суперспособность
{
	image_blend = c_white;
	x = device_mouse_x(0);
	y = device_mouse_y(0);
	z = floor_z;
	sprite_index = superpower_icon;
	
	var hit = gm3d_mouse_surface();

	if (is_array(hit)) {
	    x = hit[0];
	    y = -hit[1];
	    z = hit[2];
	
	    floor_z = z;
	}
	else show_debug_message("Каст не используется");
	if (mouse_check_button_released(mb_right) || keyboard_check_released(vk_escape))
	{
		instance_destroy(self);
	}
}

var cas = gm3d_clamp_to_arena(x, y, 1);
x = cas[0];
y = cas[1];