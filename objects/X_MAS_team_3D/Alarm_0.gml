if (hero_numb !=9 and hero_numb !=8 and hero_numb !=10 and hero_numb !=11) {

   if (sound_type="victory") {
      sound_play(win);
      sound_volume(win, global.voicevolume);
   }


}

else {
   if (sound_type="attack") {
      r=irandom_range(0, 3);

      if (r=0) {
         sound_play(attack_1);
         sound_volume(attack_1, global.voicevolume);
      }

      if (r=1) {
         sound_play(attack_2);
         sound_volume(attack_2, global.voicevolume);
      }

      if (r=2) {
         sound_play(attack_3);
         sound_volume(attack_3, global.voicevolume);
      }

      if (r=3) {
         sound_play(attack_4);
         sound_volume(attack_4, global.voicevolume);
      }
   }

   if (sound_type="kill") {
      r=irandom_range(0, 3);

      if (r=0) {
         sound_play(kill_1);
         sound_volume(kill_1, global.voicevolume);
      }

      if (r=1) {
         sound_play(kill_2);
         sound_volume(kill_2, global.voicevolume);
      }

      if (r=2) {
         sound_play(kill_3);
         sound_volume(kill_3, global.voicevolume);
      }

      if (r=3) {
         sound_play(kill_4);
         sound_volume(kill_4, global.voicevolume);
      }
   }

   if (sound_type="too_many") {
      r=irandom_range(0, 1);

      if (r=0) {
         sound_play(too_many_1);
         sound_volume(too_many_1, global.voicevolume);
      }

      if (r=1) {
         sound_play(too_many_2);
         sound_volume(too_many_2, global.voicevolume);
      }
   }

   if (sound_type="ally_lost") {
      r=irandom_range(0, 1);

      if (r=0) {
         sound_play(lost_ally_1);
         sound_volume(lost_ally_1, global.voicevolume);
      }

      if (r=1) {
         sound_play(lost_ally_2);
         sound_volume(lost_ally_2, global.voicevolume);
      }
   }

   if (sound_type="landmine_alarm") {
      sound_play(landmine_alarm);
      sound_volume(landmine_alarm, global.voicevolume);
   }

   if (sound_type="explosion_alarm") {
      sound_play(explosion_alarm);
      sound_volume(explosion_alarm, global.voicevolume);
   }

   if (sound_type="won") {
      r=irandom_range(0, 4);

      if (r=0) {
         sound_play(won_1);
         sound_volume(won_1, global.voicevolume);
      }

      if (r=1) {
         sound_play(won_2);
         sound_volume(won_2, global.voicevolume);
      }

      if (r=2) {
         sound_play(won_3);
         sound_volume(won_3, global.voicevolume);
      }

      if (r=3) {
         sound_play(won_4);
         sound_volume(won_4, global.voicevolume);
      }

      if (r=4) {
         sound_play(won_5);
         sound_volume(won_5, global.voicevolume);
      }
   }

   if (sound_type="health") {
      r=irandom_range(0, 1);

      if (r=0) {
         sound_play(heal_1);
         sound_volume(heal_1, global.voicevolume);
      }

      if (r=1) {
         sound_play(heal_2);
         sound_volume(heal_2, global.voicevolume);
      }
   }

}