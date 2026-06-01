/// @description  удары
depth=room_height - y;

/// --- общий лимитер озвучки союзников ---
gm3d_voice_begin_frame();

var voice_rank = gm3d_ally_voice_rank(id);

// Простой вариант: право на голос имеют только первые 5 союзников.
// Остальные не молчат механически навсегда по звукам шагов/оружия,
// но именно голосовые реплики не запускают.
var voice_allowed_unit = (voice_rank >= 0 && voice_rank < 5);

// Чтобы смерть не озвучивалась несколько раз, если объект почему-то проживёт ещё кадр.
if (!variable_instance_exists(id, "voice_death_done"))
{
    voice_death_done = false;
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

   if (startsound == 0 && sprite_index != bpla_sprite)
	{
	    if (voice_allowed_unit)
	    {
	        gm3d_voice_play(go, global.voicevolume, 1, 0);
	    }
	
	    startsound = 1;
	}

   if (hp < 1 and sprite_index !=bpla_sprite) {
	   if (voice_allowed_unit)
	    {
	        gm3d_voice_play(deaths, global.voicevolume, 1, 0);
	    }
      //sound_play(deaths);
      //sound_volume(deaths, global.voicevolume);
   }

   if (hit=2 and image_index=0 and sprite_index !=bpla_sprite and rand < 4) {
	   if (voice_allowed_unit)
	    {
	        gm3d_voice_play(hit_s, global.voicevolume, 1, 0);
	    }
      //sound_play(hit_s);
      //sound_volume(hit_s, global.voicevolume);
   }

   if (hero_numb=2 and status="tornado" and image_index=1) {
	   if (voice_allowed_unit)
	    {
	        gm3d_voice_play(tornado, global.voicevolume, 1, 0);
	    }
      //sound_play(tornado);
      //sound_volume(tornado, global.voicevolume);
   }

   if (hero_numb=6 and status="field" and image_index=1) {
	   if (voice_allowed_unit)
	    {
	        gm3d_voice_play(field, global.voicevolume, 1, 0);
	    }
      //sound_play(field);
      //sound_volume(field, global.voicevolume);
   }

   if (hero_numb=1 and status="unpack" and image_index=1) {
	   if (voice_allowed_unit)
	    {
	        gm3d_voice_play(bplas, global.voicevolume, 1, 0);
	    }
      //sound_play(bplas);
      //sound_volume(bplas, global.voicevolume);
   }

   if (hero_numb=3 and status="wave" and image_index=1) {
	   if (voice_allowed_unit)
	    {
	        gm3d_voice_play(waves, global.voicevolume, 1, 0);
	    }
      //sound_play(waves);
      //sound_volume(waves, global.voicevolume);
   }

   if (status="fight" and image_index=hit_3_index and rand < 6 and sprite_index !=bpla_sprite) {
	   if (voice_allowed_unit)
	    {
	        gm3d_voice_play(attack, global.voicevolume, 1, 0);
	    }
      //sound_play(attack);
      //sound_volume(attack, global.voicevolume);
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
		  if (voice_allowed_unit)
			{
			    gm3d_voice_play(placement_1, global.voicevolume, 1, 0);
			}
         //sound_play(placement_1);
         //sound_volume(placement_1, global.voicevolume);
      }

      if (r=1) {
		   if (voice_allowed_unit)
			{
			    gm3d_voice_play(placement_2, global.voicevolume, 1, 0);
			}
         //sound_play(placement_2);
         //sound_volume(placement_2, global.voicevolume);
      }

      if (r=2) {
		   if (voice_allowed_unit)
			{
			    gm3d_voice_play(placement_3, global.voicevolume, 1, 0);
			}
         //sound_play(placement_3);
         //sound_volume(placement_3, global.voicevolume);
      }

      if (r=3) {
		   if (voice_allowed_unit)
			{
			    gm3d_voice_play(placement_4, global.voicevolume, 1, 0);
			}
         //sound_play(placement_4);
         //sound_volume(placement_4, global.voicevolume);
      }

      if (r=4) {
		   if (voice_allowed_unit)
			{
			    gm3d_voice_play(placement_5, global.voicevolume, 1, 0);
			}
         //sound_play(placement_5);
         //sound_volume(placement_5, global.voicevolume);
      }

      startsound=1;
   }

   if (hp < 1) {
      r=irandom_range(0, 1);

      if (r=0) {
		   if (voice_allowed_unit)
			{
			    gm3d_voice_play(death_1, global.voicevolume, 1, 0);
			}
         //sound_play(death_1);
         //sound_volume(death_1, global.voicevolume);
      }

      if (r=1) {
		  if (voice_allowed_unit)
			{
			    gm3d_voice_play(death_2, global.voicevolume, 1, 0);
			}
         //sound_play(death_2);
         //sound_volume(death_2, global.voicevolume);
      }
   }

   if (instance_exists(Terror_Squad_3D)) {
	   var enemy = instance_nearest(x, y, Terror_Squad_3D);
      if (status="run" and sound_type !="attack" and rand < 5) {
         sound_type="attack";
         alarm[0]=rand_time;
      }

      if (sound_type="attack" and enemy.hp < 20 and rand < 5) {
         sound_type="kill";
         alarm[0]=rand_time;
      }

      if (sound_type !="too_many" and rand < 5) {
         var enemy_counts=0;
         var i;

         for (i=0; i < instance_number(Terror_Squad_3D); i +=1) {
            var enemys = instance_find(Terror_Squad_3D, i);

            if (point_distance_3d(x, y, z, enemys.x, enemys.y, enemys.z) < 100) {
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
         var deat=instance_nearest(x, y, landmine_3D);

         if (point_distance_3d(x, y, z, deat.x, deat.y, deat.z) < 50) {
            if (sound_type !="landmine_alarm" and rand < 5) {
               sound_type="landmine_alarm";
               alarm[0]=rand_time;
            }
         }
      }

      if (instance_exists(Explode_3D)) {
         var deat= instance_nearest(x, y, Explode_3D);

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

   //if (image_index = 17) { //sound_play(step_gravel); //sound_volume(step_gravel, global.soundvolume); }
   //if (image_index = 48 or (image_index = 42 and (hero_numb = 8 or hero_numb = 3 or hero_numb = 5 or hero_numb = 9 or hero_numb = 10 or hero_numb = 11))) { //sound_play(step_gravel); //sound_volume(step_gravel, global.soundvolume); }

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
   deat.high = high;
   deat.image_index=0;
   deat.image_speed=0.5;
   instance_destroy(self);
}