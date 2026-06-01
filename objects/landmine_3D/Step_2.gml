if (image_index = image_number - 1 and instance_exists(Terror_Squad_3D))
{
	enemy = instance_nearest(x, y, Terror_Squad_3D);
	if (distance_to_object(enemy) < global.range_to_hit and enemy.jump = 0 and enemy.fall = 0)
	{
		explos = instance_create(x, y, Explode_2_3D);
		explos.z = z;
		explos.damage = 40;
		instance_destroy(self);
	}
}

