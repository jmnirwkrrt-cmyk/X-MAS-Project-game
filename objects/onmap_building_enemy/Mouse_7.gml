if (revealed && !instance_exists(ask_parent))
{
	mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
	mes.event = 16;
	mes.target = self;
	mes.ufo_number = indx;
}