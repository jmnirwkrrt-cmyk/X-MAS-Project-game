/// @description Управление

// [FIX] Нормализация угла без присваивания
if (image_angle >= 360) image_angle -= 360;
if (image_angle < 0) image_angle += 360;

if (!ready && indx > 0)
{
	ready = true;

	max_speed = global.eggplanedata[global.eggplanes[indx, 0], 6] / spd_div;
	angl_velocity = global.eggplanedata[global.eggplanes[indx, 0], 8];
	acc = global.eggplanedata[global.eggplanes[indx, 0], 15] / spd_div;
	sup_speed = global.eggplanedata[global.eggplanes[indx, 0], 7] / spd_div;
	target_speed = sup_speed;

	speed = max_speed;

	hp = global.eggplanes[indx, 1] * global.current_diff_mn;
	max_hp = global.eggplanedata[global.eggplanes[indx, 0], 1] * global.current_diff_mn;

	w_1 = global.eggplanes[indx, 5];
	w_2 = global.eggplanes[indx, 7];
	w_3 = global.eggplanes[indx, 9];
	d_1 = global.eggplanedata[global.eggplanes[indx, 0], 11];
	a_1 = global.eggplanedata[global.eggplanes[indx, 0], 12];
	can_avoid = global.eggplanedata[global.eggplanes[indx, 0], 9];
	w_1a = global.eggplanes[indx, 6];
	w_2a = global.eggplanes[indx, 8];
	w_3a = global.eggplanes[indx, 10];

	if (w_1 > 0) w_1r = global.airweapon[w_1, 8];
	if (w_2 > 0) w_2r = global.airweapon[w_2, 8];
	if (w_3 > 0) w_3r = global.airweapon[w_3, 8];

	if (w_1 > 0) cooldown_1 = global.airweapon[w_1, 7];
	if (w_2 > 0) cooldown_2 = global.airweapon[w_2, 7];
	if (w_3 > 0) cooldown_3 = global.airweapon[w_3, 7];

	if (global.eggplanes[indx, 0] == 1)
	{
		sprite_index = fighter1_s;
	}
	if (global.eggplanes[indx, 0] == 2)
	{
		sprite_index = fighter2_s;
	}
	if (global.eggplanes[indx, 0] == 3)
	{
		sprite_index = fighter3_s;
		
		if (global.current_diff_mn != global.light_diff_mn)
		{
			turr = instance_create(x, y, EGG_turret);
			turr.parent = self;
			turr.index = 1;
			turr.ready = true;
			turr.x_pos = 0;
			turr.y_pos = 0;
		}
	}
	if (global.eggplanes[indx, 0] == 4)
	{
		sprite_index = bomber_s;
		
		if (global.current_diff_mn != global.light_diff_mn)
		{
			turr = instance_create(x, y, EGG_turret);
			turr.parent = self;
			turr.index = 0;
			turr.ready = true;
			turr.x_pos = 8;
			turr.y_pos = -19;
			
			turr = instance_create(x, y, EGG_turret);
			turr.parent = self;
			turr.index = 0;
			turr.ready = true;
			turr.x_pos = 8;
			turr.y_pos = 19;
		}
	}
	if (global.eggplanes[indx, 0] == 5)
	{
		sprite_index = cas_s;
	}
	if (global.eggplanes[indx, 0] == 6)
	{
		sprite_index = transport_s;
		
		if (global.current_diff_mn != global.light_diff_mn)
		{
			turr = instance_create(x, y, EGG_turret);
			turr.parent = self;
			turr.index = 2;
			turr.ready = true;
			turr.x_pos = -98 + 8;
			turr.y_pos = -28;
			
			turr = instance_create(x, y, EGG_turret);
			turr.parent = self;
			turr.index = 2;
			turr.ready = true;
			turr.x_pos = 47 - 8;
			turr.y_pos = -28;
			
			turr = instance_create(x, y, EGG_turret);
			turr.parent = self;
			turr.index = 2;
			turr.ready = true;
			turr.x_pos = -98 + 8;
			turr.y_pos = 28;
			
			turr = instance_create(x, y, EGG_turret);
			turr.parent = self;
			turr.index = 2;
			turr.ready = true;
			turr.x_pos = 47 - 8;
			turr.y_pos = 28;
		}
	}
	if (global.eggplanes[indx, 0] == 7)
	{
		sprite_index = cv_s;

		turr = instance_create(x, y, EGG_turret);
		turr.parent = self;
		turr.index = 3;
		turr.ready = true;
		turr.x_pos = 26;
		turr.y_pos = -51;

		turr = instance_create(x, y, EGG_turret);
		turr.parent = self;
		turr.index = 3;
		turr.ready = true;
		turr.x_pos = 59;
		turr.y_pos = -51;

		turr = instance_create(x, y, EGG_turret);
		turr.parent = self;
		turr.index = 3;
		turr.ready = true;
		turr.x_pos = 26;
		turr.y_pos = 51;

		turr = instance_create(x, y, EGG_turret);
		turr.parent = self;
		turr.index = 3;
		turr.ready = true;
		turr.x_pos = 59;
		turr.y_pos = 51;
	}
}

if (module_hp[4] == 0)
{
	module_hp[4] = -2;
	max_speed /= 2;
	have_damaged_modules = true;
}
if (module_hp[2] == 0)
{
	module_hp[2] = -2;
	if (angl_velocity > 1) angl_velocity -= 1;
	can_avoid = false;
	have_damaged_modules = true;
}
if (module_hp[3] == 0)
{
	module_hp[3] = -2;
	if (angl_velocity > 1) angl_velocity -= 1;
	can_avoid = false;
	have_damaged_modules = true;
}

