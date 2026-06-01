if (!global.isbuild and is) { instance_destroy(mess); is = false; }
if (global.startbuilding[0] > 0) 
{ 
	global.isbuild = true;
}
if (global.isbuild and !instance_exists(ask_message) and global.startbuilding[0] = 0)
{
	mess = instance_create(1200 / 2, 100, ask_message);
	mess.event = 5;
	is = true;
}
if (global.startbuilding[0] > 0)
{
	if (!instance_exists(ask_message)) 
	{
		mess = instance_create(1200 / 2, 100, ask_message)
		mess.image_xscale = 1;
		mess.image_yscale = 1;
		mess.event = -global.startbuilding[0];
		mess.rmv = true;
	}
}
text.x = x + 281 / 2;
text.y = y + 20 / 2;

