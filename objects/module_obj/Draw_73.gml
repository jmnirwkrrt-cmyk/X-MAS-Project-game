if (module = "barracks") { sprite_index = base_modules_1x1_s; image_index = 1; }
if (module = "clinic") { sprite_index = base_modules_1x1_s; image_index = 0; }
if (module = "laboratory") { sprite_index = base_modules_1x1_s; image_index = 2; }
if (module = "lift") { sprite_index = base_modules_1x1_s; image_index = 3; }
if (module = "factory") { sprite_index = base_modules_1x1_s; image_index = 4; }
if (module = "anti_air") { sprite_index = base_modules_1x1_s; image_index = 5; }
if (module = "radar") { sprite_index = base_modules_1x1_s; image_index = 6; }
if (module = "stockpile") { sprite_index = base_modules_1x1_s; image_index = 7; }
if (module = "headquarters") { sprite_index = base_modules_1x1_s; image_index = 8; }
if (module = "chaos_generator") { sprite_index = base_modules_1x1_s; image_index = 10; }
if (module = "hangar") { sprite_index = base_modules_4x4_s; image_index = 0; }
if (building_time > 0 and sprite_index = base_modules_1x1_s) { image_index = 9; }
if (building_time > 0 and sprite_index = base_modules_4x4_s) { image_index = 1; }

if (module != "empty" and module != "hangar_support") { image_alpha = 1; }
else image_alpha = 0;

if (selected)
{
	col1 = c_yellow;
	col2 = c_red;
	
	col = col1;
	
	if (!can_build_small && global.startbuilding[0] != 8) col = col2;
		
	if (global.startbuilding[0] = 8) draw_rectangle_colour(x, y, x + 150, y + 150, col, col, col, col, true);
	else
	{
		if ((can_build_big && global.startbuilding[0] == 0) || (global.startbuilding[0] == 2))
		{
			if (!can_build_big) col = col2;
			else col = col1;
			draw_rectangle_colour(x, y - 150, x + 300, y + 150, col, col, col, col, true);
		}
		else
		if (!can_build_big || (global.startbuilding[0] != 2 && global.startbuilding[0] > 0))
		{
			draw_rectangle_colour(x, y, x + 150, y + 150, col, col, col, col, true);
		}
	}
}