if (hp < 1 && task != "destroyed")
{
	hp = 0;
	task = "destroyed";
	roll = 0;
	roll_cooldown = 1;
}
// [FIX] Если БК кончился, ИИ реально уходит на возврат
else if (w_1a < 1 && w_2a < 1 && w_3a < 1 && task != "destroyed")
{
	task = "return";
}
else if (task != "destroyed" && (enemy_target_indx == noone || !instance_exists(enemy_target_indx)) && instance_exists(XMAS_Plane))
{
	if (guidance_type == 0)
	{
		enemy_target_indx = instance_nearest(x, y, XMAS_Plane);
		task = "attack";
	}
	if (guidance_type == 1)
	{
		enemy_target_indx = instance_find(XMAS_Plane, real(irandom_range(0, instance_number(XMAS_Plane) - 1)));
		task = "attack";
	}
}

if (task == "attack" && instance_exists(enemy_target_indx))
{
	if (enemy_target_indx.task == "destroyed")
	{
		enemy_target_indx = noone;
	}
}

if (instance_exists(plane_shell))
{
	shell_nearest = instance_nearest(x, y, plane_shell);
}

// [FIX] Не стартуем avoid повторно и не используем тухлую ссылку
if (
	task != "destroyed"
	&& task != "returned"
	&& task != "avoid"
	&& can_avoid == 1
	&& instance_exists(plane_shell)
	&& instance_exists(shell_nearest)
	&& roll_cooldown < 1
	&& distance_to_object(shell_nearest) < 150
	&& shell_nearest.index != 9
	&& shell_nearest.index != 11
	&& shell_nearest.side != 2
)
{
	task = "avoid";
	roll_cooldown = global.roll_cooldown;
	roll = 0;
}

if (task != "destroyed" && task != "returned")
{
	speed += acc;
	if (speed > target_speed) speed = target_speed;
	if (speed < max_speed / 5) speed = max_speed / 5;
	direction = image_angle + 90;

	if (task != "avoid") roll_cooldown--;
	cooldown_1--;
	cooldown_2--;
	cooldown_3--;
}

if (plane_commander.pause)
{
}
else if (task == "avoid")
{
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
		
		if (alarm_get(0) < 1) alarm_set(0, 30);
        if (image_index >= image_number - 1 || alarm_get(0) == 1)
        {
            roll = 2;
            image_speed = -1;
        }
    }

    if (roll == 2)
    {
		if (alarm_get(0) < 1) alarm_set(0, 30);
        if (image_index <= 1 || alarm_get(0) == 1)
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
	if (!instance_exists(XMAS_Plane) || distance_to_object(instance_nearest(x, y, XMAS_Plane)) > global.return_range)
	{
		ready_to_return = true;
		task = "returned";
		roll = 0;
		roll_cooldown = 1;
	}
	else
	{
		var inst = instance_nearest(x, y, XMAS_Plane);
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
			if (w_1 > 0 && cooldown_1 < 0 && w_1a > 0 && w_1r > distance_to_object(enemy_target_indx))
			{
				w_1a--;
				cooldown_1 = global.airweapon[w_1, 7];
				var x_dev = random_range(-20, 20);
				var y_dev = random_range(-20, 20);
				var shell = instance_create(x + x_dev, y + y_dev, plane_shell);
				if (w_1 != 1 && w_1 != 8) shell.guide = true;
				shell.index = w_1;
				shell.direction = direction;
				shell.target_obj = enemy_target_indx;
				shell.side = 2;
				shell.speed = speed;
				target_x = enemy_target_indx.x;
				target_y = enemy_target_indx.y;
			}
			if (w_2 > 0 && cooldown_2 < 0 && w_2a > 0 && w_2r > distance_to_object(enemy_target_indx))
			{
				w_2a--;
				cooldown_2 = global.airweapon[w_2, 7];
				var x_dev = random_range(-20, 20);
				var y_dev = random_range(-20, 20);
				var shell = instance_create(x + x_dev, y + y_dev, plane_shell);
				if (w_2 != 1 && w_2 != 8) shell.guide = true;
				shell.index = w_2;
				shell.direction = direction;
				shell.target_obj = enemy_target_indx;
				shell.side = 2;
				shell.speed = speed;
				target_x = enemy_target_indx.x;
				target_y = enemy_target_indx.y;
			}
			if (w_3 > 0 && cooldown_3 < 0 && w_3a > 0 && w_3r > distance_to_object(enemy_target_indx))
			{
				w_3a--;
				cooldown_3 = global.airweapon[w_3, 7];
				var x_dev = random_range(-20, 20);
				var y_dev = random_range(-20, 20);
				var shell = instance_create(x + x_dev, y + y_dev, plane_shell);
				if (w_3 != 1 && w_3 != 8) shell.guide = true;
				shell.index = w_3;
				shell.direction = direction;
				shell.target_obj = enemy_target_indx;
				shell.side = 2;
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

	// [FIX] Достижение move_target проверяем только в move
	if (task == "move" && point_distance(x, y, move_target_x, move_target_y) < 10)
	{
		task = "patrol";
		move_target_x = 0;
		move_target_y = 0;
	}
}
else if (task != "attack" && task != "avoid" && task != "destroyed" && task != "return" && task != "returned" && !plane_commander.pause)
{
	task = "patrol";
}

// [FIX] Здесь нужен тип самолёта, а не индекс экземпляра
if (global.eggplanes[indx, 0] == 7)
{
	if (image_index == image_number - 1) image_index = 0;
	image_index++;
}

// [FIX] Запись назад в массив в конце шага
global.eggplanes[indx, 1] = hp;
global.eggplanes[indx, 6] = w_1a;
global.eggplanes[indx, 8] = w_2a;
global.eggplanes[indx, 10] = w_3a;