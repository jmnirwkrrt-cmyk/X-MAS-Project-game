/// @description Управление

// [FIX] Нормализация угла без присваивания в условии
if (image_angle >= 360) image_angle -= 360;
if (image_angle < 0) image_angle += 360;

if (!ready && indx > 0)
{
	ready = true;

	if (side == 1)
	{
		max_speed = global.planedata[global.planes[indx, 0], 6] / spd_div;
		angl_velocity = global.planedata[global.planes[indx, 0], 8];
		acc = global.planedata[global.planes[indx, 0], 15] / spd_div;
		sup_speed = global.planedata[global.planes[indx, 0], 7] / spd_div;
		target_speed = sup_speed;
		name = global.planes[indx, 15];

		speed = max_speed;

		hp = global.planes[indx, 2];
		max_hp = global.planedata[global.planes[indx, 0], 1];

		w_1 = global.planes[indx, 6];
		w_2 = global.planes[indx, 8];
		w_3 = global.planes[indx, 10];
		d_1 = global.planedata[global.planes[indx, 0], 11];
		a_1 = global.planedata[global.planes[indx, 0], 12];
		can_avoid = global.planedata[global.planes[indx, 0], 9];
		w_1a = global.planes[indx, 7];
		w_2a = global.planes[indx, 9];
		w_3a = global.planes[indx, 11];

		if (w_1 > 0) w_1r = global.airweapon[w_1, 8];
		if (w_2 > 0) w_2r = global.airweapon[w_2, 8];
		if (w_3 > 0) w_3r = global.airweapon[w_3, 8];

		if (w_1 > 0) cooldown_1 = global.airweapon[w_1, 7];
		if (w_2 > 0) cooldown_2 = global.airweapon[w_2, 7];
		if (w_3 > 0) cooldown_3 = global.airweapon[w_3, 7];

		if (global.planes[indx, 0] == 1)
		{
			sprite_index = fighter_1_s;
			sprite_module_index = fighter_1_modules;
			module_hp[4] = global.module_hp;
			module_hp[6] = -1;
			module_hp[5] = -1;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.planes[indx, 0] == 2)
		{
			sprite_index = fighter_2_s;
			sprite_module_index = fighter_2_modules;
			module_hp[4] = global.module_hp;
			module_hp[6] = -1;
			module_hp[5] = -1;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.planes[indx, 0] == 3)
		{
			sprite_index = x_tornado_s;
			sprite_module_index = x_tornado_modules;
			module_hp[4] = -1;
			module_hp[6] = global.module_hp;
			module_hp[5] = global.module_hp;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.planes[indx, 0] == 4)
		{
			sprite_index = fighter_3_s;
			sprite_module_index = fighter_3_modules;
			module_hp[4] = -1;
			module_hp[6] = global.module_hp;
			module_hp[5] = global.module_hp;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.planes[indx, 0] == 5)
		{
			sprite_index = fighter_4_s;
			sprite_module_index = fighter_4_modules;
			turr = instance_create(x, y, XMAS_turret);
			turr.parent = self;
			turr.index = 0;
			turr.ready = true;
			turr.x_pos = 0;
			turr.y_pos = 0;
			module_hp[4] = global.module_hp;
			module_hp[6] = -1;
			module_hp[5] = -1;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.planes[indx, 0] == 6)
		{
			sprite_index = interceptor_s;
			sprite_module_index = interceptor_modules;
			module_hp[4] = -1;
			module_hp[6] = global.module_hp;
			module_hp[5] = global.module_hp;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.planes[indx, 0] == 7)
		{
			sprite_index = transport_1_s;
		}
		if (global.planes[indx, 0] == 8)
		{
			sprite_index = transport_2_s;
			sprite_module_index = transport_2_modules;
			module_hp[4] = -1;
			module_hp[6] = global.module_hp;
			module_hp[5] = global.module_hp;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.planes[indx, 0] == 9)
		{
			sprite_index = transport_3_s;
			sprite_module_index = transport_3_modules;
			module_hp[4] = -1;
			module_hp[6] = global.module_hp;
			module_hp[5] = global.module_hp;
			module_hp[3] = -1;
			module_hp[2] = -1;
			module_hp[1] = global.module_hp;
		}
	}
	else
	{
		max_speed = global.planedata[global.santaplanes[indx, 0], 6] / spd_div;
		angl_velocity = global.planedata[global.santaplanes[indx, 0], 8];
		acc = global.planedata[global.santaplanes[indx, 0], 15] / spd_div;
		sup_speed = global.planedata[global.santaplanes[indx, 0], 7] / spd_div;
		target_speed = sup_speed;
		name = global.santaplanes[indx, 13];

		speed = max_speed;

		hp = global.santaplanes[indx, 1];
		max_hp = global.planedata[global.santaplanes[indx, 0], 1];

		w_1 = global.santaplanes[indx, 5];
		w_2 = global.santaplanes[indx, 7];
		w_3 = global.santaplanes[indx, 9];
		d_1 = global.planedata[global.santaplanes[indx, 0], 11];
		a_1 = global.planedata[global.santaplanes[indx, 0], 12];
		can_avoid = global.planedata[global.santaplanes[indx, 0], 9];
		w_1a = global.santaplanes[indx, 6];
		w_2a = global.santaplanes[indx, 8];
		w_3a = global.santaplanes[indx, 10];

		if (w_1 > 0) w_1r = global.airweapon[w_1, 8];
		if (w_2 > 0) w_2r = global.airweapon[w_2, 8];
		if (w_3 > 0) w_3r = global.airweapon[w_3, 8];

		if (w_1 > 0) cooldown_1 = global.airweapon[w_1, 7];
		if (w_2 > 0) cooldown_2 = global.airweapon[w_2, 7];
		if (w_3 > 0) cooldown_3 = global.airweapon[w_3, 7];

		if (global.santaplanes[indx, 0] == 1)
		{
			sprite_index = fighter_1_s;
			sprite_module_index = fighter_1_modules;
			module_hp[4] = global.module_hp;
			module_hp[6] = -1;
			module_hp[5] = -1;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.santaplanes[indx, 0] == 2)
		{
			sprite_index = fighter_2_s;
			sprite_module_index = fighter_2_modules;
			module_hp[4] = global.module_hp;
			module_hp[6] = -1;
			module_hp[5] = -1;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.santaplanes[indx, 0] == 3)
		{
			sprite_index = x_tornado_s;
			sprite_module_index = x_tornado_modules;
			module_hp[4] = -1;
			module_hp[6] = global.module_hp;
			module_hp[5] = global.module_hp;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.santaplanes[indx, 0] == 4)
		{
			sprite_index = fighter_3_s;
			sprite_module_index = fighter_3_modules;
			module_hp[4] = -1;
			module_hp[6] = global.module_hp;
			module_hp[5] = global.module_hp;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.santaplanes[indx, 0] == 5)
		{
			sprite_index = fighter_4_s;
			sprite_module_index = fighter_4_modules;
			turr = instance_create(x, y, XMAS_turret);
			turr.parent = self;
			turr.index = 0;
			turr.ready = true;
			turr.x_pos = 0;
			turr.y_pos = 0;
			module_hp[4] = global.module_hp;
			module_hp[6] = -1;
			module_hp[5] = -1;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.santaplanes[indx, 0] == 6)
		{
			sprite_index = interceptor_s;
			sprite_module_index = interceptor_modules;
			module_hp[4] = -1;
			module_hp[6] = global.module_hp;
			module_hp[5] = global.module_hp;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.santaplanes[indx, 0] == 7)
		{
			sprite_index = transport_1_s;
		}
		if (global.santaplanes[indx, 0] == 8)
		{
			sprite_index = transport_2_s;
			sprite_module_index = transport_2_modules;
			module_hp[4] = -1;
			module_hp[6] = global.module_hp;
			module_hp[5] = global.module_hp;
			module_hp[3] = global.module_hp;
			module_hp[2] = global.module_hp;
			module_hp[1] = global.module_hp;
		}
		if (global.santaplanes[indx, 0] == 9)
		{
			sprite_index = transport_3_s;
			sprite_module_index = transport_3_modules;
			module_hp[4] = -1;
			module_hp[6] = global.module_hp;
			module_hp[5] = global.module_hp;
			module_hp[3] = -1;
			module_hp[2] = -1;
			module_hp[1] = global.module_hp;
		}
	}
}

