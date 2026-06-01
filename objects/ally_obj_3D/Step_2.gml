//// oAllyBot3D: End Step

if (start=0) {

   if (hero_numb==1) {
      hero_index="tails";
      hit_1_index=7;
      hit_2_index=12;
      hit_3_index=18;
      jump_start_index=6;
      jump_end_index=16;
	  
	  can_flash = false;
	  high = 1.1;

      zmax=90;
      hp=global.tailsmaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=2 + global.team[massive_index, 6] / 10;
      damage=15 + global.team[massive_index, 6] / 10;
   }

   if (hero_numb==2) {
      hero_index="amy";
      hit_1_index=13;
      hit_2_index=18;
      hit_3_index=34;
      jump_start_index=11;
      jump_end_index=27;
      ammo=200;
	  high = 1.2;
	  
	  can_flash = false;

      zmax=70;
      hp=global.amymaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=1.5 + global.team[massive_index, 6] / 10;
      damage=25 + global.team[massive_index, 6] / 10;
   }

   if (hero_numb==3) {
      hero_index="sonic";
      hit_1_index=5;
      hit_2_index=9;
      hit_3_index=15;
      jump_start_index=12;
      jump_end_index=27;
	  high = 1.2;
	  
	  can_flash = false;

      zmax=60;
      hp=global.sonicsmaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=3 + global.team[massive_index, 6] / 10;
      damage=18 + global.team[massive_index, 6] / 10;
   }

   if (hero_numb==4) {
      hero_index="knuckles";
      hit_1_index=5;
      hit_2_index=10;
      hit_3_index=18;
      jump_start_index=11;
      jump_end_index=24;
	  high = 1.15;
	  
	  can_flash = false;
	  ammo = 10;

      zmax=60;
      hp=global.knucklesmaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=0.8 + global.team[massive_index, 6] / 10;
      damage=25 + global.team[massive_index, 6] / 10;
   }

   if (hero_numb==5) {
      hero_index="rouge";
      hit_1_index=7;
      hit_2_index=17;
      hit_3_index=29;
      jump_start_index=11;
      jump_end_index=24;
	  high = 1.2;
	  
	  can_flash = false;

      zmax=100;
      hp=global.rougemaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=1.8 + global.team[massive_index, 6] / 10;
      damage=17 + global.team[massive_index, 6] / 10;
   }

   if (hero_numb==6) {
      hero_index="shadow";
      hit_1_index=5;
      hit_2_index=8;
      hit_3_index=12;
      jump_start_index=10;
      jump_end_index=20;
	  high = 1.2;
	  
	  can_flash = false;

      zmax=80;
      hp=global.shadowmaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=3 + global.team[massive_index, 6] / 10;
      damage=18 + global.team[massive_index, 6] / 10;
   }

   if (hero_numb==7) {
      hero_index="silver";
      hit_1_index=12;
      hit_2_index=17;
      hit_3_index=26;
      jump_start_index=10;
      jump_end_index=24;
	  high = 1.25;
	  
	  can_flash = false;

      zmax=70;
      hp=global.silvermaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=1.8 + global.team[massive_index, 6] / 10;
      damage=20 + global.team[massive_index, 6] / 10;
   }

   if (hero_numb==8) {
      hero_index="snowman";
      hit_1_index=7;
      hit_2_index=11;
      hit_3_index=15;
      jump_start_index=11;
      jump_end_index=23;
	  high = 1.25;
	  
	  can_flash = false;

      zmax=60;
      hp=global.snowmanmaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=1 + global.team[massive_index, 6] / 10;
      damage=15 + global.team[massive_index, 6] / 10;
   }

   if (hero_numb==9) {
      hero_index="snowmanak";
      hit_1_index=7;
      hit_2_index=9;
      hit_3_index=18;
      jump_start_index=11;
      jump_end_index=23;
	  high = 1.25;
	  
	  can_flash = false;
	  
      ammo = 100;
      zmax=60;
      hp=global.snowmanmaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=1 + global.team[massive_index, 6] / 10;
      damage=15 + global.team[massive_index, 6] / 10;
	  reload_time = 20 - global.team[massive_index, 6] / 10;
   }

   if (hero_numb==10) {
      hero_index="snowmanrifle";
      hit_1_index=7;
      hit_2_index=9;
      hit_3_index=18;
      jump_start_index=11;
      jump_end_index=23;
	  high = 1.25;
	  
	  can_flash = false;
	  
	  ammo = 50;
      zmax=60;
      hp=global.snowmanmaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=1 + global.team[massive_index, 6] / 10;
      damage=15 + global.team[massive_index, 6] / 10;
	  reload_time = 30 - global.team[massive_index, 6] / 10;
   }

   if (hero_numb==11) {
      hero_index="snowmanlaser";
      hit_1_index=7;
      hit_2_index=9;
      hit_3_index=18;
      jump_start_index=11;
      jump_end_index=23;
	  high = 1.25;
	  
	  can_flash = false;
	  
      zmax=60;
      hp=global.snowmanmaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=1 + global.team[massive_index, 6] / 10;
      damage=15 + global.team[massive_index, 6] / 10;
   }
   max_ammo = ammo;
   start=1;
}

