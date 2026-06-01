if (event == 2) image_index = 0;
if (event == 4) image_index = 0;
if (event == 5) image_index = 2;

if (image_xscale == 1 and image_yscale == 1 and !ready)
{
	but1 = instance_create(x - 288, y + 40, button_large_q_yes); 
	but2 = instance_create(x + 10, y + 40, button_large_q_no);
	if (event == 2) { but3 = instance_create(x - 288, y - 12, button_large_q_yes); but3.text.txt = global.txt445; } 
	text = instance_create(x, y - 25, text_obj_red);
	if (event == 2) text.y -= 40;
	text.w = 500;
	if (event == 1) text.txt = global.txt18;
	if (event == 2) text.txt = global.txt341;
	if (event == 3) text.txt = global.txt342 + global.technologies[tech_index, 0] + global.txt343;
	if (event == 4) text.txt = global.txt424;
	if (event == 5) text.txt = global.txt444;
	ready = true;
}


if (event == 1) current_module = instance_find(module_obj, global.selectedmodule);

if (image_xscale == 1 and image_yscale == 1 and but1.yes and event == 1) // Строительство модуля
{
	if (global.basebuilding[global.selectedmodule, 0] = "hangar")
	{
		global.basebuilding[global.selectedmodule - 6, 0] = "empty";
		global.basebuilding[global.selectedmodule - 5, 0] = "empty";
		global.basebuilding[global.selectedmodule + 1, 0] = "empty";
		instance_place(current_module.x + 150, current_module.y + 150, module_obj).module = "empty";
		instance_place(current_module.x, current_module.y - 150, module_obj).module = "empty";
		instance_place(current_module.x + 150, current_module.y, module_obj).module = "empty";
	}
	global.basebuilding[global.selectedmodule, 0] = "empty";
	global.basebuilding[global.selectedmodule, 1] = 0;
	current_module.module = "empty";
	
	instance_destroy(self);
	exit;
}
else
if (image_xscale == 1 and image_yscale == 1 and event == 1 and but2.no) { instance_destroy(self); exit; }


if (image_xscale == 1 and image_yscale == 1 and but1.yes and event == 2) // Выход в меню
{
	but1.yes = false;
	instance_destroy(self);
	save_game_json($"XMAS_savegame_v_{string(global.game_version)}_{string(global.save_number)}.dat");
	//room_goto(menu_room);
	//script_execute(test_squads);
	if (file_exists("xmas_settings.ini"))
	{
		ini_open("xmas_settings.ini");
		ini_write_string("save", "skip_intro", "1");
		ini_close();
	}
	game_restart();
	exit;
}
else
if (image_xscale == 1 and image_yscale == 1 and event == 2 and but2.no) { instance_destroy(self); exit; }
else
if (image_xscale == 1 and image_yscale == 1 and event == 2 and but3.yes) 
{ 
	if (file_exists("xmas_settings.ini"))
	{
		ini_open("xmas_settings.ini");
		ini_write_string("save", "skip_intro", "1");
		ini_close();
	}
	game_restart(); 
	exit; 
}



if (image_xscale == 1 and image_yscale == 1 and but1.yes and event == 3 and global.technologies[tech_index, 5] > 0) // Исследование завершено
{
	but1.yes = false;
	instance_destroy(self);
	var back = instance_create(0, 0, background_map);
	back.type = 101;
	background_map.wikipage = global.technologies[tech_index, 5];
	exit;
}
else
if (image_xscale == 1 and image_yscale == 1 and event == 3 and but2.no) { instance_destroy(self); exit; }

if (image_xscale == 1 and image_yscale == 1 and but1.yes and event == 4) 
{
	but1.yes = false;
	instance_destroy(self);
	global.save_number++;	
	if (file_exists("xmas_settings.ini"))
	{
		ini_open("xmas_settings.ini");
		ini_write_real("save", "save_number", global.save_number);
		ini_close();
	}
	room_goto(map_room);
	exit;
}
else
if (image_xscale == 1 and image_yscale == 1 and event == 4 and but2.no) { instance_destroy(self); exit; }

if (image_xscale == 1 and image_yscale == 1 and but1.yes and event == 5) 
{
	but1.yes = false;
	instance_destroy(self);
	global.game_loading = true;
	global.game_autoloading = true;
	room_goto(map_room);
	exit;
}
else
if (image_xscale == 1 and image_yscale == 1 and event == 5 and but2.no) 
{ 
	instance_destroy(self); 
	room_goto(map_room);
	global.game_loading = true;
	global.game_autoloading = false;
	exit; 
}