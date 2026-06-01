depth = room_height - y;


if (instance_exists(X_MAS_team))
{
enemy = instance_nearest(x,y, X_MAS_team);

if (enemy.fight > 0 and (enemy.fight < 4 or enemy.fight > 6) and distance_to_object(enemy) < 30)
{  
if (jump = 0 and flash = 0 and fall = 0 and fight != 5)
{
jump = 0;
flash = 0;
fight = 0;

if (enemy.image_index = enemy.hit_1_index) { randx = irandom_range(-20, 20); randy = irandom_range(-20, 20); instance_create(x + randx, y + randy, Puff_1); hit = 1; vspeed = 0; hspeed = 0; hp -= enemy.damage; }
if (enemy.image_index = enemy.hit_2_index) { randx = irandom_range(-20, 20); randy = irandom_range(-20, 20); instance_create(x + randx, y + randy, Puff_2); hit = 1; vspeed = 0; hspeed = 0; hp -= enemy.damage; }
if (enemy.image_index = enemy.hit_3_index or (enemy.image_index = 8 and enemy.fight = 7 and ((x > enemy.x and enemy.direct = "left") or (x < enemy.x and enemy.direct = "right") or (y > enemy.y and enemy.direct = "up") or (y < enemy.y and enemy.direct = "down")))) { hit = 0; vspeed = 0; hspeed = 0; hp -= enemy.damage; 
fall = 1;
randx = irandom_range(-20, 20); randy = irandom_range(-20, 20); instance_create(x + randx, y + randy, Puff_1);
if (x > enemy.x + 10) { hspeed = 5; }
if (x < enemy.x - 10) { hspeed = -5; }
if (y > enemy.y) { vspeed = 5; }
if (y < enemy.y) { vspeed = -5; }
}
}
else
{ if (fight = 5 and (enemy.image_index = enemy.hit_1_index or enemy.image_index = enemy.hit_2_index or enemy.image_index = enemy.hit_3_index)) { randx = irandom_range(-20, 20); randy = irandom_range(-20, 20); instance_create(x + randx, y + randy, Blue_Ring); } }
}

if (jump = 0 and flash = 0 and fall = 0 and fight != 5)
{

if ((enemy.super = 6 and enemy.hero_numb = 2 ) and distance_to_object(enemy) < 40)
{
jump = 0;
fight = 0;
flash = 0;
fall = 1;
hp -= 20; 
if (x > enemy.x + 10) { hspeed = 7; }
if (x < enemy.x - 10) { hspeed = -7; }
if (y > enemy.y) { vspeed = 7; }
if (y < enemy.y) { vspeed = -7; }
}
if ((enemy.super = 6 and enemy.hero_numb = 6 ) and distance_to_object(enemy) < 40)
{
jump = 0;
fight = 0;
flash = 0;
fall = 1;
hp -= 30; 
if (x > enemy.x + 10) { hspeed = 10; }
if (x < enemy.x - 10) { hspeed = -10; }
if (y > enemy.y) { vspeed = 10; }
if (y < enemy.y) { vspeed = -10; }
}
}


}

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




