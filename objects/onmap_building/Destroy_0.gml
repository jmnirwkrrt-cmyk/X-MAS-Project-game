if (type == 4)
{
	global.money_weekly_gain -= money_addition;	
}
new_mail(23);

if (instance_exists(drawaa)) instance_destroy(drawaa);
if (instance_exists(drawradar)) instance_destroy(drawradar);
if (instance_exists(text)) instance_destroy(text);