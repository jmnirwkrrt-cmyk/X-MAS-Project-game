if (team_is_enemy && sprite_index != turret_land_egg)
{
	spr_turret = turret_land_egg;
	sprite_index = spr_turret;	
	fire_cooldown = 0;
	fire_cooldown_max = fire_cooldown_egg;
	range = 900;
}
else
if (!team_is_enemy && sprite_index != turret_land_xmas)
{
	spr_turret = turret_land_xmas;
	sprite_index = spr_turret;
	fire_cooldown = 0;
	fire_cooldown_max = fire_cooldown_xmas;
	range = 700;
}

if (energy < max_energy) energy += 0.5;
else energy = max_energy;

// --- смерть ---
if (!dying && hp <= 0) {
    dying = true;
    fire_active = false;
    death_frame = 0;
}

if (dying) {
	image_speed = 0;
	if (image_index < TUR_DEATH_START)
	{
		image_index += TUR_FRAMES_PER_DIR;
		if (image_index > TUR_DEATH_START) { image_index = TUR_DEATH_START; death_frame = 0; }
		exit;
	}
	else
	{
		image_index = TUR_DEATH_START + death_frame;
		death_frame += 1;
		if (death_frame >= TUR_DEATH_LEN) instance_destroy();
		exit;
	}
}

// --- оглушение ---
if (stunned)
{
    image_speed = 0;

    fire_active = false;
    fire_frame = 0;
    fire_shot_done = false;

    // Первый кадр death-секции используем как "вырубленное" состояние.
    // Если death-анимация не подходит визуально, потом лучше добавить отдельный stun-frame.
    image_index = TUR_DEATH_START;
	if (stun_cooldown > 0 && image_index < image_number - 1) image_index++;
	if (stun_cooldown == -2)
	{
		if (image_index > TUR_DEATH_START) image_index--;
		else
		{
			stun_cooldown = -1;
			stunned = false;
			image_index = aim_idx * TUR_FRAMES_PER_DIR;
		}
	}
	
	if (stun_cooldown > 0) stun_cooldown -= 1;
    if (stun_cooldown == -1)
    {
        stun_cooldown = stun_cooldown_max;
    }

    if (stun_cooldown == 0)
    {
        stun_cooldown = -2;

        // Возврат в обычный idle текущего угла.
        image_index = aim_idx * TUR_FRAMES_PER_DIR;
    }

    exit;
}

// --- обновляем floor_z (если турель может стоять на столбе) ---
floor_z = gm3d_get_pillar_height_at(x, y);
z = floor_z;

// --- цель ---
if (!instance_exists(target_id)) target_id = noone;

if (target_id == noone || point_distance_3d(x, y, z, target_id.x, target_id.y, target_id.z) > range) {
    target_id = turret_find_target(team_is_enemy, range);
}

// --- если цели нет — просто стоим на текущем угле ---
if (target_id == noone || !instance_exists(target_id)) {
    fire_active = false;
    fire_frame = 0;
	var ang_world = point_direction(x, y, last_target_vector.x, last_target_vector.y);
	var cam_ang = turret_get_cam_angle();
	
	var new_idx = turret_angle_to_idx(ang_world, cam_ang);
    image_index = new_idx * TUR_FRAMES_PER_DIR; // idle
    exit;
}

// --- проверка линии огня (по желанию можно реже, чем каждый кадр) ---
var tx = target_id.x;
var ty = target_id.y;
last_target_vector.x = tx;
last_target_vector.y = ty;
var tz = (variable_instance_exists(target_id, "z") ? target_id.z : 0);
var aim_z = tz + global.raycast_shoot_height;

var los_hit = gm3d_raycast_pillars(x, y, z + global.raycast_shoot_height, tx, ty, aim_z);
var has_los = !is_array(los_hit);

// --- дискретный угол спрайта с учётом камеры ---
var ang_world = point_direction(x, y, tx, ty);
var cam_ang = turret_get_cam_angle();