// depth для сортировки
depth = room_height - y;
reload--;









///// Сам ИИ

show_debug_message($"flash prev prev prev: {flash}");
var arena = instance_find(oArena3D, 0);
var cam_ang = 0;
if (instance_exists(arena)) cam_ang = arena.cam_angle;

if (!variable_instance_exists(id, "last_hit_src"))   last_hit_src = noone;
if (!variable_instance_exists(id, "last_hit_fight")) last_hit_fight = -1;
if (!variable_instance_exists(id, "last_hit_frame")) last_hit_frame = -1;

var prev_status = status;
var anim_set = false;

var target = instance_nearest(x, y, Terror_Squad_3D);
if (!instance_exists(target) && instance_exists(Turret_3D)) 
{
	target = instance_nearest(x, y, Turret_3D);
	if (!target.team_is_enemy) target = noone;
}


var vx = 0;
var vy = 0;

if (hero_numb != 1 && energy + 0.05 <= max_energy && /*fight == 4 &&*/ status == "block")
{ 
	energy += 0.5; 
}
else
if ((hero_numb == 1 || hero_numb == 6 || hero_numb == 11) && energy + 0.01 <= max_energy)
{ 
	energy += 0.25; 
}


if ((!instance_exists(target) || point_distance_3d(x, y, z, target.x, target.y, target.z) > 300) && energy < energy_cost_super_2 && jump == 0 && flash == 0 && fight == 0) 
{ 
	status = "block"; 
	fight = 4; 
}

