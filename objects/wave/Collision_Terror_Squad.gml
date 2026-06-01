if (other.index != "ufo" and other.fall = 0)
{
other.fall = 1;
other.fight = 0;
other.jump = 0;
other.flash = 0;
other.hp -= 20;
other.hspeed = 0;
other.vspeed = 0;
}
else
{
other.hspeed = 0;
other.vspeed = 0;
if (!instance_exists(Blue_Ring))
{
ring = instance_nearest(x,y, Blue_Ring);
if (distance_to_object(ring) > 20) { instance_create(x,y, Blue_Ring); }
}
}

