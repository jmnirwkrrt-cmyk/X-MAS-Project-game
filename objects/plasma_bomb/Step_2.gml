image_angle++;

if (distance_to_point(point_x, point_y) < 5) 
{
explod = instance_create(x, y, Explode);
explod.damage = 60;
instance_destroy(self);
}

