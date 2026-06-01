image_speed = 0;
cooldown = 200; // Время работы стазиса
ind = 0;
hp = 0;
if (instance_exists(Terror_Squad_3D))
{
	enemy = instance_nearest(x, y, Terror_Squad_3D);
	ind = enemy.image_index;
	hp = enemy.hp;
}
