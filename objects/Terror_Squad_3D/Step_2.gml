/// Terror_Squad_3D: End Step
/// Сам ИИ

var arena = instance_find(oArena3D, 0);
var cam_ang = 0;
if (instance_exists(arena)) cam_ang = arena.cam_angle;

if (!variable_instance_exists(id, "last_hit_src"))   last_hit_src = noone;
if (!variable_instance_exists(id, "last_hit_fight")) last_hit_fight = -1;
if (!variable_instance_exists(id, "last_hit_frame")) last_hit_frame = -1;

var prev_status = status;
var anim_set = false;

var target = instance_nearest(x, y, X_MAS_team_3D);

var vx = 0;
var vy = 0;

energy += 0.1

if (jump != 0 and status != "fly") status = "jump";

if (fall > 0 && (index == "beetle" || index == "ufo")) instance_destroy(self);

if (instance_exists(target))
{
    var tx = target.x;
    var ty = target.y;
    var tz = target.z;

    var dist2d = point_distance(x, y, tx, ty);

    var can_ranged = (can_shoot_plasma or can_shoot_plasma_bombs);
    var los_clear = true;
    if (can_ranged) {
        var hitinfo_los = gm3d_raycast_pillars(x, y, z, tx, ty, tz);
        los_clear = is_undefined(hitinfo_los);
    }

    if (jump == 0 and fight == 0 and hit == 0 and fall == 0 and super == 0 and back == 0)
    {
        if (jump == 0 and can_flash and energy >= energy_cost_flash and point_distance_3d(x, y, z, target.x, target.y, target.z) > 850)
        {
			energy -= energy_cost_flash;
            image_index=0;
			status="flash";
			flash = 1;
			anim_set = true;
        }

		var rand = irandom_range(0, 200); // чтобы не тупо стоял и стрелял, а в промежутках между бегом
        if (jump == 0 and can_ranged and dist2d > 100 and ((flash == 0 and rand < 5 and los_clear) or flash == 3))
        {
            vx = 0;
            vy = 0;

            if (jump == 0 and status != "fly") {
                direct = gm3d_direct4_cam_to_point(x, y, tx, ty, cam_ang - 90, direct);
            }
			if (object_index == egg_pawn_3D)
			{
				if (flash == 0 and point_distance_3d(x, y, z, target.x, target.y, target.z) > 250 and point_distance_3d(x, y, z, target.x, target.y, target.z) < 700)
				{
					flash = 3;
					status = "shoot";
					image_index = 0;
					vel_x = 0;
					vel_y = 0;
				}
				
				if (flash == 3)
				{
					direct = gm3d_direct4_cam_to_point(x, y, target.x, target.y, arena.cam_angle - 90, direct);
					vel_x = 0;
					vel_y = 0;
					//show_debug_message("Пиф Паф");
					if (image_index == 11) 
					{ 
						var shell = instance_create(x, y, plasma_3D);
						shell.z = z + global.raycast_shoot_height;
						shell.damage = 40; 
						rand_x=irandom_range(-10, 10);
						rand_y=irandom_range(-10, 10);
						shell.target_x = target.x + rand_x;
						shell.target_y = target.y + rand_y;
						shell.target_z = target.z;
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
					if (image_index == 16) 
					{
						var shell = instance_create(x, y, plasma_3D); 
						shell.z = z + global.raycast_shoot_height;
						shell.damage = 40; 
						rand_x=irandom_range(-10, 10);
						rand_y=irandom_range(-10, 10);
						shell.target_x = target.x + rand_x;
						shell.target_y = target.y + rand_y;
						shell.target_z = target.z;
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
					if (image_index >= image_number - 1) { image_index = 0; flash = 0; status = "idle"; }
				}
			}
			else
			if (object_index == ufo_tank_3D)
			{
				if (flash == 0 and point_distance_3d(x, y, z, target.x, target.y, target.z) > 10 and point_distance_3d(x, y, z, target.x, target.y, target.z) < 800)
				{
					flash = 3;
					status = "shoot";
					image_index = 0;
					vel_x = 0;
					vel_y = 0;
				}
				
				if (flash == 3)
				{
					direct = gm3d_direct4_cam_to_point(x, y, target.x, target.y, arena.cam_angle - 90, direct);
					vel_x = 0;
					vel_y = 0;
					if (image_index == 0) 
					{ 
						var shell = instance_create(x, y, plasma_bomb_3D);
						shell.z = z + global.raycast_shoot_height;
						shell.damage = 40; 
						rand_x=irandom_range(-10, 10);
						rand_y=irandom_range(-10, 10);
						shell.target_x = target.x + rand_x;
						shell.target_y = target.y + rand_y;
						shell.target_z = target.z;
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
					if (image_index == 0) 
					{
						var shell = instance_create(x + 3, y + 3, plasma_bomb_3D); 
						shell.z = z + global.raycast_shoot_height;
						shell.damage = 40; 
						rand_x=irandom_range(-10, 10);
						rand_y=irandom_range(-10, 10);
						shell.target_x = target.x + rand_x;
						shell.target_y = target.y + rand_y;
						shell.target_z = target.z;
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
					if (image_index >= image_number - 1) { image_index = 0; flash = 0; status = "idle"; }
				}
			}
        }
        else
        if (dist2d > global.range_to_hit)
        {
            if (status != "jump")
                status = "run";

            var ang_to = point_direction(x, y, tx, ty);
            vx = lengthdir_x(spd, ang_to);
            vy = lengthdir_y(spd, ang_to);
			// если дерёмся/получаем урон — ИИ и движение выключаем
			if (hit != 0 || fight != 0) {
			    vx = 0;
			    vy = 0;
			}

            var lenv = sqrt(vx*vx + vy*vy);
            if (lenv > 0.0001) {
                move_local_x = vx / lenv;
                move_local_y = vy / lenv;
            } else {
                move_local_x = 0;
                move_local_y = 0;
            }

            if (!can_jump) {
                var hitinfo = gm3d_raycast_pillars(x, y, z, tx, ty, tz);
                if (!is_undefined(hitinfo)) {
                    var avoid_ang = ang_to + choose(90, -90);
                    vx = lengthdir_x(spd, avoid_ang);
                    vy = lengthdir_y(spd, avoid_ang);

                    lenv = sqrt(vx*vx + vy*vy);
                    if (lenv > 0.0001) {
                        move_local_x = vx / lenv;
                        move_local_y = vy / lenv;
                    }
                }
            }
            else
            if (can_jump and jump = 0 and status != "fly")
            {
                if (can_jump && fight == 0 && jump == 0 && flash == 0 && fall == 0 && hit == 0 && status != "fly")
				{
				    // пробуем следующий шаг (учти твои vel_x/vel_y если они участвуют)
				    var tx = x + vx + vel_x;
				    var ty = y + vy + vel_y;
				
				    // прыжок только если мы реально упираемся в столб на следующем шаге
				    if (floor_z < global.pillar_height - 0.1 && gm3d_would_hit_pillar(tx, ty, col_radius) && distance_to_object(target) > global.range_to_hit)
				    {
				        jump = 1;
				        status = "jump";
				        image_index = 0;
				        anim_set = true;
				    }
				}

            }

            if (jump == 0 and status != "fly") {
                direct = gm3d_direct4_cam_from_vec(vx, vy, cam_ang - 90, direct);
            }
        }
        else
        {
            vx = 0;
            vy = 0;

            if (jump == 0 and status != "fly") {
                direct = gm3d_direct4_cam_to_point(x, y, tx, ty, cam_ang - 90, direct);
            }
			if (suicide_man)
			{
				instance_destroy(self);
			}
			else
            if (fight == 0 && can_fight && jump == 0 && flash == 0 && hit == 0)
            {
				status = "idle";
				var rand = irandom_range(0, 40 * global.current_diff_mn);
				if (rand > 35 * global.current_diff_mn)
				{
					if (rand > 38 * global.current_diff_mn)
					{
						status = "fight";
						fight = 1;
						image_index = 0;
						anim_set = true;
					}
					else
					{
						status = "kick";
						fight = 7;
						image_index = 0;
						anim_set = true;
					}
				}
            }
        }
    }

    if (jump != 0 and status = "jump")
    {
        vx = move_local_x * spd;
        vy = move_local_y * spd;
    }

    if (fight == 1)
    {
        status = "fight";
        if (floor(image_index) >= hit_1_index)
        {
            if (hit == 0) { fight = 2; }
            else { fight = 0; status = "idle"; image_index = 0; }
        }
    }
    if (fight == 2)
    {
        status = "fight";
        if (floor(image_index) >= hit_2_index)
        {
            if (hit == 0) { fight = 3; }
            else { fight = 0; status = "idle"; image_index = 0; }
        }
    }
    if (fight == 3)
    {
        status = "fight";
        if (floor(image_index) >= image_number - 1)
        {
            fight = 0;
            status = "idle";
            image_index = 0;
        }
    }

    if (fight == 4)
    {
        fight = 5;
        image_index = 0;
        status = "block";
        vel_x = 0;
        vel_y = 0;
    }
    if (fight == 5)
    {
        if (image_index > 10) { fight = 6; }
    }
    if (fight == 6)
    {
        if (image_index > 19) { back = 1; }
        if (image_index = 10) { back = 0; }
        if (image_index > 11) { back = 1; }
        if (image_index = 5) { back = 0; }
		if (instance_exists(target)) 
		{
			if (target.fight == 0 || target.fight > 3) 
			{
				fight = 0;
				image_index = 0;
				status = "idle";
			}
		}
		else { fight = 0; image_index = 0; status = "idle"; }
    }
    if (fight == 7)
	{
	    status = "kick";
	
	    if (floor(image_index) >= image_number - 1)
	    {
	        fight = 0;
	        status = "idle";
	        image_index = 0;
	        back = 0;
	    }
	}
}

///////////////////
	
/////////////////// Рывок

if (flash == 1) 
{
	status = "flash";
    vel_x = lengthdir_x(10, point_direction(x, y, target.x, target.y));
    vel_y = lengthdir_y(10, point_direction(x, y, target.x, target.y));
	
   if (z <= floor_z + 0.1) {
      z = floor_z + zmax * 0.25;
   }

   if (image_index >= image_number - 1) {
      flash = 2;
   }
}


if (flash == 2) 
{
	jump = 0;
   status="run";

   if (vel_x > 0) {
      vel_x -=0.17;
   }

   if (vel_x < 0) {
      vel_x+=0.17;
   }

   if (vel_y > 0) {
      vel_y -=0.17;
   }

   if (vel_y < 0) {
      vel_y+=0.17;
   }

   if (vel_y > -0.25 and vel_y < 0.25) {
      vel_y=0;
   }

   if (vel_x > -0.25 and vel_x < 0.25) {
      vel_x=0;
   }

   if (z > floor_z) {
      var dz = (z - floor_z) * 0.25;
      z -= dz;
      if (z < floor_z + 0.5) {
         z = floor_z;
      }
   }
   

   if (vel_x=0 and vel_y=0 and z <= floor_z + 0.1) {
      status="idle";
      image_index=0;
      flash=0;
   }
}


///////////////////
	
/////////////////// Прыжки
if (jump > 0) status = "jump";
if (jump == 1) {
    if (floor(image_index) >= jump_start_index) jump = 2;
}
if (jump == 2) {
	status = "jump";
    z += zmax / max(1, (jump_end_index - jump_start_index));
	if (z > zmax) z = zmax;
    if (floor(image_index) >= jump_end_index) jump = 3;
}
if (jump == 3)
{
    status = "jump";

    var descend_speed = zmax / max(1, (jump_end_index - jump_start_index));

    // Если это не штатное приземление после прыжка,
    // а сход со столба — падаем с нормальной отдельной скоростью.
    if (drop_from_pillar)
    {
        descend_speed = pillar_drop_speed;
    }

    if (z > floor_z) z -= descend_speed;
    if (z <= floor_z) z = floor_z;

    if (z == floor_z)
    {
        jump = 0;
        z = floor_z;
        status = "idle";
        back = 0;
        drop_from_pillar = false;
    }

    vel_x = 0;
    vel_y = 0;
    vx = 0;
    vy = 0;
}


if (status != "block" && (fight == 6 || fight == 4 || fight == 5)) { status = "block"; }
if (status == "fight" && fight == 0 && hit == 0) { status = "idle"; }
if (status != "idle" && fight == 0 && hit == 0 && jump == 0 && flash == 0 && vx == 0 && vy == 0) { status = "idle"; }
if (status != "block" && hit > 0) { status = "block"; }
if (status != "fight" && (fight == 1 || fight == 2 || fight == 3)) { status = "fight"; }
if (status != "jump" && jump > 0) { status = "jump"; }
if (status != "flash" && flash > 0 && flash < 3) { status = "flash"; }
if (status != "run" && (vx > 0 || vy > 0) && jump == 0 && fight == 0 && hit == 0 && flash == 0) { status = "run"; }
if (z > floor_z && jump == 0 && (flash > 2 || flash == 0) && status != "fly")
{
    jump = 3;
    status = "jump";
    image_index = jump_end_index;

    // Это не обычное приземление после прыжка,
    // а падение с уровня столба вниз.
    drop_from_pillar = true;

    // При начале падения прерываем ближний бой.
    fight = 0;

    // Если пешка начала падать в момент стрельбы —
    // стрельбу обрываем, чтобы состояние не висело поверх спуска.
    if (flash == 3) flash = 0;
}
if (jump > 0 && fight > 0) { fight = 0; status = "jump"; }
if ((status == "jump" || status == "fight" || status == "block" || status == "flash") && (index == "beetle" || index == "ufo")) { status = "idle"; }
if (jump == 3 && image_index < jump_end_index) { image_index = jump_end_index; } 
///////////////////
	
/////////////////// Столбы
var airborne = (jump > 0) || (status == "fly");


var step_x = vx + vel_x;
var step_y = vy + vel_y;

if (abs(vel_x) > 0.001 or abs(vel_y) > 0.001) {
    vel_x *= 0.85;
    vel_y *= 0.85;
    if (abs(vel_x) < 0.01) vel_x = 0;
    if (abs(vel_y) < 0.01) vel_y = 0;
}

var new_x = x + step_x;
var new_y = y + step_y;

var ah = global.arena_half;
if (new_x < -ah) new_x = -ah;
if (new_x >  ah) new_x =  ah;
if (new_y < -ah) new_y = -ah;
if (new_y >  ah) new_y =  ah;

if (!airborne and floor_z < global.pillar_height - 0.1) {
    var half = global.pillar_size * 0.5;

    var pillars = global.arena_pillars;
    if (is_array(pillars)) {
        var n = array_length(pillars);
        for (var i = 0; i < n; i++) {
            var p = pillars[i];

            var left   = p.x - half - col_radius;
            var right  = p.x + half + col_radius;
            var bottom = p.y - half - col_radius;
            var top    = p.y + half + col_radius;

            if (new_x > left and new_x < right and new_y > bottom and new_y < top) {
                var dxp = new_x - p.x;
                var dyp = new_y - p.y;

                if (abs(dxp) > abs(dyp)) {
                    if (dxp > 0) new_x = right; else new_x = left;
                } else {
                    if (dyp > 0) new_y = top; else new_y = bottom;
                }
            }
        }
    }
}

x = new_x;
y = new_y;

var prev_floor_z = floor_z;
var under = gm3d_get_pillar_height_at(x, y);
floor_z = under;

if (floor_z > z) z = floor_z;

if (prev_floor_z > 0 and floor_z = 0 and flash == 0 and jump = 0 and status != "fly")
{
    jump = 3;
    status = "jump";
    image_index = jump_end_index;
    anim_set = true;

    drop_from_pillar = true;
    fight = 0;
}

//image_speed = 0;
//
//if (status = "idle") image_index += 0.5;
//if (status = "run")  image_index += spd * 0.2;
//if (status = "fight") image_index += 0.5;
//if (status = "jump") image_index += 0.5;
//
//if (image_index >= image_number) image_index = 0;

gm3d_combat_tick_unit(id);

str = string_insert(index, "_", 0);
str = string_insert(str, direct, 0);
str = string_insert(str, "_", 0);
str = string_insert(str, status, 0);

if (fall != 0 || status == "fall")
{
    show_debug_message(
        "ENEMY FALL | "
        + "index=" + string(index)
        + " direct=" + string(direct)
        + " status=" + string(status)
        + " fall=" + string(fall)
        + " str=" + str
        + " image_index=" + string(image_index)
    );
}

sprite_index = asset_get_index(str);
if (image_index < jump_end_index and jump = 3) { image_index = jump_end_index; }

image_speed = 0;

if (status = "run") { image_index += spd + 0.2; }
else
if (status = "fly") { image_index += 1; }
else
{
    if (back = 0) { image_index += 0.5; }
    else { image_index -= 0.5; }
}

if (image_index >= image_number) image_index = 0;
if (image_index < 0) image_index = image_number - 1;


/// озвучка
/////////////// общее

if (status = "run" and index = "ufo")
{
	if (!sound_isplaying(levitation)) { sound_play(levitation); sound_volume(levitation, global.soundvolume - 0.1); }
}
if (status = "run" and index = "beetle")
{
	if (image_index = 0) { sound_play(strekota); sound_volume(strekota, global.soundvolume - 0.1); }
}
if (status = "run" and index = "metalson")
{
	if (image_index = 17) { sound_play(robot_step_2); sound_volume(robot_step_2, global.soundvolume); }
	if (image_index = 48) { sound_play(robot_step_2); sound_volume(robot_step_2, global.soundvolume); }
	
}
if (status = "run" and index = "pawn")
{
	if (image_index = 17) { sound_play(robot_step_1); sound_volume(robot_step_1, global.soundvolume); }
	if (image_index = 48) { sound_play(robot_step_1); sound_volume(robot_step_1, global.soundvolume); }
	
}
if (hit = 2 and image_index = 0 and index = "metalson") { sound_play(easy_hit_metal); sound_volume(easy_hit_metal, global.soundvolume); }
if (hit = 2 and image_index = 0 and index = "pawn") { sound_play(metal_hit); sound_volume(metal_hit, global.soundvolume); }
if (status = "jump" and image_index = 13) { sound_play(jump_sound); sound_volume(jump_sound, global.soundvolume); }


gm3d_combat_emit_melee(id, X_MAS_team_3D);

show_debug_message($"Объект: {index} vx: {vx} vy: {vy} z: {z} status: {status} hit: {hit} flash: {flash} jump: {jump} fight: {fight} super: {super} ");