if (instance_exists(target))
{
	
	if (hero_numb == 1 && energy >= energy_cost_super_2 && !instance_exists(bpla_3D) && jump == 0 && fight == 0 && super == 0 && flash == 0)
	{
		super = 5;
	}
	if (hero_numb == 4 && !instance_exists(landmine_3D) && ammo > 0 && jump == 0 && fight == 0 && super == 0 && flash == 0)
	{
		super = 5;
	}
	if (hero_numb == 7 && energy >= energy_cost_super_1 && !instance_exists(landmine_3D) && jump == 0 && fight == 0 && super == 0 && flash == 0 && target.object_index == beetle_3D)
	{
		super = 5;
	}
	
    var tx = target.x;
    var ty = target.y;
    var tz = target.z;

    var dist2d = point_distance(x, y, tx, ty);
    var can_ranged = (hero_numb == 9 || hero_numb == 10 || hero_numb == 2 || hero_numb == 1 || hero_numb == 11);
    var los_clear = true;
    if (can_ranged) {
        var hitinfo_los = gm3d_raycast_pillars(x, y, z, tx, ty, tz);
        los_clear = is_undefined(hitinfo_los);
    }
	var has_ammo = false;
	if ((hero_numb == 2 || hero_numb == 9 || hero_numb == 10) && ammo > 0) has_ammo = true;
	else
	if ((hero_numb == 1 || hero_numb == 11) && energy >= energy_cost_super_1) has_ammo = true;

    if (fight == 0 and hit == 0 and fall == 0 and super == 0 and back == 0)
    {
        if (jump == 0 and can_flash and energy >= energy_cost_flash and point_distance_3d(x, y, z, target.x, target.y, target.z) > 850)
        {
			energy -= energy_cost_flash;
            image_index=0;
			status="flash";
			flash = 1;
			anim_set = true;
        }

		var rand = irandom_range(0, 100); // чтобы не тупо стоял и стрелял, а в промежутках между бегом
        if (jump == 0 and can_ranged and dist2d > 100 and ((flash == 0 and has_ammo and (rand < 15 or target.object_index == Turret_3D or target.object_index == beetle_3D) and los_clear) or flash == 3))
        {
            vx = 0;
            vy = 0;

            if (jump == 0 and status != "fly") {
                direct = gm3d_direct4_cam_to_point(x, y, tx, ty, cam_ang - 90, direct);
            }
			if (hero_numb == 9)
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
					if (image_index == 2 || image_index == 10 || image_index == 5) 
					{ 
						ammo--;
						var shell = instance_create(x, y, bullet_3D);
						shell.z = z + global.raycast_shoot_height;
						shell.damage = global.akdamage; 
						rand_x=irandom_range(-0.25, 0.25);
						rand_y=irandom_range(-0.25, 0.25);
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
						shell.target_z_delta = shell.target_z - shell.z;
						shell.target_xy_dist = point_distance(
					    shell.x, shell.y,
					    shell.target_x, shell.target_y
						);
					}
				}
			}
			else
			if (hero_numb == 10)
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
					if (image_index == 2) 
					{ 
						ammo--;
						var shell = instance_create(x, y, bullet_3D);
						shell.z = z + global.raycast_shoot_height;
						shell.damage = global.rifledamage; 
						rand_x=irandom_range(-0.05, 0.05);
						rand_y=irandom_range(-0.05, 0.05);
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
						shell.target_z_delta = shell.target_z - shell.z;
						shell.target_xy_dist = point_distance(
					    shell.x, shell.y,
					    shell.target_x, shell.target_y
						);
					}
				}
				
			}
			else
			if (hero_numb == 2)
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
					if (image_index >= 2 && image_index < 13) 
					{ 
						ammo--;
						var shell = instance_create(x, y, bullet_3D);
						shell.z = z + global.raycast_shoot_height;
						shell.damage = global.minigundamage; 
						rand_x=irandom_range(-1.0, 1.0);
						rand_y=irandom_range(-1.0, 1.0);
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
						shell.target_z_delta = shell.target_z - shell.z;
						shell.target_xy_dist = point_distance(
					    shell.x, shell.y,
					    shell.target_x, shell.target_y
						);
					}
				}
				
			}
			else
			if (hero_numb == 1)
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
					if (image_index == 5) 
					{ 
						var x1 = x;
						var y1 = y;
						var z1 = z;
						var x2 = target.x;
						var y2 = target.y;
						var z2 = target.z;
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
						laser.z = z + global.raycast_shoot_height;
						laser.target_x=x2;
						laser.target_y=y2;
						laser.target_z=z2;
						energy -= energy_cost_super_1;
						
						if (instance_exists(Terror_Squad_3D)) {
						   var enemy = instance_nearest(x2, y2, Terror_Squad_3D);
						
						   if (point_distance_3d(x2, y2, z2, enemy.x, enemy.y, enemy.z) < global.range_to_hit) {
						      enemy.hp -=global.laserpistoldamage;
						      var puff = instance_create(enemy.x, enemy.y, Puff_2_3D);
							  puff.z = enemy.z;
							  enemy.hit = 1;
							  enemy.status = "idle";
							  enemy.vel_x = 0;
							  enemy.vel_y = 0;
						   }
						}
					}
				}
				
			}
			else
			if (hero_numb == 11)
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
					if (image_index == 5) 
					{ 
						var x1 = x;
						var y1 = y;
						var z1 = z;
						var x2 = target.x;
						var y2 = target.y;
						var z2 = target.z;
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
						laser.z = z + global.raycast_shoot_height;
						laser.target_x=x2;
						laser.target_y=y2;
						laser.target_z=z2;
						energy -= energy_cost_super_1;
						
						if (instance_exists(Terror_Squad_3D)) {
						   var enemy=instance_nearest(x2, y2, Terror_Squad_3D);
						
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
					}
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
			var is_encircled = false;
			var count = 0;
			for (var i = 0; i < instance_number(Terror_Squad_3D); i++)
			{
				var inst = instance_find(Terror_Squad_3D, i);
				if (point_distance_3d(x, y, z, inst.x, inst.y, inst.z) < global.range_to_hit * 2) 
				{
					count++;
					if (count > 1) { is_encircled = true; break; }
				}
			}
			if ((hero_numb == 2 || hero_numb == 6) && is_encircled)
			{
				if (energy >= energy_cost_super_2) super = 5;
			}
			else
            if (fight == 0 && can_fight && jump == 0 && flash == 0 && hit == 0)
            {
				status = "idle";
				rand = irandom_range(0, 45 / global.current_diff_mn);
				if (rand > 35 / global.current_diff_mn)
				{
					if (rand > 38 / global.current_diff_mn)
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
	    status = "block";
	    vel_x = 0;
	    vel_y = 0;
	
	    if (hero_numb != 1 && image_index > 10)
	        fight = 5;
	
	    if (hero_numb == 1 && image_index > 5)
	        fight = 5;
	}
    if (fight == 5)
	{
	    status = "block";
	    vel_x = 0;
	    vel_y = 0;
	
	    if (hero_numb != 1)
	    {
	        if (image_index > 19) back = 1;
	        if (image_index == 10) back = 0;
	    }
	    else
	    {
	        if (image_index > 11) back = 1;
	        if (image_index == 5) back = 0;
	    }
	
	    // твоя логика выхода из блока по поведению ИИ
	    if (instance_exists(target))
	    {
	        if (target.fight == 0 || target.fight > 3)
	        {
	            fight = 6;
	
	            if (hero_numb != 1)
	                image_index = 20;
	            else
	                image_index = 10;
	
	            back = 1;
	        }
	    }
	    else
	    {
	        fight = 6;
	
	        if (hero_numb != 1)
	            image_index = 20;
	        else
	            image_index = 10;
	
	        back = 1;
	    }
	}
   if (fight == 6)
	{
	    status = "block";
	
	    if (image_index <= 0)
	    {
	        fight = 0;
	        status = "idle";
	        image_index = 0;
	        back = 0;
	    }
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
	///////////////////
	
	/////////////////// Супер-Силы 
	
	if (hero_numb=1) {
	   if (super=5 and (instance_exists(bpla_3D) or energy < energy_cost_super_2)) {
	      super=0;
	   }
		
	   if (super=5) {
		  energy -= energy_cost_super_2;
	      status="unpack";
	      image_index=0;
	      super=6;
	      instance_create(x, y, bpla_3D);
	   }
	
	   if (super=6) {
	      if (image_index=image_number - 1) {
	         image_index=0;
	         status="idle";
	         super=0;
	      }
	   }
	
	}
	
	if (hero_numb == 2)
	{
	    // Вихревой молот
	    if (super == 5 && energy < energy_cost_super_2)
	    {
	        super = 0;
	    }
	
	    if (super == 5)
	    {
	        energy -= energy_cost_super_2;
	
	        status = "tornado";
	        image_index = 0;
	        super = 6;
	
	        // Важно: сбрасываем флаг удара при запуске способности
	        amy_tornado_hit_done = false;
	
	        vel_x = 0;
	        vel_y = 0;
	    }
	
	    if (super == 6)
	    {
	        status = "tornado";
	
	        // Кадр активного удара.
	        // Подбери под спрайт: 4/5/6 обычно нормально для кругового удара.
	        var hit_frame = 5;
	
	        if (image_index >= hit_frame && !amy_tornado_hit_done)
	        {
	            amy_tornado_hit_done = true;
	
	            var radius = 90;
	            var tornado_damage = 20;
	            var knock_power = 20;
	
	            for (var i = 0; i < instance_number(Terror_Squad_3D); i++)
	            {
	                var enemy = instance_find(Terror_Squad_3D, i);
	                if (!instance_exists(enemy)) continue;
	                if (!variable_instance_exists(enemy, "hp")) continue;
	                if (enemy.hp <= 0) continue;
	
	                // Не бьём врага на другом уровне высоты.
	                // Если хочешь, чтобы вихрь доставал со столба/на столб — увеличь допуск.
	                var same_level = true;
	
	                if (variable_instance_exists(enemy, "floor_z"))
	                {
	                    same_level = abs(enemy.floor_z - floor_z) <= 1;
	                }
	                else
	                if (variable_instance_exists(enemy, "z"))
	                {
	                    same_level = abs(enemy.z - z) <= 40;
	                }
	
	                if (!same_level) continue;
	
	                if (point_distance(x, y, enemy.x, enemy.y) <= radius)
	                {
	                    enemy.hp -= tornado_damage;
	
	                    var puff = instance_create(enemy.x, enemy.y, Puff_2_3D);
	                    puff.z = enemy.z;
	
	                    // Полноценный боевой актёр
	                    if (variable_instance_exists(enemy, "fall")
	                    &&  variable_instance_exists(enemy, "fight")
	                    &&  variable_instance_exists(enemy, "jump")
	                    &&  variable_instance_exists(enemy, "status")
	                    &&  variable_instance_exists(enemy, "vel_x")
	                    &&  variable_instance_exists(enemy, "vel_y"))
	                    {
	                        enemy.fall = 1;
	                        enemy.hit = 0;
	                        enemy.fight = 0;
	                        enemy.jump = 0;
	                        enemy.flash = 0;
	                        enemy.status = "fall";
	                        enemy.image_index = 0;
	
	                        var ang = point_direction(x, y, enemy.x, enemy.y);
	                        enemy.vel_x = lengthdir_x(knock_power, ang);
	                        enemy.vel_y = lengthdir_y(knock_power, ang);
	                    }
	                }
	            }
	        }
	
	        if (image_index >= image_number - 1)
	        {
	            image_index = 0;
	            status = "idle";
	            super = 0;
	            amy_tornado_hit_done = false;
	        }
	    }
	
	    if (super == 3)
	    {
	        if (image_index == 0)
	        {
	            super = 0;
	            back = 0;
	            status = "idle";
	        }
	    }
	}
	
			if (hero_numb=3) {
		   if (super == 1 && energy < energy_cost_super_1) super = 0;
		   if (super=1) {
			  energy -= energy_cost_super_1;
		      status="wave";
		      image_index=0;
		      super=2;
		      wav=instance_create(x, y, wave_3D);
			  direct = gm3d_direct4_cam_to_point(x, y, target.x, target.y, arena.cam_angle - 90, direct);
		      var ang  = gm3d_world_angle_from_direct(direct);
		
			  wav.vel_x = lengthdir_x(10, ang);
			  wav.vel_y = lengthdir_y(10, ang);
			  wav.z  = floor_z; // или z, если надо
		   }
		
		   if (super=2) {
		      if (image_index >= image_number - 2) {
		         super=0;
		         image_index=0;
		         status="idle";
		      }
		   }
		
		}
	
		if (hero_numb=6) {
		 if (super == 5 && energy < energy_cost_super_2) super = 0;
		 if (super=5) {
			  energy -= energy_cost_super_2;
		    status="field";
		    image_index=0;
		    super=6;
			
			
		 }
		
		 if (super=6) {
		    if (image_index=image_number - 1) {
		       image_index=0;
		       status="idle";
		       super=0;
		    }
			else
			{
				var radius = 90;
				 var tornado_damage = 30;
				 var knock_power = 20;
				for (var i = 0; i < instance_number(Terror_Squad_3D); i++)
				 {
				     var enemy = instance_find(Terror_Squad_3D, i);
				     if (!instance_exists(enemy)) continue;
				     if (!variable_instance_exists(enemy, "hp")) continue;
				     if (enemy.hp <= 0) continue;
				
				     // Не бьём врага на другом уровне высоты.
				     // Если хочешь, чтобы вихрь доставал со столба/на столб — увеличь допуск.
				     var same_level = true;
				
				     if (variable_instance_exists(enemy, "floor_z"))
				     {
				         same_level = abs(enemy.floor_z - floor_z) <= 1;
				     }
				     else
				     if (variable_instance_exists(enemy, "z"))
				     {
				         same_level = abs(enemy.z - z) <= 40;
				     }
				
				     if (!same_level) continue;
				
				     if (point_distance(x, y, enemy.x, enemy.y) <= radius)
				     {
				         enemy.hp -= tornado_damage;
				
				         var puff = instance_create(enemy.x, enemy.y, Puff_2_3D);
				         puff.z = enemy.z;
				
				         // Полноценный боевой актёр
				         if (variable_instance_exists(enemy, "fall")
				         &&  variable_instance_exists(enemy, "fight")
				         &&  variable_instance_exists(enemy, "jump")
				         &&  variable_instance_exists(enemy, "status")
				         &&  variable_instance_exists(enemy, "vel_x")
				         &&  variable_instance_exists(enemy, "vel_y"))
				         {
				             enemy.fall = 1;
				             enemy.hit = 0;
				             enemy.fight = 0;
				             enemy.jump = 0;
				             enemy.flash = 0;
				             enemy.status = "fall";
				             enemy.image_index = 0;
				
				             var ang = point_direction(x, y, enemy.x, enemy.y);
				             enemy.vel_x = lengthdir_x(knock_power, ang);
				             enemy.vel_y = lengthdir_y(knock_power, ang);
				         }
				     }
				 }	
			}
		 }
	
	}
	
	
		if (hero_numb=7) {
			
			
				if (super=1) {
		      status="telekinez";
		      image_index=0;
			  direct = gm3d_hero_direction_to_object(target, direct);
		
			  if (!instance_exists(target)) show_debug_message("Телекинез не свершился, так как исчез объект целеуказания");
		      if (instance_exists(target))
			  {
				     super=6;
					 energy -= energy_cost_super_1;
				     if (instance_exists(Terror_Squad_3D)) {
						enemy=instance_nearest(target.x, target.y, Terror_Squad_3D);
						
						if (point_distance(target.x, target.y, enemy.x, enemy.y) < 15) {
						   instance_create(target.x, target.y, freeze_3D);
						}
				     }
					 super = 2;
			  }
		   }
		
		   if (super=2) {
		      if (image_index=image_number - 1) {
		         super=0;
		         image_index=0;
		         status="idle";
		      }
		   }	
			
			
			
	   if (super == 5 && energy < energy_cost_super_1) super = 0;
	   if (super=5) {
		   // Телекинез - толчок
		   direct = gm3d_hero_direction_to_object(target, direct);
	   }
	
	   if (super=5) {
	      status="telekinez";
	      image_index=0;
		  
		  if (!instance_exists(target)) show_debug_message("Телекинез не свершился, так как исчез объект целеуказания");
	      if (instance_exists(target))
		  {
			     super=6;
				 energy -= energy_cost_super_1;
			     if (instance_exists(Terror_Squad_3D)) {
			        var enemy=instance_nearest(target.x, target.y, Terror_Squad_3D);
			
			        if (point_distance_3d(target.x, target.y, target.z, enemy.x, enemy.y, enemy.z) < 15) {
			           if (enemy.object_index == metal_sonic_3D || enemy.object_index == egg_pawn_3D || enemy.object_index == beetle_3D)
					   {
						enemy.fall=1;
						enemy.fight=0;
						enemy.jump=0;
						enemy.status="fall";
						
						var ang = point_direction(x, y, enemy.x, enemy.y);
                        enemy.vel_x = lengthdir_x(20, ang);
                        enemy.vel_y = lengthdir_y(20, ang);
					   }
			           enemy.hp -=10;
			           var puff = instance_create(target.x, target.y, Puff_1_3D);
					   puff.z = target.z;
					   
					   
					   var ang  = gm3d_world_angle_from_direct(direct);
	
					   enemy.vel_x = lengthdir_x(5, ang);
					   enemy.vel_y = lengthdir_y(5, ang);
					   
			        }
			     }
		  }
	   }
	
	   if (super=6) {
	      if (image_index=image_number - 1) {
	         super=0;
	         image_index=0;
	         status="idle";
	      }
	   }
	
	}
	
	
	///////////////////
	
	/////////////////// Граната
	
	 if (hero_numb=8 or hero_numb=9 or hero_numb=10 or hero_numb=11) {
	   if (flash=0 and fight=0 and super=0 and jump=0 and fall=0 and mouse_check_button_released(mb_left) and instance_exists(obj_sight_or_pointer) and obj_sight_or_pointer.type == 3) {
	      super=2;
	      image_index=0;
	      vel_x=0;
	      vel_y=0;
	      status="grenade";
	
	      gx=obj_sight_or_pointer.x;
	      gy=obj_sight_or_pointer.y;
		  gz=obj_sight_or_pointer.z;
	      instance_destroy(obj_sight_or_pointer);
	   }
	
	   if (super=2) {
	      if (image_index=8) {
	         var grenad = instance_create(x, y, grenade_3D);
			 grenad.z = z + global.raycast_shoot_height;
	         grenad.target_x=gx;
	         grenad.target_y=gy;
			 grenad.target_z=gz;
			 grenad.target_dist = point_distance_3d(
		     grenad.x, grenad.y, grenad.z,
		     gx, gy, gz
			 );
			 grenad.target_diff = abs(grenad.z - gz);
	         grenad.direction=point_direction(x, y, gx, gy);
	      }
	
	      if (image_index=image_number - 1) {
	         super=0;
	         status="idle";
	         image_index=0;
	      }
	   }
	}
}

gm3d_combat_tick_unit(id);

///////////////////
	
/////////////////// Рывок

if (flash == 1) 
{
	status = "flash";
	jump = 0;
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
   status="run";
   jump = 0;
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
    z += zmax / max(1, (jump_end_index - jump_start_index));
	if (z > zmax) z = zmax;
    if (floor(image_index) >= jump_end_index) jump = 3;
}
if (jump == 3) {
    if (z > floor_z) z -= zmax / max(1, (jump_end_index - jump_start_index));
    if (z <= floor_z) z = floor_z;
    if (z == floor_z) {
        jump = 0;
		z = floor_z;
        status = "idle";
        back = 0;
    }
	
	vel_x = 0;
	vel_y = 0;
	vx = 0;
	vy = 0;
}
	
	

if (status != "block" && (fight == 6 || fight == 4 || fight == 5)) { status = "block"; }
if (status == "fight" && super == 0 && fight == 0 && hit == 0) { status = "idle"; }
if (status != "idle" && super == 0 && fight == 0 && hit == 0 && jump == 0 && flash == 0 && vx == 0 && vy == 0) { status = "idle"; }
if (status != "block" && hit > 0) { status = "block"; image_index = 3; }
if (status != "fight" && (fight == 1 || fight == 2 || fight == 3)) { status = "fight"; }
if (status != "jump" && jump > 0) { status = "jump"; }
if (status != "flash" && flash > 0 && flash < 3) { status = "flash"; }
if (status != "run" && (vx > 0 || vy > 0) && jump == 0 && fight == 0 && super == 0 && hit == 0 && flash == 0) { status = "run"; }
if (z > floor_z && jump == 0 && (flash > 2 || flash == 0)) { jump = 3; status = "jump"; image_index = jump_end_index; }
if (jump > 0 && fight > 0) { fight = 0; status = "jump"; }
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

if (prev_floor_z > 0 and floor_z = 0 and flash == 0 and jump = 0 and status != "fly") {
    jump = 3;
    status = "jump";
    image_index = jump_end_index;
    anim_set = true;
}











//////


if (hero_numb !=9 and hero_numb !=10 and hero_numb !=11) {
   str=string_insert(hero_index, "_", 0);
}
else {
   if (status="kick") {
      str=string_insert("snowman", "_", 0);
   }

   else if (status="fall") {
      str=string_insert("snowman", "_", 0);
   }

   else if (status="grenade") {
      str=string_insert("snowman", "_", 0);
   }

   else str=string_insert(hero_index, "_", 0);
}

str=string_insert(str, direct, 0);
str=string_insert(str, "_", 0);
str=string_insert(str, status, 0);

sprite_index=asset_get_index(str);

if (image_index < jump_end_index and jump=3) {
   image_index=jump_end_index;
}

image_speed=0;

if (status="run" and hero_numb !=6) {
   image_index+=spd+0.2;
}

else if (status="fly" and hero_numb=1) {
   image_index++;
}

else if (status="run" and hero_numb=6) {
   image_index++;
}

else if (status="shoot" and hero_numb=10) {
   image_index+=0.25;
}

else {
   if (super !=1) {
      if (back=0) {
         image_index+=0.5;
      }

      else {
         image_index -=0.5;
      }
   }
}

// Завершаем автоматическую стрельбу бота
// только после того, как shoot-спрайт уже выбран
// и его image_number соответствует текущей анимации.
if (flash == 3 && status == "shoot")
{
    if (image_index >= image_number - 1)
    {
        image_index = 0;
        flash = 0;
        status = "idle";
    }
}

// Доработки до 3D
px=x;
py=y;
pz=z;

gm3d_combat_emit_melee(id, Terror_Squad_3D);

show_debug_message($"Объект: {hero_index} vx: {vx} vy: {vy} z: {z} status: {status} hit: {hit} flash: {flash} jump: {jump} fight: {fight} super: {super} ");