var new_idx = turret_angle_to_idx(ang_world, cam_ang);
show_debug_message($"turret ang_world {ang_world} cam_ang {cam_ang} new_indx {new_idx} target {target_id}")

// во время выстрела угол фиксируем
if (!fire_active) aim_idx = new_idx;

// --- стрельба ---
if (fire_cooldown > 0) fire_cooldown -= 1;

if (!fire_active) {
    // idle кадр текущего угла
    image_index = aim_idx * TUR_FRAMES_PER_DIR;

    if (has_los && fire_cooldown <= 0 && (team_is_enemy || energy >= 50)) {
        fire_active = true;
        fire_frame = 1;
        aim_idx_locked = aim_idx;
        fire_cooldown = fire_cooldown_max;
    }
}
else {
    // играем 10 кадров выстрела в блоке угла
    var base = aim_idx_locked * TUR_FRAMES_PER_DIR;
    image_index = base + fire_frame;

    if (has_los && fire_frame == fire_shot_frame) {
        // --- ВСТАВЬ СЮДА СВОЙ КОД ВЫСТРЕЛА ---
        // Например спавн пули/трассера в (x,y,z+18) -> (tx,ty,aim_z)
        // turret_fire(tx, ty, aim_z);
		if (team_is_enemy)
		{
			var shell = instance_create(x, y, plasma_bomb_3D);
			shell.z = z + global.raycast_shoot_height;
			shell.damage = 40; 
			rand_x=irandom_range(-10, 10);
			rand_y=irandom_range(-10, 10);
			shell.target_x = target_id.x + rand_x;
			shell.target_y = target_id.y + rand_y;
			shell.target_z = target_id.z;
			var ray = gm3d_raycast_pillars(shell.x, shell.y, shell.z, shell.target_x, shell.target_y, shell.target_z);
			if (is_array(ray))
			{
				shell.target_x = ray[0];
				shell.target_y = ray[1];
				shell.target_z = ray[2];
			}
			shell.target_dist = point_distance_3d(shell.x, shell.y, shell.z, shell.target_x, shell.target_y, shell.target_z);
			shell.target_diff = abs(shell.target_z - shell.z);
		}
		else
		{

			var x1 = x;
			var y1 = y;
			var z1 = z;
			var x2 = target_id.x;
			var y2 = target_id.y;
			var z2 = target_id.z;
			var ray = gm3d_raycast_pillars(x1, y1, z1 + global.raycast_shoot_height, x2, y2, z2);
			if (is_struct(ray))
			{
				x2 = ray.x;
				y2 = ray.y;
				z2 = ray.z;
				show_debug_message("Выстрел произошел в столб!");
			}
			else show_debug_message("Столба на пути выстрела не обнаружено!");
			
			laser=instance_create(x, y, laser_ray_3d);
			laser.x = x; 
			laser.y = y;
			laser.z = z + global.raycast_shoot_height * high;
			laser.target_x=x2;
			laser.target_y=y2;
			laser.target_z=z2;
			energy -= 50;
			
			if (instance_exists(Terror_Squad_3D)) {
			   enemy=instance_nearest(x2, y2, Terror_Squad_3D);
			
			   if (point_distance_3d(x2, y2, z2, enemy.x, enemy.y, enemy.z) < global.range_to_hit) {
			      enemy.hp -=global.laserrifledamage;
			      var puff = instance_create(enemy.x, enemy.y, Puff_2_3D);
				  puff.z = enemy.z;
				  enemy.hit = 1;
				  enemy.status = "idle";
				  enemy.vel_x = 0;
				  enemy.vel_y = 0;
			   }
			}
			
			if (image_index >= image_number - 1) { image_index = 0; flash = 0; status = "idle"; }
		}
    }

    fire_frame += 1;
    if (fire_frame > 10) {
        fire_active = false;
        fire_frame = 0;
    }
}