if (side == 1 && global.planes[indx, 0] == 5 && instance_exists(turr))
{
	if (beam_aause) turr.AAD = true;
	else turr.AAD = false;

	if (beam_aruse) turr.AMD = true;
	else turr.AMD = false;
}

if (module_hp[1] == 0)
{
	module_hp[1] = -2;
	plane_commander.messages[0, 0]++;
	plane_commander.messages[plane_commander.messages[0, 0], 0] = global.messages_life_time;
	plane_commander.messages[plane_commander.messages[0, 0], 1] = string_insert(name, global.txt224, 1);
	can_avoid = 0;
}
if (module_hp[2] == 0)
{
	module_hp[2] = -2;
	plane_commander.messages[0, 0]++;
	plane_commander.messages[plane_commander.messages[0, 0], 0] = global.messages_life_time;
	plane_commander.messages[plane_commander.messages[0, 0], 1] = string_insert(name, global.txt226, 1);
	can_avoid = 0;
	if (angl_velocity > 1) angl_velocity -= 1;
}
if (module_hp[3] == 0)
{
	module_hp[3] = -2;
	plane_commander.messages[0, 0]++;
	plane_commander.messages[plane_commander.messages[0, 0], 0] = global.messages_life_time;
	plane_commander.messages[plane_commander.messages[0, 0], 1] = string_insert(name, global.txt225, 1);
	can_avoid = 0;
	if (angl_velocity > 1) angl_velocity -= 1;
}
if (module_hp[4] == 0)
{
	module_hp[4] = -2;
	task = "destroyed";
	roll = 0;
	
	plane_commander.messages[0, 0]++;
	plane_commander.messages[plane_commander.messages[0, 0], 0] = global.messages_life_time;
	plane_commander.messages[plane_commander.messages[0, 0], 1] = string_insert(name, global.txt223, 1);
	plane_commander.messages[0, 0]++;
	plane_commander.messages[plane_commander.messages[0, 0], 0] = global.messages_life_time;
	plane_commander.messages[plane_commander.messages[0, 0], 1] = string_insert(name, global.txt227, 1);
}
if (module_hp[5] == 0)
{
	module_hp[5] = -2;
	plane_commander.messages[0, 0]++;
	plane_commander.messages[plane_commander.messages[0, 0], 0] = global.messages_life_time;
	plane_commander.messages[plane_commander.messages[0, 0], 1] = string_insert(name, global.txt222, 1);
	max_speed /= 2;
	if (module_hp[6] == -2)
	{
		task = "destroyed";
		roll = 0;
		plane_commander.messages[0, 0]++;
		plane_commander.messages[plane_commander.messages[0, 0], 0] = global.messages_life_time;
		plane_commander.messages[plane_commander.messages[0, 0], 1] = string_insert(name, global.txt227, 1);
	}
}
if (module_hp[6] == 0)
{
	module_hp[6] = -2;
	plane_commander.messages[0, 0]++;
	plane_commander.messages[plane_commander.messages[0, 0], 0] = global.messages_life_time;
	plane_commander.messages[plane_commander.messages[0, 0], 1] = string_insert(name, global.txt221, 1);
	max_speed /= 2;
	if (module_hp[5] == -2)
	{
		task = "destroyed";
		roll = 0;
		plane_commander.messages[0, 0]++;
		plane_commander.messages[plane_commander.messages[0, 0], 0] = global.messages_life_time;
		plane_commander.messages[plane_commander.messages[0, 0], 1] = string_insert(name, global.txt227, 1);
	}
}

