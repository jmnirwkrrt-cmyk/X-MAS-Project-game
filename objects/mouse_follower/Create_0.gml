rspd = room_speed;
room_speed = room_speed / 3;
type = 0 // 0 - граната, остальное - высадка (индекс в массиве)
if (instance_exists(hero_obj) and type > 0)
{
instance_deactivate_object(hero_obj);
}


