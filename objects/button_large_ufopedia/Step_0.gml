if (type == 0) // портал в сантапедию
{
	txt = global.txt197;
	text.txt = txt;
}
if (type == 1) // снаряга
{
	txt = global.txt282;
	text.txt = txt;	
}
if (type == 2) // солдаты
{
	txt = global.txt283;
	text.txt = txt;		
}
if (type == 3) // постройки
{
	txt = global.txt284;
	text.txt = txt;		
}
if (type == 4) // авиаоружие
{
	txt = global.txt285;
	text.txt = txt;		
}
if (type == 5) // авиация
{
	txt = global.txt286;
	text.txt = txt;		
}
if (type == 6) // технологии роботов
{
	txt = global.txt287;
	text.txt = txt;		
}
if (type == 7) // роботы
{
	txt = global.txt288;
	text.txt = txt;		
}
if (type == 8) // авиация роботов
{
	txt = global.txt289;
	text.txt = txt;		
}
if (type == 9) // учебные материалы
{
	txt = global.txt409;
	text.txt = txt;		
}





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