if (task == "attack" && instance_exists(enemy_target_indx))
{
	if (enemy_target_indx.task == "destroyed")
	{
		enemy_target_indx = noone;
	}
}

if (side == 3)
{
	selected = false;

	// [FIX] Для ИИ-союзника ориентируемся на боезапас, а не только на наличие слотов
	if (w_1a < 1 && w_2a < 1 && w_3a < 1 && task != "destroyed")
	{
		task = "return";
	}
	else if (task != "destroyed" && (enemy_target_indx == noone || !instance_exists(enemy_target_indx)) && instance_exists(EGG_Plane))
	{
		if (guidance_type == 0)
		{
			enemy_target_indx = instance_nearest(x, y, EGG_Plane);
			task = "attack";
		}
		if (guidance_type == 1)
		{
			enemy_target_indx = instance_find(EGG_Plane, real(irandom_range(0, instance_number(EGG_Plane) - 1)));
			task = "attack";
		}
	}
}

if (selected)
{
	if (keyboard_check_released(ord("R")) && can_avoid == 1 && roll_cooldown < 1)
	{
		task = "avoid";
		roll_cooldown = global.roll_cooldown; // [FIX]
	}

	if (mouse_check_button_released(mb_right))
	{
		move_target_x = mouse_x;
		move_target_y = mouse_y;
		selected = false;
		task = "move";

		if (instance_exists(EGG_Plane) && (w_1a > 0 || w_2a > 0 || w_3a > 0))
		{
			var inst = instance_nearest(mouse_x, mouse_y, EGG_Plane);
			if (point_distance(mouse_x, mouse_y, inst.x, inst.y) < 20)
			{
				enemy_target_indx = inst;
				task = "attack";
			}
		}
	}
}

