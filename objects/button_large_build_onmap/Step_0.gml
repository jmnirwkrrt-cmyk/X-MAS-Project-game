if (!global.isbuild and ex and instance_exists(mess)) { instance_destroy(mess); }
if (!global.isbuild and !global.base_exists) global.isbuild = true;
if (global.isbuild) time_m.seconds_current -= global.timespeed;
if (global.isbuild and instance_exists(map_obj))
{
	map_obj.image_xscale = 1;
	map_obj.image_yscale = 1;
}
if (global.isbuild and !instance_exists(ask_message) and global.base_exists)
{
	mess = instance_create(1200 / 2, 100, ask_message);
	mess.event = 5;
	ex = true;
}
if (!global.base_exists and global.isbuild)
{
	if (!instance_exists(ask_message)) 
	{
		mess = instance_create(1200 / 2, 100, ask_message)
		mess.image_xscale = 1;
		mess.image_yscale = 1;
		mess.event = -9
	}
}
text.x = x + 281 / 2;
text.y = y + 20 / 2;

