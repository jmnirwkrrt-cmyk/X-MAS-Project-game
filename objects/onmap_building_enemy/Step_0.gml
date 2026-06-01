radar_range = global.eggbase_stage_1_radar_range * (image_xscale + basic_size);
if (type == 2) radar_range = global.eggbase_stage_2_radar_range * (image_xscale + basic_size);


if (building_time > 0) { building_time -= global.timespeed; }

if (building_time < 1)
{
	type = 2;
}

if (radar_range > global.maxradar * (image_xscale + basic_size)) radar_range = global.maxradar * (image_xscale + basic_size);

if (x > 850) { if (instance_exists(text)) text.visible = false; }
else { if (instance_exists(text)) text.visible = true; }