if (instance_exists(plane_shell))
{
	shell_nearest = instance_nearest(x, y, plane_shell);
}

// [FIX] Не запускаем уклонение поверх уже идущего уклонения, и не используем тухлую ссылку shell_nearest
if (
	task != "destroyed"
	&& task != "returned"
	&& task != "avoid"
	&& can_avoid == 1
	&& instance_exists(plane_shell)
	&& instance_exists(shell_nearest)
	&& roll_cooldown < 1
	&& distance_to_object(shell_nearest) < 180
	&& shell_nearest.index != 9
	&& shell_nearest.index != 11
	&& shell_nearest.side == 2
)
{
	task = "avoid";
	roll_cooldown = global.roll_cooldown;
	roll = 0;
}

if (hp < 1 && task != "destroyed")
{
	task = "destroyed";
	roll = 0;
}

if (task == "returned" || task == "destroyed")
{
	selected = false;
}

if (task != "destroyed" && task != "returned")
{
	speed += acc;
	if (speed > target_speed) speed = target_speed;
	if (speed < max_speed / 5) speed = max_speed / 5;
	direction = image_angle + 90;

	roll_cooldown--;
	cooldown_1--;
	cooldown_2--;
	cooldown_3--;
}

if (plane_commander.pause)
{
}
else if (task == "avoid")
{
	// [FIX] Уклонение с гарантированным выходом из состояния
	if (roll == 0)
	{
		roll = 1;
		evade_side = choose(-1, 1);
		evade_force = random_range(target_speed * 0.6, target_speed);

		if (image_index <= 0) image_index = 1;
		image_speed = 1;
	}

	if (roll == 1)
	{
		var side_dir = direction + evade_side * 90;
		motion_add(side_dir, evade_force);

		if (image_index >= image_number - 1)
		{
			roll = 2;
			image_speed = -1;
		}
	}

	if (roll == 2)
	{
		if (image_index <= 1)
		{
			image_index = 0;
			image_speed = 0;
			roll = 0;

			if (instance_exists(enemy_target_indx))
				task = "attack";
			else if (move_target_x != 0 || move_target_y != 0)
				task = "move";
			else
				task = "patrol";
		}
	}
}
else if (task == "return")
{
	if (!instance_exists(EGG_Plane) || distance_to_object(instance_nearest(x, y, EGG_Plane)) > global.return_range)
	{
		ready_to_return = true;
		task = "returned";
	}
	else
	{
		var inst = instance_nearest(x, y, EGG_Plane);
		if (x < inst.x) move_target_x = x - global.return_range;
		else move_target_x = x + global.return_range;
		if (y < inst.y) move_target_y = y - global.return_range;
		else move_target_y = y + global.return_range;
		ready_to_return = false;
		dir = point_direction(x, y, move_target_x, move_target_y) - 90;
	}
}
else if (task == "patrol")
{
	image_angle += angl_velocity;
	speed -= angl_velocity / spd_div;

	if (image_index != 5)
	{
		image_speed = 0.5;
	}
	else image_speed = 0;
}
else if (task == "attack")
{
	if (!instance_exists(enemy_target_indx))
	{
		task = "patrol";
	}
	else
	{
		dir = point_direction(x, y, enemy_target_indx.x, enemy_target_indx.y) - 90;

		if (angle_difference(image_angle, dir) <= 2 && angle_difference(image_angle, dir) >= -2)
		{
			if (w_1 > 0 && w_1use && cooldown_1 < 0 && w_1a > 0 && w_1r > distance_to_object(enemy_target_indx) && distance_to_object(enemy_target_indx) > global.airweapon[w_1, 13])
			{
				w_1a--;
				cooldown_1 = global.airweapon[w_1, 7];
				var x_dev = random_range(-20, 20);
				var y_dev = random_range(-20, 20);
				var shell = instance_create(x + x_dev, y + y_dev, plane_shell);
				if (global.airweapon[w_1, 11] == 1) shell.guide = true;
				shell.index = w_1;
				shell.direction = direction;
				shell.target_obj = enemy_target_indx;
				shell.side = 1;
				shell.speed = speed;
				target_x = enemy_target_indx.x;
				target_y = enemy_target_indx.y;
			}
			if (w_2 > 0 && w_2use && cooldown_2 < 0 && w_2a > 0 && w_2r > distance_to_object(enemy_target_indx) && distance_to_object(enemy_target_indx) > global.airweapon[w_2, 13])
			{
				w_2a--;
				cooldown_2 = global.airweapon[w_2, 7];
				var x_dev = random_range(-20, 20);
				var y_dev = random_range(-20, 20);
				var shell = instance_create(x + x_dev, y + y_dev, plane_shell);
				if (global.airweapon[w_2, 11] == 1) shell.guide = true;
				shell.index = w_2;
				shell.direction = direction;
				shell.target_obj = enemy_target_indx;
				shell.side = 1;
				shell.speed = speed;
				target_x = enemy_target_indx.x;
				target_y = enemy_target_indx.y;
			}
			if (w_3 > 0 && w_3use && cooldown_3 < 0 && w_3a > 0 && w_3r > distance_to_object(enemy_target_indx) && distance_to_object(enemy_target_indx) > global.airweapon[w_3, 13])
			{
				w_3a--;
				cooldown_3 = global.airweapon[w_3, 7];
				var x_dev = random_range(-20, 20);
				var y_dev = random_range(-20, 20);
				var shell = instance_create(x + x_dev, y + y_dev, plane_shell);
				if (global.airweapon[w_3, 11] == 1) shell.guide = true;
				shell.index = w_3;
				shell.direction = direction;
				shell.target_obj = enemy_target_indx;
				shell.side = 1;
				shell.speed = speed;
				target_x = enemy_target_indx.x;
				target_y = enemy_target_indx.y;
			}
		}
	}
}

