/// oPlayer3D: End Step
/// 3D-игрок для арены

//if (start=1 and hero_numb=1 and ammo < 3) {
//   ammo+=0.01;
//}

if (hero_numb != 1 && energy + 0.05 <= max_energy && /*fight == 4 &&*/ status == "block")
{ 
	energy += 0.5; 
}
else
if ((hero_numb == 1 || hero_numb == 6 || hero_numb == 11) && energy + 0.01 <= max_energy)
{ 
	energy += 0.5; 
}

if (start=0) {

   if (hero_numb==1) {
      hero_index="tails";
      hit_1_index=7;
      hit_2_index=12;
      hit_3_index=18;
      jump_start_index=6;
      jump_end_index=16;

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
      ammo = 100;
      zmax=60;
      hp=global.snowmanmaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=1 + global.team[massive_index, 6] / 10;
      damage=15 + global.team[massive_index, 6] / 10;
	  reload_time = 20;
   }

   if (hero_numb==10) {
      hero_index="snowmanrifle";
      hit_1_index=7;
      hit_2_index=9;
      hit_3_index=18;
      jump_start_index=11;
      jump_end_index=23;
	  high = 1.25;
	  ammo = 50;
      zmax=60;
      hp=global.snowmanmaxhp + global.team[massive_index, 6] / 10;
	  max_hp = hp;
      spd=1 + global.team[massive_index, 6] / 10;
      damage=15 + global.team[massive_index, 6] / 10;
	  reload_time = 30;
   }

   if (hero_numb==11) {
      hero_index="snowmanlaser";
      hit_1_index=7;
      hit_2_index=9;
      hit_3_index=18;
      jump_start_index=11;
      jump_end_index=23;
	  high = 1.25;
	  
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

if (instance_exists(oArena3D))
{
	// Использование гранат
	if (jump == 0 && flash == 0 && fight == 0 && super == 0)
	{
		if (keyboard_check_released(vk_f2) && oArena3D.grenades > 0 && !instance_exists(obj_sight_or_pointer))
		{
			var sight = instance_create(x, y, obj_sight_or_pointer);
			sight.type = 3;
		}
	}
	// Использование аптечек
	if (true /* jump == 0 && flash == 0 && fight == 0 && super == 0*/)
	{
		if (keyboard_check_released(vk_f1) && oArena3D.medkits > 0)
		{
			sound_play(medkit_using); sound_volume(medkit_using, global.soundvolume);
			oArena3D.medkits--;
			sound_type="health";
            alarm[0]=irandom_range(0, 100);
			for (var i = 0; i < instance_number(X_MAS_team_3D); i++)
			{
				var obj = instance_find(X_MAS_team_3D, i);
				var add_hp = 50;
				obj.hp += add_hp;
				if (variable_instance_exists(obj, "healed_hp") && obj.hp < obj.max_hp) obj.healed_hp += add_hp;
				obj.energy += 25;
				if (obj.hp > obj.max_hp) obj.hp = obj.max_hp;
				if (obj.energy > obj.max_energy) obj.energy = obj.max_energy;
			}
		}
	}
}

if (fall > 0 && instance_exists(obj_sight_or_pointer))
instance_destroy(obj_sight_or_pointer);

/// Движение
if (keyboard_check_released(vk_shift) and energy >= energy_cost_flash and fight=0 and fall=0 and jump=0 and super=0 and (hero_numb !=8 and hero_numb !=9 and hero_numb !=10 and hero_numb !=11)) {
   image_index=0;
   status="flash";
   flash = 1;
   energy -= energy_cost_flash;
}

if (keyboard_check(ord("W")) and flash=0 and fall=0 and fight=0 and (super=0 or (super=3 and hero_numb=4))) {
   up=1;
   down=0;

   status="run";
   direct="up";
}
else {
   up=0;
}

if (keyboard_check(ord("S")) and flash=0 and fall=0 and fight=0 and (super=0 or (super=3 and hero_numb=4))) {
   up=0;
   down=1;

   status="run";
   direct="down";
}

else {
   down=0;
}

if (keyboard_check(ord("D")) and flash=0 and fall=0 and fight=0 and (super=0 or (super=3 and hero_numb=4))) {
   right=1;
   left=0;

   status="run";
   direct="right";

}

else {
   right=0;
}

if (keyboard_check(ord("A")) and flash=0 and fall=0 and fight=0 and (super=0 or (super=3 and hero_numb=4))) {
   right=0;
   left=1;

   status="run";
   direct="left";
}

else {
   left=0;
}

/// Прыжки

var fly_pressed = keyboard_check_released(vk_space) && (hero_numb == 1 || hero_numb == 5) && energy >= energy_cost_fly;

if (keyboard_check_released(vk_space) and flash=0 and jump=0 and fight=0 and fall=0 and super=0) {
   jump=1;
   image_index=0;
}

if (jump == 1 and image_index=jump_start_index) {
   jump=2;
}

if (jump == 2)
{
    z += zmax / (jump_end_index - jump_start_index);
    if (z > floor_z + zmax) z = floor_z + zmax;

    // Если в фазе подъёма повторно отпустили Space —
    // переходим в полёт ДО обычного падения.
    if (fly_pressed)
    {
        energy -= energy_cost_fly;

        image_index = 0;
        cycle = 3;

        z = floor_z + zmax;
        jump = -2;
        status = "fly";
    }
    else
    if (image_index == jump_end_index)
    {
        jump = 3;
    }
}

if (jump == 3) {

   z -= zmax / (jump_end_index - jump_start_index);
   if (z < floor_z) z = floor_z;

   if (image_index=jump_end_index) {
      jump=3;
   }

   if (image_index=image_number - 1) {
      jump=0;
      status="idle";
   }
}


if (jump == -2)
{
    z = floor_z + zmax;
    status = "fly";

    if (image_index == image_number - 1)
    {
        cycle--;

        if (cycle <= 0)
        {
            image_index = 0;
            jump = 3;
            status = "jump";
        }
    }
}

if (jump=-1 and z > 0 and instance_exists(all_land_objects_parent)) {
   land=instance_nearest(x, y, all_land_objects_parent);

   if (distance_to_object(land) > land.image_xscale - 0.1 and distance_to_object(land) > land.image_yscale - 0.1) {
      jump=3;
   }
}

if (jump=-1) {
   if (image_index=image_number - 1) {
      status="idle";
   }
}

/////////////////////////////
if (flash=1 and hero_numb !=9 and hero_numb !=10 and hero_numb !=11) {
   var dash_speed = 10;
   var angle_dir  = 0;

   if (instance_exists(oArena3D)) {
      var arena = instance_find(oArena3D, 0);
      var angle_forward = arena.cam_angle + 180;

      angle_dir = angle_forward;

      if (direct = "up") {
         angle_dir = angle_forward;
      }
      else if (direct = "down") {
         angle_dir = angle_forward + 180;
      }
      else if (direct = "right") {
         angle_dir = angle_forward + 90;
      }
      else if (direct = "left") {
         angle_dir = angle_forward - 90;
      }

      vel_x = lengthdir_x(dash_speed, angle_dir);
      vel_y = lengthdir_y(dash_speed, angle_dir);
   }

   if (z <= floor_z + 0.1) {
      z = floor_z + zmax * 0.25;
   }

   if (image_index == image_number - 1) {
      flash = 2;
   }
}


if (flash=2) {
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

   if (vel_y > -0.2 and vel_y < 0.2) {
      vel_y=0;
   }

   if (vel_x > -0.2 and vel_x < 0.2) {
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

   //show_debug_message($"vel_x {vel_x} vel_y {vel_y} flash {flash}");


// движение от клавиш больше НЕ задаём через vel_x/vel_y
// блок с up/down/left/right->hspeed/vspeed убран

if (fight !=0) {
   vel_y=0;
   vel_x=0;
}

if (vel_x=0 and vel_y=0 and status="run" and up=0 and down=0 and left=0 and right=0 and flash=0 and fall=0 and jump<=0 and super=0 and fight=0) {
   status="idle";
}

if (jump > 0) {
   status="jump";
}

if (jump==-2) {
   status="fly";
}


/// Бой
if (keyboard_check_released(ord("O"))) {
   hero_numb++;
   start=0;

   if (hero_numb > 11) {
      hero_numb=1;
   }
}

if (keyboard_check_released(ord("Q")) && energy > energy_cost_super_1) {
   if (fight=0 and jump < 1 and flash=0 and fall=0 and super=0) {
      fight=7;
      status="kick";
      image_index=0;
      vel_x=0;
      vel_y=0;
	  energy -= energy_cost_super_1;
   }
}

if (keyboard_check_released(ord("F"))) {
   if (fight=0 and jump < 1 and flash=0 and fall=0 and super=0) {
      delay=0;
      fight=1;
      image_index=0;
	  
	  
   }
   if (jump < 1 and flash=0 and fall=0 and super=0 and fight != 4 and fight != 7) {
      delay++;
   }
}

if (keyboard_check_pressed(ord("G")) and hero_numb !=6) {

   if (fight=0 and jump < 1 and flash=0 and fall=0 and super=0) {
      fight=4;
      image_index=0;
      status="block";
      vel_x=0;
      vel_y=0;
   }
}

if (fight !=0 and super=0 and fight < 4) {

   if (fight=1 and delay > 0) {
      status="fight";

      if (image_index=hit_1_index) {
         if (delay > 1 and hit=0) {
            fight=2;
         }

         else {
            fight=0;
            status="idle";
            image_index=0;
         }
      }
   }

   if (fight=2) {
      status="fight";

      if (image_index=hit_2_index) {
         if (delay > 2 and hit=0) {
            fight=3;
         }

         else {
            fight=0;
            status="idle";
            image_index=0;
         }
      }
   }

   if (fight=3) {
      status="fight";

      if (image_index=image_number - 1) {
         fight=0;
         status="idle";
         image_index=0;
      }
   }
}

if (fight > 3) {
   if (fight=4) {
      if (image_index > 10 and hero_numb !=1) {
         fight=5;
      }

      if (image_index > 5 and hero_numb=1) {
         fight=5;
      }
   }

   if (fight=5) {
      if (image_index > 19 and hero_numb !=1) {
         back=1;
      }

      if (image_index=10 and hero_numb !=1) {
         back=0;
      }

      if (image_index > 11 and hero_numb=1) {
         back=1;
      }

      if (image_index=5 and hero_numb=1) {
         back=0;
      }
   }

   if (fight=6) {
      if (image_index=0) {
         fight=0;
         status="idle";
         back=0;
      }
   }

   if (keyboard_check_released(ord("G"))) {

      fight=6;

      if (hero_numb !=1) {
         image_index=20;
      }

      else {
         image_index=10;
      }
   }
}

if (fight=7) {
   if (image_index=image_number - 1) {
      image_index=0;
      status="idle";
      fight=0;
   }
}

if ((hero_numb=9 or hero_numb=10 or hero_numb=11) and fall=0 and jump < 1 and super=1) {
	
   if (instance_exists(sight_obj)) direct = gm3d_hero_direction_to_object(sight_obj, direct);
   if (mouse_check_button_released(mb_left)) {
      if (image_index=0) {
         flash=0;
      }
   }

   if (mouse_check_button_pressed(mb_left) and flash=0 and (reload < 1 && (hero_numb != 11 || energy > energy_cost_super_1)) and (ammo > 0 || hero_numb == 11)) {
      vel_x=0;
      vel_y=0;
      flash=1;
      image_index=0;

      rand=irandom_range(1, 2)
      if (rand=1) {
         status="shoot";
      }

      if (rand=2) {
         status="shootsit";
      }

      if (hero_numb=10) {
		 if (!instance_exists(sight_obj)) show_debug_message("Выстрел не свершился, так как исчез объект целеуказания");
		 if (instance_exists(sight_obj))
		  {
			 ammo--;
			 bull=instance_create(x, y, bullet_3D);
			 bull.z = z + global.raycast_shoot_height;
			 bull.damage=global.rifledamage;
			 bull.penetration=10;
			 rand_x=irandom_range(-0.05, 0.05);
			 rand_y=irandom_range(-0.05, 0.05);
			 bull.target_x = sight_obj.x + rand_x;
			 bull.target_y = sight_obj.y + rand_y;
			 bull.target_z = sight_obj.z;
			 if (instance_exists(Terror_Squad_3D))
			 {
				var near_target = instance_nearest(sight_obj.x, sight_obj.y, Terror_Squad_3D);
				if (point_distance_3d(sight_obj.x, sight_obj.y, sight_obj.z, near_target.x, near_target.y, near_target.z) < global.range_to_hit)
				{
					bull.target_x = near_target.x;
					bull.target_y = near_target.y;
					bull.target_z = near_target.z;
				}
			 }
			 var ray = gm3d_raycast_pillars(bull.x, bull.y, bull.z, bull.target_x, bull.target_y, bull.target_z);
			 if (is_array(ray))
			 {
				bull.target_x = ray[0];
				bull.target_y = ray[1];
				bull.target_z = ray[2];
			 }
			 bull.target_dist = point_distance_3d(bull.x, bull.y, bull.z, bull.target_x, bull.target_y, bull.target_z);
		     bull.target_diff = abs(bull.target_z - bull.z);
			 bull.target_z_delta = bull.target_z - bull.z;
			 bull.target_xy_dist = point_distance(
			     bull.x, bull.y,
			     bull.target_x, bull.target_y
			 );
			 reload = reload_time;
		  }
      }

      if (hero_numb=11) {
		 if (!instance_exists(sight_obj)) show_debug_message("Лазерный выстрел не свершился, так как пропал объект целеуказания");
         if (instance_exists(sight_obj))
		 { 
				var x1 = x;
				var y1 = y;
				var z1 = z;
				var x2 = sight_obj.x;
				var y2 = sight_obj.y;
				var z2 = sight_obj.z;
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
				
				   if (point_distance(x2, y2, enemy.x, enemy.y) < global.range_to_hit) {
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

   if (flash=1) {
      if (hero_numb=9 and image_index == 2 && ammo > 0 ) {
		 if (!instance_exists(sight_obj)) show_debug_message("Выстрел не свершился, так как исчез объект целеуказания");
		 if (instance_exists(sight_obj))
		  {
			 ammo--;
			 bull=instance_create(x, y, bullet_3D);
			 bull.z = z + global.raycast_shoot_height;
			 bull.damage=global.akdamage;
			 bull.penetration=0;
			 rand_x=irandom_range(-0.00, 0.00);
			 rand_y=irandom_range(-0.00, 0.00);
			 bull.target_x = sight_obj.x + rand_x;
			 bull.target_y = sight_obj.y + rand_y;
			 bull.target_z = sight_obj.z;
			 if (instance_exists(Terror_Squad_3D))
			 {
				var near_target = instance_nearest(sight_obj.x, sight_obj.y, Terror_Squad_3D);
				if (point_distance_3d(sight_obj.x, sight_obj.y, sight_obj.z, near_target.x, near_target.y, near_target.z) < global.range_to_hit)
				{
					bull.target_x = near_target.x;
					bull.target_y = near_target.y;
					bull.target_z = near_target.z;
				}
			 }
			 var ray = gm3d_raycast_pillars(bull.x, bull.y, bull.z, bull.target_x, bull.target_y, bull.target_z);
			 if (is_array(ray))
			 {
				bull.target_x = ray[0];
				bull.target_y = ray[1];
				bull.target_z = ray[2];
			 }
			 bull.target_dist = point_distance_3d(bull.x, bull.y, bull.z, bull.target_x, bull.target_y, bull.target_z);
		     bull.target_diff = abs(bull.target_z - bull.z);
			 bull.target_z_delta = bull.target_z - bull.z;
			 bull.target_xy_dist = point_distance(
			     bull.x, bull.y,
			     bull.target_x, bull.target_y
			 );
			 reload = reload_time;
		  }
      }
	  else
      if (hero_numb=9 and image_index == 5 && ammo > 0 ) {
         if (!instance_exists(sight_obj)) show_debug_message("Выстрел не свершился, так как исчез объект целеуказания");
		 if (instance_exists(sight_obj))
		  {
			 ammo--;
			 bull=instance_create(x, y, bullet_3D);
			 bull.z = z + global.raycast_shoot_height;
			 bull.damage=global.akdamage;
			 bull.penetration=0;
			 rand_x=irandom_range(-0.25, 0.25);
			 rand_y=irandom_range(-0.25, 0.25);
			 bull.target_x = sight_obj.x + rand_x;
			 bull.target_y = sight_obj.y + rand_y;
			 bull.target_z = sight_obj.z;
			 if (instance_exists(Terror_Squad_3D))
			 {
				var near_target = instance_nearest(sight_obj.x, sight_obj.y, Terror_Squad_3D);
				if (point_distance_3d(sight_obj.x, sight_obj.y, sight_obj.z, near_target.x, near_target.y, near_target.z) < global.range_to_hit)
				{
					bull.target_x = near_target.x;
					bull.target_y = near_target.y;
					bull.target_z = near_target.z;
				}
			 }
			 var ray = gm3d_raycast_pillars(bull.x, bull.y, bull.z, bull.target_x, bull.target_y, bull.target_z);
			 if (is_array(ray))
			 {
				bull.target_x = ray[0];
				bull.target_y = ray[1];
				bull.target_z = ray[2];
			 }
			 bull.target_dist = point_distance_3d(bull.x, bull.y, bull.z, bull.target_x, bull.target_y, bull.target_z);
		     bull.target_diff = abs(bull.target_z - bull.z);
			 bull.target_z_delta = bull.target_z - bull.z;
			 bull.target_xy_dist = point_distance(
			     bull.x, bull.y,
			     bull.target_x, bull.target_y
			 );
			 reload = reload_time;
		  }
      }
	  else
      if (hero_numb=9 and image_index == 10 && ammo > 0 ) {
         if (!instance_exists(sight_obj)) show_debug_message("Выстрел не свершился, так как исчез объект целеуказания");
		 if (instance_exists(sight_obj))
		  {
			 ammo--;
			 bull=instance_create(x, y, bullet_3D);
			 bull.z = z + global.raycast_shoot_height;
			 bull.damage=global.akdamage;
			 bull.penetration=0;
			 rand_x=irandom_range(-1.25, 1.25);
			 rand_y=irandom_range(-1.25, 1.25);
			 bull.target_x = sight_obj.x + rand_x;
			 bull.target_y = sight_obj.y + rand_y;
			 bull.target_z = sight_obj.z;
			 if (instance_exists(Terror_Squad_3D))
			 {
				var near_target = instance_nearest(sight_obj.x, sight_obj.y, Terror_Squad_3D);
				if (point_distance_3d(sight_obj.x, sight_obj.y, sight_obj.z, near_target.x, near_target.y, near_target.z) < global.range_to_hit)
				{
					bull.target_x = near_target.x;
					bull.target_y = near_target.y;
					bull.target_z = near_target.z;
				}
			 }
			 var ray = gm3d_raycast_pillars(bull.x, bull.y, bull.z, bull.target_x, bull.target_y, bull.target_z);
			 if (is_array(ray))
			 {
				bull.target_x = ray[0];
				bull.target_y = ray[1];
				bull.target_z = ray[2];
			 }
			 bull.target_dist = point_distance_3d(bull.x, bull.y, bull.z, bull.target_x, bull.target_y, bull.target_z);
		     bull.target_diff = abs(bull.target_z - bull.z);
			 bull.target_z_delta = bull.target_z - bull.z;
			 bull.target_xy_dist = point_distance(
			     bull.x, bull.y,
			     bull.target_x, bull.target_y
			 );
			 reload = reload_time;
		  }
      }
   }
}

gm3d_combat_tick_unit(id);

/// Способности
if (keyboard_check_released(vk_control) and flash=0 and fight=0 and jump < 1 and fall=0 and hero_numb !=8) {
   if (super=0) {
      super=1
	  if ((hero_numb == 1 || hero_numb == 2 || hero_numb == 6 || hero_numb == 7 || hero_numb == 9 || hero_numb == 10 || hero_numb == 11) && instance_exists(sight_obj)) { instance_destroy(sight_obj); sight_obj = noone; }
	  else
	  if (hero_numb == 1 || hero_numb == 2 || hero_numb == 6 || hero_numb == 7 || hero_numb == 9 || hero_numb == 10 || hero_numb == 11) { sight_obj = instance_create(mouse_x, mouse_y, obj_sight_or_pointer); if (hero_numb == 6 || hero_numb == 7) sight_obj.type = 4; }
	  //if (hero_numb=8 or hero_numb=9 or hero_numb=10 or hero_numb=11) {  sight_obj = instance_create(mouse_x, mouse_y, obj_sight_or_pointer); sight_obj.type = 3; }
      // бросок гранаты происходит иначе
   }
   else {
	   
	   if (instance_exists(sight_obj)) { instance_destroy(sight_obj); sight_obj = noone; }
	   
      if (super=1 and hero_numb=1 and image_index=13) {
         super=3;
      }

      if (super=1) {
         super=0;
         status="idle";
      }

      if (super=3 and hero_numb=4) {
         super=4;
      }
   }
}

if (hero_numb=1) {
   if (super=1) {
      direct = gm3d_hero_direction_to_object(sight_obj, direct);
   }

   if (super=1) {
      status="shoot";

      if (image_index !=13) {
         image_index=0;
      }

      if (mouse_check_button_released(mb_left) and energy > 10) {
         energy-=10;
         super=2;
      }
   }

   if (super=2) {
      if (image_index=18) {
		 if (!instance_exists(sight_obj)) show_debug_message("Лазерный выстрел не свершился, так как пропал объект целеуказания");
         if (instance_exists(sight_obj))
		 { 
			var x1 = x;
			var y1 = y;
			var z1 = z;
			var x2 = sight_obj.x;
			var y2 = sight_obj.y;
			var z2 = sight_obj.z;
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
			
			if (instance_exists(Terror_Squad_3D)) {
			   var enemy = instance_nearest(sight_obj.x, sight_obj.y, Terror_Squad_3D);
			
			   if (point_distance(x2, y2, enemy.x, enemy.y) < global.range_to_hit) {
			      enemy.hp -=global.laserpistoldamage;
			      var puff = instance_create(enemy.x, enemy.y, Puff_1_3D);
				  puff.z = enemy.z;
				  enemy.hit = 1;
				  enemy.status = "idle";
				  enemy.vel_x = 0;
				  enemy.vel_y = 0;
				  
			   }
			}
		 }
      }

      if (image_index=image_number - 1) {
         super=1;
         image_index=13;
      }
   }

   if (super=3) {
      if (image_index > 13) {
         image_index=13;
         back=1;
      }

      if (image_index=0) {
         back=0;
         super=0;
         status="idle";
      }
   }

}

if (hero_numb=2) {
   if (super=1 or super=2) {
      direct = gm3d_hero_direction_to_object(sight_obj, direct);
   }

   if (super=1) {
      status="shoot";
      image_index=0;

      if (mouse_check_button_pressed(mb_left) and ammo > 0) {
         super=2;
      }
   }

   if (super=2) {
      if (image_index=image_number - 1) {
         back=1;
      }

      if (image_index=9) {
         back=0;
      }
	  if (!instance_exists(sight_obj)) show_debug_message("Выстрел не свершился, так как исчез объект целеуказания");
      if (instance_exists(sight_obj))
	  {
		 ammo--;
		 bull=instance_create(x, y, bullet_3D);
		 bull.z = z + global.raycast_shoot_height;
		 bull.damage=global.minigundamage;
		 rand_x=irandom_range(-1.0, 1.0);
		 rand_y=irandom_range(-1.0, 1.0);
		 bull.target_x = sight_obj.x + rand_x;
		 bull.target_y = sight_obj.y + rand_y;
		 bull.target_z = sight_obj.z;
		 if (instance_exists(Terror_Squad_3D))
		 {
			var near_target = instance_nearest(sight_obj.x, sight_obj.y, Terror_Squad_3D);
			if (point_distance_3d(sight_obj.x, sight_obj.y, sight_obj.z, near_target.x, near_target.y, near_target.z) < global.range_to_hit)
			{
				bull.target_x = near_target.x;
				bull.target_y = near_target.y;
				bull.target_z = near_target.z;
			}
		 }
		 var ray = gm3d_raycast_pillars(bull.x, bull.y, bull.z, bull.target_x, bull.target_y, bull.target_z);
		 if (is_array(ray))
		 {
			bull.target_x = ray[0];
			bull.target_y = ray[1];
			bull.target_z = ray[2];
		 }
		 bull.target_dist = point_distance_3d(bull.x, bull.y, bull.z, bull.target_x, bull.target_y, bull.target_z);
	     bull.target_diff = abs(bull.target_z - bull.z);
		 bull.target_z_delta = bull.target_z - bull.z;
		 bull.target_xy_dist = point_distance(
		     bull.x, bull.y,
		     bull.target_x, bull.target_y
		 );
		 if (mouse_check_button_released(mb_left) or ammo < 1) {
		    super=3;
		    back=1;
			instance_destroy(sight_obj);
		 }
	  }
   }

   if (super=3) {
      if (image_index=0) {
         super=0;
         back=0;
         status="idle";
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

      var ang  = gm3d_world_angle_from_direct(direct) - 90;

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

if (hero_numb=4) {
   if (super == 1 && energy < energy_cost_super_1) super = 0;
   if (super=1) {
	  energy -= energy_cost_super_1;
      status="dig";
      image_index=0;
      super=2;
   }

   if (super=2) {
      if (image_index=30) {
         super=3;
         image_index=30;
      }
   }

   if (super=3) {
      status="dig";
      image_index=30;
   }

   if (super=4) {
      status="dig";
      back=1;

      if (image_index=0) {
         back=0;
         status="idle";
         super=0;
      }
   }

}

if (hero_numb == 5) {
   // Самохил
   if (super == 1 && energy < energy_cost_super_1) super = 0;
   if (super=1) {
	  energy -= energy_cost_super_1;
      status="block";
      image_index=0;
      super=2;
   }

   if (super=2) {
      if (image_index=10) {
         super=3;
         back=1;
      }
   }

   if (super=3) {
      if (image_index=0) {
         back=0;
         super=0;
         status="idle";
      }
   }

   if (super > 0 and super < 4 and hp < 100) {
      hp+=50;
	  if (hp > max_hp) hp = max_hp;
   }

}

if (hero_numb=6) {
   // Телепорт
   if (super == 1 && energy < energy_cost_super_1) super = 0;
   if (super=1) {
      status="kick";
      image_index=0;
      if (mouse_check_button_released(mb_left)) {
         super=2;
		 energy -= energy_cost_super_1;
      }
   }

   if (super=2) {
      if (image_index > 6) {
		  
		  
		  if (!instance_exists(sight_obj)) show_debug_message("Телепорт не свершился, так как исчез объект целеуказания");
		  if (instance_exists(sight_obj))
		  {
			 x = sight_obj.x;
			 y = sight_obj.y;
			 z = sight_obj.z;
			 floor_z = sight_obj.floor_z;
			 back = 1;
			 super = 3;
			 instance_destroy(sight_obj);
		  }
      }
   }

   if (super=3) {
      if (image_index < 2) {
		 image_index = 0;
         back=0;
         super=0;
         status="idle";
      }
   }

}

if (hero_numb=7) {
	 // Заморозка
  

   if (super=1) {
      status="telekinez";
      image_index=0;
	  direct = gm3d_hero_direction_to_object(sight_obj, direct);

	  if (!instance_exists(sight_obj)) show_debug_message("Телекинез не свершился, так как исчез объект целеуказания");
      if (instance_exists(sight_obj))
	  {
			 if (mouse_check_button_released(mb_left)) {
		     super=6;
			 energy -= energy_cost_super_1;
		     if (instance_exists(Terror_Squad_3D)) {
				var enemy=instance_nearest(sight_obj.x, sight_obj.y, Terror_Squad_3D);
				
				if (point_distance(sight_obj.x, sight_obj.y, enemy.x, enemy.y) < 15) {
				   instance_create(sight_obj.x, sight_obj.y, freeze_3D);
				}
		     }
			 super = 2;
			 instance_destroy(sight_obj);
		  }
	  }
   }

   if (super=2) {
      if (image_index=image_number - 1) {
         super=0;
         image_index=0;
         status="idle";
      }
   }

}

if (keyboard_check_released(vk_alt) and flash=0 and fight=0 and jump < 1 and fall=0 and hero_numb !=9 and hero_numb !=10 and hero_numb !=11 and hero_numb !=3 and hero_numb !=5 and hero_numb !=8) {
   if (super=0) {
      super=5
	  if ((hero_numb == 7) && instance_exists(sight_obj)) { instance_destroy(sight_obj); sight_obj = noone; }
	  else
	  if (hero_numb == 7) { sight_obj = instance_create(mouse_x, mouse_y, obj_sight_or_pointer); sight_obj.type = 4; }
   }
   else {
	  if (instance_exists(sight_obj)) { instance_destroy(sight_obj); sight_obj = noone; }
      super=0;
   }
}

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
        var hit_frame = 3;

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

if (hero_numb=4) {
   if (super == 5 && ammo < 1) super = 0;
   if (super=5) {
      status="mine";
      image_index=0;
      super=6;
   }

   if (super=6) {
      if (image_index=image_number - 1) {
         image_index=0;
         mine=instance_create(x, y, landmine_3D);
         mine.depth=depth+1;
         status="idle";
         super=0;
		 ammo--;
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
   if (super == 5 && energy < energy_cost_super_1) super = 0;
   if (super=5) {
	   // Телекинез - толчок
	   direct = gm3d_hero_direction_to_object(sight_obj, direct);
   }

   if (super=5) {
      status="telekinez";
      image_index=0;
	  
	  if (!instance_exists(sight_obj)) show_debug_message("Телекинез не свершился, так как исчез объект целеуказания");
      if (instance_exists(sight_obj))
	  {
			 if (mouse_check_button_released(mb_left)) {
		     super=6;
			 energy -= energy_cost_super_1;
		     if (instance_exists(Terror_Squad_3D)) {
		        var enemy=instance_nearest(sight_obj.x, sight_obj.y, Terror_Squad_3D);
		
		        if (point_distance_3d(sight_obj.x, sight_obj.y, sight_obj.z, enemy.x, enemy.y, enemy.z) < 15) {
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
		           var puff = instance_create(sight_obj.x, sight_obj.y, Puff_1_3D);
				   puff.z = sight_obj.z;
				   
				   
				   var ang  = gm3d_world_angle_from_direct(direct) - 90;

				   enemy.vel_x = lengthdir_x(5, ang);
				   enemy.vel_y = lengthdir_y(5, ang);
				   
		        }
		     }
			 instance_destroy(sight_obj);
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

// Бросок гранаты
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

// Нокдаун всегда сильнее драки, рывка и ввода.
// Если персонажа сбили — он не имеет права оставаться в fight.
if (fall != 0 || status == "fall")
{
    fight = 0;
    delay = 0;
    flash = 0;
    hit = 0;

    up = 0;
    down = 0;
    left = 0;
    right = 0;

    status = "fall";
}

/// ДВИЖЕНИЕ В МИРЕ + КОЛЛИЗИЯ СО СТОЛБАМИ

var run_x = 0;
var run_y = 0;

if (flash = 0 and fall = 0 and (super == 0 || (hero_numb == 4 && (super == 1 || super == 2 || super == 3 || super == 4))) and fight = 0) {
    if (right = 1) run_x += 1;
    if (left  = 1) run_x -= 1;
    if (up    = 1) run_y -= 1;
    if (down  = 1) run_y += 1;
}

// в полёте / прыжке можем проходить сквозь столбы
var airborne =
    (jump > 0)
    || (status == "fly")
    || (z > floor_z + 0.1 && fall != 0);
// Рывок — не настоящий полёт через препятствия.
// Даже если flash слегка поднимает z, столбы должны его блокировать.
if (flash > 0 && fall == 0 && status != "fly")
{
    airborne = false;
}

var base_step_x = 0;
var base_step_y = 0;

if (run_x != 0 or run_y != 0) {
    var len = sqrt(run_x*run_x + run_y*run_y);
    if (len != 0) {
        run_x /= len;
        run_y /= len;
    }

    var angle_forward = 0;
    if (instance_exists(oArena3D)) {
        var arena = instance_find(oArena3D, 0);
        angle_forward = arena.cam_angle + 180;
    }

    var fx = lengthdir_x(1, angle_forward);
    var fy = lengthdir_y(1, angle_forward);
    var rx = lengthdir_x(1, angle_forward + 90);
    var ry = lengthdir_y(1, angle_forward + 90);

    base_step_x = (fx * (-run_y) + rx * run_x) * spd;
    base_step_y = (fy * (-run_y) + ry * run_x) * spd;
}

var step_imp_x = vel_x;
var step_imp_y = vel_y;

var step_x = base_step_x + step_imp_x;
var step_y = base_step_y + step_imp_y;

var new_x = x;
var new_y = y;

// по X
if (step_x != 0) {
    var test_x = x + step_x;
    var block_x = false;

		var solid_pillars =
		!airborne
		&& fall == 0
		&& jump == 0
		&& status != "fall"
		&& status != "fly"
		&& floor_z < global.pillar_height - 0.1;
	    if (solid_pillars && is_array(global.arena_pillars)) {
	    var n = array_length(global.arena_pillars);
	    var size = global.pillar_size;
	    var half = size * 0.5;
	
	    for (var i = 0; i < n; i++) {
	        var p = global.arena_pillars[i];
	        if (abs(test_x - p.x) < half + col_radius && abs(y - p.y) < half + col_radius) {
	            block_x = true;
	            break;
	        }
	    }
	}


    if (!block_x) {
        new_x = test_x;
    }
}

// по Y
if (step_y != 0) {
    var test_y = y + step_y;
    var block_y = false;

    if (!airborne && floor_z < global.pillar_height - 0.1 && is_array(global.arena_pillars)) {
        var n2 = array_length(global.arena_pillars);
        var size2 = global.pillar_size;
        var half2 = size2 * 0.5;

        for (var j = 0; j < n2; j++) {
            var p2 = global.arena_pillars[j];
            if (abs(new_x - p2.x) < half2 + col_radius && abs(test_y - p2.y) < half2 + col_radius) {
                block_y = true;
                break;
            }
        }
    }

    if (!block_y) {
        new_y = test_y;
    }
}


x = new_x;
y = new_y;

// Аварийный unstuck: если наземный персонаж оказался внутри бокса столба,
// вытолкнуть его к ближайшей стороне.
if (fall == 0 && jump == 0 && status != "fly" && is_array(global.arena_pillars))
{
    var n_un = array_length(global.arena_pillars);
    var size_un = global.pillar_size;
    var half_un = size_un * 0.5 + col_radius;

    for (var u = 0; u < n_un; u++)
    {
        var pp_un = global.arena_pillars[u];

        var dx_un = x - pp_un.x;
        var dy_un = y - pp_un.y;

        if (abs(dx_un) < half_un && abs(dy_un) < half_un && floor_z < global.pillar_height - 0.1)
        {
            var push_x = half_un - abs(dx_un);
            var push_y = half_un - abs(dy_un);

            if (push_x < push_y)
            {
                if (dx_un >= 0) x = pp_un.x + half_un;
                else            x = pp_un.x - half_un;
            }
            else
            {
                if (dy_un >= 0) y = pp_un.y + half_un;
                else            y = pp_un.y - half_un;
            }

            vel_x = 0;
            vel_y = 0;
            break;
        }
    }
}

// пол под игроком и высота
if (true) { // !airborne
    var new_floor_z = 0;

    if (is_array(global.arena_pillars)) {
        var n3 = array_length(global.arena_pillars);
        var size3 = global.pillar_size;
        var half3 = size3 * 0.5;

        for (var k = 0; k < n3; k++) {
            var pp = global.arena_pillars[k];
            if (abs(x - pp.x) < half3 && abs(y - pp.y) < half3) {
                new_floor_z = global.pillar_height;
                break;
            }
        }
    }

    var prev_floor_z = floor_z;
    floor_z = new_floor_z;

    if (prev_floor_z > 0 && floor_z == 0 && flash == 0 && fall == 0 && status != "fall")
	{
	    jump = 3;
	    status = "jump";
	    image_index = jump_end_index;
	}

    if (floor_z > z) z = floor_z;
}


// статус run/idle
if (flash = 0 and fall = 0 and jump == 0 and super = 0 and fight = 0) {
    if (run_x != 0 or run_y != 0) {
        status = "run";
    } else {
        if (status == "run") status = "idle";
    }
}

// позиция для тени и 2D-проекций
shadow_x = x;
shadow_y = y;
screen_x = x;
screen_y = y;



/// Анимация
/*

// В 3D - не нужны, масштабирование уже происходит ареной

if (hero_numb=1) {
   image_xscale=1;
   image_yscale=1;
}

if (hero_numb=2) {
   if (direct="left") {
      image_xscale=1.1;
      image_yscale=1.1;
   }

   else if (direct="down") {
      image_xscale=1.2;
      image_yscale=1.2;
   }

   else if (direct="right") {
      image_xscale=1.1;
      image_yscale=1.1;
   }

   else {
      image_xscale=1;
      image_yscale=1;
   }
}

if (hero_numb=3) {
   if (direct="left") {
      image_xscale=1.1;
      image_yscale=1.1;
   }

   else if (direct="down") {
      image_xscale=1.2;
      image_yscale=1.2;
   }

   else if (direct="right") {
      image_xscale=1.1;
      image_yscale=1.1;
   }

   else {
      image_xscale=1;
      image_yscale=1;
   }
}

if (hero_numb=4) {
   if (direct="down" or direct="left") {
      image_xscale=1.2;
      image_yscale=1.2;
   }

   else {
      image_xscale=1;
      image_yscale=1;
   }
}

if (hero_numb=5) {
   if (direct="left") {
      image_xscale=1.2;
      image_yscale=1.2;
   }

   else {
      image_xscale=1;
      image_yscale=1;
   }
}

if (hero_numb=6) {
   if (direct="left") {
      image_xscale=1.1;
      image_yscale=1.1;
   }

   else if (direct="down") {
      image_xscale=1.2;
      image_yscale=1.2;
   }

   else if (direct="right") {
      image_xscale=1.1;
      image_yscale=1.1;
   }

   else {
      image_xscale=1;
      image_yscale=1;
   }
}

if (hero_numb=7) {
   if (direct="left") {
      image_xscale=1.1;
      image_yscale=1.1;
   }

   else if (direct="down") {
      image_xscale=1.2;
      image_yscale=1.2;
   }

   else if (direct="right") {
      image_xscale=1.1;
      image_yscale=1.1;
   }

   else {
      image_xscale=1;
      image_yscale=1;
   }
}

if (hero_numb=8 or hero_numb=9 or hero_numb=10 or hero_numb=11) {
   if (direct="right") {
      image_xscale=1.1;
      image_yscale=1.1;
   }

   else {
      image_xscale=1;
      image_yscale=1;
   }
}

*/

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

// Стрельба снеговиков должна анимироваться даже при super == 1,
// иначе кадры выстрела никогда не наступят.
else if ((status == "shoot" || status == "shootsit")
         && (hero_numb == 9 || hero_numb == 11))
{
    image_index += 0.5;
}

// Винтовочный снеговик и раньше был более медленным в стрельбе.
else if ((status == "shoot" || status == "shootsit")
         && hero_numb == 10)
{
    image_index += 0.25;
}

else
{
    if (super != 1)
    {
        if (back == 0)
        {
            image_index += 1;
        }
        else
        {
            image_index -= 1;
        }
    }
}

// Завершение стрелковой анимации игрока.
// У игрока автоматическая/винтовочная/лазерная стрельба сидит на flash == 1.
if (flash == 1
    && (status == "shoot" || status == "shootsit")
    && (hero_numb == 9 || hero_numb == 10 || hero_numb == 11))
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