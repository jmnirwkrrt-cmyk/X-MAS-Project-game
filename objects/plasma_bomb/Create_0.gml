speed = 10;
direction = 0;
if (instance_exists(X_MAS_team))
{
rand = irandom_range(-200, 200);
enemy = instance_nearest(x, y, X_MAS_team);
direction = point_direction(x, y, enemy.x + rand, enemy.y + rand);
point_x = enemy.x + rand;
point_y = enemy.y + rand;
}
rand = 0;
damage = 0;
penetration = 0;

sound_play(laser_sound); sound_volume(laser_sound, global.soundvolume);

