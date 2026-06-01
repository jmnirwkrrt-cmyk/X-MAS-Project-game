/// @description  удары
depth=room_height - y;

for (var i = 0; i < instance_number(Terror_Squad_3D); i++)
{

	var enemy = instance_find(Terror_Squad_3D, i);
	
	if (instance_exists(enemy) && point_distance_3d(x, y, z, enemy.x, enemy.y, enemy.z) < global.range_to_hit) {
	
	   if (enemy.z == z and enemy.fight > 0 and (enemy.fight < 4 or enemy.fight > 7)) {
	     var rand=irandom_range(0, 10);
	
	      if (jump=0 and ((flash == 0 or flash == 3)/* or (hero_numb ==9 or hero_numb ==10 and hero_numb ==11)*/) and fall=0 and fight !=5 and (super !=2 or hero_numb=4)) {
	         if ((hero_numb !=5 or rand < 6)/* and status != "block"*/) {
	            jump=0;
	            flash=0;
	            super=0;
	            status="idle";
	
	            if (enemy.image_index == enemy.hit_1_index) {
	               randx=irandom_range(-10, 10);
	               randy=irandom_range(-10, 10);
	               var puff = instance_create(x + randx, y + randy, Puff_1_3D);
				   puff.z = z;
	               hit=1;
	               vel_y=0;
	               vel_x=0;
	               hp -=enemy.damage;
				   super = 0;
				   if (object_index == oPlayer3D) instance_destroy(obj_sight_or_pointer);
	            }
	
	            if (enemy.image_index == enemy.hit_2_index) {
	               randx=irandom_range(-20, 20);
	               randy=irandom_range(-20, 20);
	               var puff = instance_create(x + randx, y + randy, Puff_2_3D);
				   puff.z = z;
	               hit=1;
	               vel_y=0;
	               vel_x=0;
	               hp -=enemy.damage;
				   super = 0;
				   if (object_index == oPlayer3D) instance_destroy(obj_sight_or_pointer);
	            }
	
	            if (enemy.image_index=enemy.hit_3_index or (enemy.image_index=7 and enemy.fight=9)) {
	               hit=0;
	               vel_y=0;
	               vel_x=0;
	               hp -=enemy.damage;
				   super = 0;
				   if (object_index == oPlayer3D) instance_destroy(obj_sight_or_pointer);
				   if (enemy.object_index == metal_sonic_3D || enemy.object_index == egg_pawn_3D)
	               fall=1;
				   status = "fall";
	               randx=irandom_range(-20, 20);
	               randy=irandom_range(-20, 20);
	               var puff = instance_create(x + randx, y + randy, Puff_1_3D);
				   puff.z = z;
	
	               if (x > enemy.x) {
	                  vel_x=5;
	               }
	
	               if (x < enemy.x) {
	                  vel_x=-5;
	               }
	
	               if (y > enemy.y) {
	                  vel_y=-5;
	               }
	
	               if (y < enemy.y) {
	                  vel_y=5;
	               }
	            }
	         }
	         else {
	            var ring = instance_create(x, y, Blue_Ring_3D);
				ring.z = z;
	         }
			 
			 break;
	      }
	
	      else {
	         if (fight=5 and (enemy.image_index == enemy.hit_1_index or enemy.image_index == enemy.hit_2_index or enemy.image_index == enemy.hit_3_index)) {
	            randx=irandom_range(-10, 10);
	            randy=irandom_range(-10, 10);
	            var ring = instance_create(x + randx, y + randy, Blue_Ring_3D);
				ring.z = z;
	         }
	      }
		  
	   }
	}
}

/// озвучка

/////////////// фразы
var rand=irandom_range(0, 10);
var rand_time=irandom_range(0, 100);

