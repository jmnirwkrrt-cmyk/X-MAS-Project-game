z = 5;

if (instance_exists(hero_obj))
{
hero = instance_nearest(x,y, hero_obj);

if (distance_to_object(hero) < 50 and y > hero.y and z > hero.z) image_alpha = 0.5;
else image_alpha = 1;

}