if (task == "move" || task == "attack" || task == "return")
{
	if (task == "move") dir = point_direction(x, y, move_target_x, move_target_y) - 90;

	var diff = angle_difference(image_angle, dir - 180);
	var turn = clamp(diff, -angl_velocity, angl_velocity);
	image_angle += turn;

	if ((image_angle < dir - 2 || image_angle - 90 > dir - 2) && diff > 1)
	{
		if (image_index < 5) image_speed = 0.5;
		else if (image_index > 5) image_speed = -0.5;
		else image_speed = 0;
	}
	else if (image_angle > dir + 2 || image_angle + 90 < dir + 2)
	{
		if (image_index < 15) image_speed = 0.5;
		else if (image_index > 15) image_speed = -0.5;
		else image_speed = 0;
	}
	else
	{
		if (image_index == 0) image_speed = 0;
		else if (image_index < 10) image_speed = -0.5;
		else if (image_index > 10) image_speed = 0.5;
	}

	// [FIX] Только move имеет право сбрасываться по достижению move_target
	if (task == "move" && point_distance(x, y, move_target_x, move_target_y) < 10)
	{
		task = "patrol";
		move_target_x = 0;
		move_target_y = 0;
	}
}
else if (task != "attack" && task != "avoid" && task != "destroyed" && task != "returned" && !plane_commander.pause)
{
	task = "patrol";
}

// [FIX] Здесь нужен индекс типа самолёта, а не индекс экземпляра
if (
	(side == 1 && global.planes[indx, 0] == 7)
	|| (side != 1 && global.santaplanes[indx, 0] == 7)
)
{
	if (image_index == image_number - 1) image_index = 0;
	image_index++;
}

// [FIX] Запись назад в правильный массив и в конце шага
if (side == 1)
{
	global.planes[indx, 2] = hp;
	global.planes[indx, 7] = w_1a;
	global.planes[indx, 9] = w_2a;
	global.planes[indx, 11] = w_3a;
}
else
{
	global.santaplanes[indx, 1] = hp;
	global.santaplanes[indx, 6] = w_1a;
	global.santaplanes[indx, 8] = w_2a;
	global.santaplanes[indx, 10] = w_3a;
}