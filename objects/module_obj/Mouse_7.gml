text.txt = "";
if (!instance_exists(ask_question) and (!instance_exists(ask_message) or ask_message.event < 0 or ask_message.event = 5) and !global.click and (global.isbuild = true or global.startbuilding[0] > 0) and !instance_exists(button_large_q_no) and !instance_exists(button_large_q_yes) and !instance_exists(button_large_q_ok))
{
if (global.basebuilding[index, 1] > 0) text.txt = global.basebuilding[index, 1] / 3600;
global.click = true;

//has_oneconn_neighbor = false;
//if (x >= 150 && instance_nearest(x - 150, y, module_obj).conn_count == 1 && (instance_nearest(x - 150, y, module_obj).module != "empty" || (instance_nearest(x - 150, y, module_obj).module == "hangar_support" && instance_nearest(x, y, module_obj).module != "hangar"))) { has_oneconn_neighbor = true; }
//if (x <= 750 && instance_nearest(x + 150, y, module_obj).conn_count == 1 && (instance_nearest(x - 150, y, module_obj).module != "empty" || (instance_nearest(x - 150, y, module_obj).module == "hangar_support" && instance_nearest(x, y, module_obj).module != "hangar"))) { has_oneconn_neighbor = true; }
//if (y >= 150 && instance_nearest(x, y - 150, module_obj).conn_count == 1 && (instance_nearest(x, y - 150, module_obj).module != "empty" || (instance_nearest(x, y - 150, module_obj).module == "hangar_support" && instance_nearest(x, y, module_obj).module != "hangar"))) { has_oneconn_neighbor = true; }
//if (y <= 750 && instance_nearest(x, y + 150, module_obj).conn_count == 1 && (instance_nearest(x, y + 150, module_obj).module != "empty" || (instance_nearest(x, y + 150, module_obj).module == "hangar_support" && instance_nearest(x, y, module_obj).module != "hangar"))) { has_oneconn_neighbor = true; }

if (global.startbuilding[0] > 0)
{
if (selected and module == "empty" and (global.startbuilding[0] != 8 and global.startbuilding[0] != 2 and !can_build_small) or (!can_build_small and !can_build_big and global.startbuilding[0] == 2))
{
ask = instance_create(1200 / 2, 900 / 2, ask_message); ask.event = 1;
}
else
if (selected and ((global.startbuilding[0] == 2 and !can_build_big) or module != "empty"))
{
ask = instance_create(1200 / 2, 900 / 2, ask_message); ask.event = 12;
}	

if (selected and global.startbuilding[0] = 8)
{ global.basebuilding[index, 0] = global.startbuilding[1]; global.startbuilding[0]--; }
else
if (selected and can_build_small and global.startbuilding[0] = 7)
{ global.basebuilding[index, 0] = global.startbuilding[2]; global.startbuilding[0]--; }
else
if (selected and can_build_small and global.startbuilding[0] = 6)
{ global.basebuilding[index, 0] = global.startbuilding[3]; global.startbuilding[0]--; }
else
if (selected and can_build_small and global.startbuilding[0] = 5)
{ global.basebuilding[index, 0] = global.startbuilding[4]; global.startbuilding[0]--; }
else
if (selected and can_build_small and global.startbuilding[0] = 4)
{ global.basebuilding[index, 0] = global.startbuilding[5]; global.startbuilding[0]--; }
else
if (selected and can_build_small and global.startbuilding[0] = 3)
{ global.basebuilding[index, 0] = global.startbuilding[6]; global.startbuilding[0]--; }
else
if (y > 0 and x < 750 and global.startbuilding[0] = 2) {
if (selected and can_build_big and global.startbuilding[0] = 2)
{ global.basebuilding[index, 0] = global.startbuilding[7]; global.basebuilding[index + 1, 0] = "hangar_support"; global.basebuilding[index - 5, 0] = "hangar_support"; global.basebuilding[index - 6, 0] = "hangar_support"; global.startbuilding[0]--; } }
else
if (selected and can_build_small and global.startbuilding[0] = 1)
{ global.basebuilding[index, 0] = global.startbuilding[8]; global.startbuilding[0]--; }

if (global.startbuilding[0] = 0) global.isbuild = false;

}
else
if ((selected and (can_build_small or can_build_big)) and global.startbuilding[0] = 0) { global.selectedmodule = index; global.isbuild = false; ask = instance_create(1200 / 2, 900 / 2, ask_build); ask.current_module = self; }
else if (selected and can_build_small and global.startbuilding[0] != 8)
{
ask = instance_create(1200 / 2, 900 / 2, ask_message); ask.event = 1;
}
else
if (selected and module != "empty" and global.startbuilding[0] = 0) 
{
 global.selectedmodule = index; global.isbuild = false; 
 if (can_remove_module(index) and module != "lift" and module != "headquarters" and module != "hangar_support" ) {
  if (global.basebuilding[index, 1] < 1 and ((module = "barracks" and global.maxciv - global.currentciv < global.onebarrack) or (module = "laboratory" and global.laboratoryplace < global.laboratoryone) or (module = "factory" and global.workshopplace < global.workshopone) or (module = "stockpile" and global.stock < global.onestock) or (module = "hangar" and global.maxplanes < 2)))
  { ask = instance_create(1200 / 2, 900 / 2, ask_message); ask.event = 2; }
  else
  { ask = instance_create(1200 / 2, 900 / 2, ask_question); ask.event = 1; }
 }
 else
 if (!can_remove_module(index)) { ask = instance_create(1200 / 2, 900 / 2, ask_message); ask.event = 3;  }
 else
 if (module = "lift") { ask = instance_create(1200 / 2, 900 / 2, ask_message); ask.event = 3;  }
 else
 if (module = "headquarters") { ask = instance_create(1200 / 2, 900 / 2, ask_message); ask.event = 4;  }
}
else
if (!can_build_big and !can_build_small)
{
	ask = instance_create(1200 / 2, 900 / 2, ask_message); ask.event = 1;
}

if (global.startbuilding[0] = 0) { global.isbuild = false; }
}

