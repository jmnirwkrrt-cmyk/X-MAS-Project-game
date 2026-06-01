if (type = 1) sprite_index = base_sprite;
if (type = 2) sprite_index = radar_sprite;
if (type = 3) sprite_index = AA_sprite;
if (type = 4) sprite_index = facility_sprite;

if (AA_range > 0) AA_damage = global.AAdamage;

AA_range = global.onmapbuilding[type, 3];
radar_range = global.onmapbuilding[type, 1];

if (type == 1)
{
	radar_range = 0;
	global.base_exists = true;
	var i;
		for (i = 0; i <= 36; i++)
		{
			if (global.basebuilding[i, 0] = "radar" and global.basebuilding[i, 1] = 0) radar_range += global.oneradar;
			if (global.basebuilding[i, 0] = "anti_air" and global.basebuilding[i, 1] = 0) { AA_damage += global.AAdamage; AA_range = global.samrange; }
		}
}

AA_range *= (image_xscale + basic_size);
radar_range *= (image_xscale + basic_size);

if (radar_range > global.maxradar * (image_xscale + basic_size)) radar_range = global.maxradar * (image_xscale + basic_size);

drawradar.x = x;
drawradar.y = y;
drawaa.x = x;
drawaa.y = y;

if (building_time > 0) { text.txt = building_time / 3600; if (!global.isbuild) building_time -= global.timespeed; }

if (building_time < 0)
{
	if (type == 4)
	{
		money_addition = global.money_weekly_gain;
		global.money_weekly_gain += money_addition;
		new_mail(22);
	}
	building_time = 0;
}
if (building_time <= 0)
{
	if (instance_exists(text)) text.txt = name;
	drawradar.range = radar_range;
	drawaa.range = AA_range;
}

if (x > 850) { drawradar.visible = false; drawaa.visible = false; if (instance_exists(text)) text.visible = false; }
else { drawradar.visible = true; drawaa.visible = true; if (instance_exists(text)) text.visible = true; }

if (sprite_index == base_sprite && type == 1) { global.baseonmap = self; global.base_exists = true; }