if (hero_numb !=9 and hero_numb !=8 and hero_numb !=10 and hero_numb !=11) {
   if (hero_numb=1) {
      hit_s=tails_hit;
      go=tails_go;
      attack=tails_attack;
      win=tails_win;
      bplas=tails_bpla;
      deaths=tails_death;
   }

   if (hero_numb=2) {
      hit_s=amy_hit;
      go=amy_go;
      attack=amy_attack;
      win=amy_win;
      tornado=amy_tornado;
      deaths=amy_death;
   }

   if (hero_numb=3) {
      hit_s=sonic_hit;
      go=sonic_go;
      attack=sonic_attack;
      win=sonic_win;
      waves=sonic_wave;
      deaths=sonic_death;
   }

   if (hero_numb=4) {
      hit_s=knuckles_hit;
      go=knuckles_go;
      attack=knuckles_attack;
      win=knuckles_win;
      deaths=knuckles_death;
   }

   if (hero_numb=5) {
      hit_s=rouge_hit;
      go=rouge_go;
      attack=rouge_attack;
      win=rouge_win;
      deaths=rouge_death;
   }

   if (hero_numb=6) {
      hit_s=shadow_hit;
      go=shadow_go;
      attack=shadow_attack;
      win=shadow_win;
      deaths=shadow_death;
      field=shadow_field;
   }

   if (hero_numb=7) {
      hit_s=silver_hit;
      go=silver_go;
      attack=silver_attack;
      win=silver_win;
      deaths=silver_death;
   }

   if (startsound=0 and sprite_index !=bpla_sprite) {
      sound_play(go);
      sound_volume(go, global.voicevolume);
      startsound=1;
   }

   if (hp < 1 and sprite_index !=bpla_sprite) {
      sound_play(deaths);
      sound_volume(deaths, global.voicevolume);
   }

   if (hit=2 and image_index=0 and sprite_index !=bpla_sprite and rand < 4) {
      sound_play(hit_s);
      sound_volume(hit_s, global.voicevolume);
   }

   if (hero_numb=2 and status="tornado" and image_index=1) {
      sound_play(tornado);
      sound_volume(tornado, global.voicevolume);
   }

   if (hero_numb=6 and status="field" and image_index=1) {
      sound_play(field);
      sound_volume(field, global.voicevolume);
   }

   if (hero_numb=1 and status="unpack" and image_index=1) {
      sound_play(bplas);
      sound_volume(bplas, global.voicevolume);
   }

   if (hero_numb=3 and status="wave" and image_index=1) {
      sound_play(waves);
      sound_volume(waves, global.voicevolume);
   }

   if (status="fight" and image_index=hit_3_index and rand < 6 and sprite_index !=bpla_sprite) {
      sound_play(attack);
      sound_volume(attack, global.voicevolume);
   }

   if (!instance_exists(Terror_Squad_3D)) {
      if (sound_type !="victory" and sprite_index !=bpla_sprite) {
         sound_type="victory";
         alarm[0]=rand_time;
      }
   }

}

else {
   kill_1=soviet_kill_1;
   kill_2=soviet_kill_2;
   kill_3=soviet_kill_3;
   kill_4=soviet_kill_4;
   landmine_alarm=soviet_landmine;
   lost_ally_1=soviet_lost_ally_1;
   lost_ally_2=soviet_lost_ally_2;
   placement_1=soviet_placement_1;
   placement_2=soviet_placement_2;
   placement_3=soviet_placement_3;
   placement_4=soviet_placement_4;
   placement_5=soviet_placement_5;
   won_1=soviet_won_1;
   won_2=soviet_won_2;
   won_3=soviet_won_3;
   won_4=soviet_won_4;
   won_5=soviet_won_5;
   attack_1=soviet_attack_1;
   attack_2=soviet_attack_2;
   attack_3=soviet_attack_3;
   attack_4=soviet_attack_4;
   death_1=soviet_death_1;
   death_2=soviet_death_2;
   explosion_alarm=soviet_explosion_1;
   heal_1=soviet_heal_1;
   heal_2=soviet_heal_2;
   idle_1=soviet_idle_1;
   too_many_1=soviet_too_many_1;
   too_many_2=soviet_too_many_2;

   if (startsound=0) {
      r=irandom_range(0, 4);

      if (r=0) {
         sound_play(placement_1);
         sound_volume(placement_1, global.voicevolume);
      }

      if (r=1) {
         sound_play(placement_2);
         sound_volume(placement_2, global.voicevolume);
      }

      if (r=2) {
         sound_play(placement_3);
         sound_volume(placement_3, global.voicevolume);
      }

      if (r=3) {
         sound_play(placement_4);
         sound_volume(placement_4, global.voicevolume);
      }

      if (r=4) {
         sound_play(placement_5);
         sound_volume(placement_5, global.voicevolume);
      }

      startsound=1;
   }

   if (hp < 1) {
      r=irandom_range(0, 1);

      if (r=0) {
         sound_play(death_1);
         sound_volume(death_1, global.voicevolume);
      }

      if (r=1) {
         sound_play(death_2);
         sound_volume(death_2, global.voicevolume);
      }
   }

   if (instance_exists(Terror_Squad_3D)) {
      if (status="run" and sound_type !="attack" and rand < 5) {
         sound_type="attack";
         alarm[0]=rand_time;
      }

      if (sound_type="attack" and enemy.hp < 20 and rand < 5) {
         sound_type="kill";
         alarm[0]=rand_time;
      }

      if (sound_type !="too_many" and rand < 5) {
         enemy_counts=0;
         var i;

         for (i=0; i < instance_number(Terror_Squad_3D); i +=1) {
            enemys[i]=instance_find(Terror_Squad_3D, i);

            if (point_distance_3d(x, y, z, enemys[i].x, enemys[i].y, enemys[i].z) < 100) {
               enemy_counts++;
            }
         }

         if (enemy_counts > 2 or hp < 20) {
            sound_type="too_many";
            alarm[0]=rand_time;
         }
      }

      if (instance_exists(X_MAS_ally_3D)) {
         if (instance_exists(death_3D)) {
            var deat = instance_nearest(x, y, death_3D);

            if (point_distance_3d(x, y, z, deat.x, deat.y, deat.z) < 50 and deat.index="tails" or deat.index="amy" or deat.index="sonic" or deat.index="knuckles" or deat.index="rouge" or deat.index="silver" or deat.index="shadow" or deat.index="snowman") {
               if (sound_type !="ally_lost" and rand < 5) {
                  sound_type="ally_lost";
                  alarm[0]=rand_time;
               }
            }
         }
      }

      if (instance_exists(landmine_3D)) {
         deat=instance_nearest(x, y, landmine_3D);

         if (point_distance_3d(x, y, z, deat.x, deat.y, deat.z) < 50) {
            if (sound_type !="landmine_alarm" and rand < 5) {
               sound_type="landmine_alarm";
               alarm[0]=rand_time;
            }
         }
      }

      if (instance_exists(Explode_3D)) {
         deat=instance_nearest(x, y, Explode_3D);

         if (point_distance_3d(x, y, z, deat.x, deat.y, deat.z) < 50) {
            if (sound_type !="explosion_alarm" and rand < 5) {
               sound_type="explosion_alarm";
               alarm[0]=rand_time;
            }
         }
      }

   }

   else {
      if (sound_type !="won" and rand < 5) {
         sound_type="won";
         alarm[0]=rand_time;
      }
   }

}


