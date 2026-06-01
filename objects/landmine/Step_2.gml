if (image_index = image_number - 1 and instance_exists(Terror_Squad))
{
enemy = instance_nearest(x, y, Terror_Squad);
if (distance_to_object(enemy) < 20 and enemy.jump = 0 and enemy.fall = 0)
{
explos = instance_create(x, y, Explode_2);
explos.damage = 40;
instance_destroy(self);
}
}

