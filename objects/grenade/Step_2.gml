image_angle++;


/*
if (throw = 0 and vspeed > 0)
{
vspeed -= 0.1;
if (vspeed < 0.1) { vspeed = 0; throw = 1; hspeed = 0; vspeed = 0; speed = 1; }
if (target_x > x) { hspeed = 1; }
if (target_x < x) { hspeed = -1; } 
}
if (throw = 1)
{
speed+= 0.1;
direction = point_direction(x, y, target_x, target_y);
}
*/

//speed += 0.2;

if (distance_to_point(target_x, target_y) < 10)
{
explo = instance_create(x, y, Explode_2);
explo.damage = 35;
instance_destroy(self);
}

/* */
/*  */
