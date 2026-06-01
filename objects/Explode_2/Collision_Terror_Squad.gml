if (other.jump = 0 and other.fall = 0 and image_index = 1)
{
other.flash = 0;
other.jump = 0;
other.fall = 1;
if (other.x > x) { other.hspeed = 5; }
if (other.x < x) { other.hspeed = -5; }
if (other.y > y) { other.vspeed = -5; }
if (other.y < y) { other.vspeed = 5; }
other.hp -= damage;
}

