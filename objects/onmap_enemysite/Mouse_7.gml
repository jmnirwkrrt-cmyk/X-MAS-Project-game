if (!instance_exists(ask_parent) && revealed)
{

	if (type == 3 && target.object_index == onmap_city) // террор
	{
		mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
		mes.event = 10;
		mes.ufo_number = indx;
		mes.target = self;	
		
	}
	else
	if (type == 3 && target.object_index == onmap_building) // террор (это же штурм??)
	{
		mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
		mes.event = 11;
		mes.ufo_number = indx;
		mes.target = self;
		
	}
	else
	if (type == 1) // воздушный бой (бомбардировка)
	{
		mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
		mes.event = 12;
		mes.ufo_number = indx;
		mes.target = self;
		
	}
	else
	if (type == 2) // воздушный бой (перехват авиатранспорта)
	{
		mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
		mes.event = 13;
		mes.ufo_number = indx;
		mes.target = self;
		
	}
	else
	if (type == 4) // наземный штурм объекта
	{
		mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
		mes.event = 11;
		mes.ufo_number = indx;
		mes.target = self;
		
	}
	else
	if (type == 5) // поиск изумруда
	{
		mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
		mes.event = 15;
		mes.ufo_number = indx;
		mes.target = self;
		
	}
	else
	if (type == 6) // сбитый корабль
	{
		mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
		mes.event = 14;
		mes.ufo_number = indx;
		mes.target = self;	
		
	}
}