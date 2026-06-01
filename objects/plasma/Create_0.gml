speed = 13;
direction = 0;
if (instance_exists(X_MAS_team))
{
enemy = instance_nearest(x, y, X_MAS_team);
direction = point_direction(x, y, enemy.x, enemy.y);
}
rand = 0;
damage = 0;
penetration = 0;

sound_play(laser_sound); sound_volume(laser_sound, global.soundvolume);