/////////////// общее

if (status="run" and hero_numb !=6) {
   if (image_index=10) {
      sound_play(step_gravel);
      sound_volume(step_gravel, global.soundvolume);
   }

   if (image_index=20) {
      sound_play(step_gravel);
      sound_volume(step_gravel, global.soundvolume);
   }

   if (image_index=30) {
      sound_play(step_gravel);
      sound_volume(step_gravel, global.soundvolume);
   }

   if (image_index=40) {
      sound_play(step_gravel);
      sound_volume(step_gravel, global.soundvolume);
   }

   if (image_index=50) {
      sound_play(step_gravel);
      sound_volume(step_gravel, global.soundvolume);
   }

   if (image_index=60) {
      sound_play(step_gravel);
      sound_volume(step_gravel, global.soundvolume);
   }

   //if (image_index = 17) { sound_play(step_gravel); sound_volume(step_gravel, global.soundvolume); }
   //if (image_index = 48 or (image_index = 42 and (hero_numb = 8 or hero_numb = 3 or hero_numb = 5 or hero_numb = 9 or hero_numb = 10 or hero_numb = 11))) { sound_play(step_gravel); sound_volume(step_gravel, global.soundvolume); }

}

if (hit=2 and image_index=1) {
   sound_play(hit_sound);
   sound_volume(hit_sound, global.soundvolume);
}

if (status="jump" and image_index=13) {
   sound_play(jump_sound);
   sound_volume(jump_sound, global.soundvolume);
}

if (hero_numb=2 and super=2 and !sound_isplaying(machinegun_long)) {
   sound_play(machinegun_long);
   sound_volume(machinegun_long, global.soundvolume);
}

if (super !=2 and hero_numb=2 and sound_isplaying(machinegun_long)) {
   sound_stop(machinegun_long);
}

if (hero_numb=10 and flash !=0 and image_index=1) {
   sound_play(shoot_long);
   sound_volume(shoot_long, global.soundvolume);
}

if (hero_numb=9 and flash !=0 and (image_index=1 or image_index=5 or image_index=10)) {
   sound_play(shoot_fast);
   sound_volume(shoot_fast, global.soundvolume);
}





/////////////// смерть

if (hp < 1) {
   randx=irandom_range(-15, 15);
   randy=irandom_range(-15, 15);
   var puff = instance_create(x + randx, y + randy, Puff_1_3D);
	puff.z = z;
   randx=irandom_range(-15, 15);
   randy=irandom_range(-15, 15);
   puff = instance_create(x + randx, y + randy, Puff_2_3D);
	puff.z = z;
   randx=irandom_range(-15, 15);
   randy=irandom_range(-15, 15);
   puff = instance_create(x + randx, y + randy, Puff_1_3D);
	puff.z = z;
   randx=irandom_range(-15, 15);
   randy=irandom_range(-15, 15);
   puff = instance_create(x + randx, y + randy, Puff_2_3D);
	puff.z = z;
   var deat=instance_create(x, y, death_3D);
	deat.z = z;
   status="fall";
   str=string_insert(hero_index, "_", 0);
   str=string_insert(str, direct, 0);
   str=string_insert(str, "_", 0);
   str=string_insert(str, status, 0);
   deat.sprite_index=asset_get_index(str);
   deat.index=hero_index;
   deat.image_index=0;
   deat.image_speed=0.5;
   instance_destroy(self);
}