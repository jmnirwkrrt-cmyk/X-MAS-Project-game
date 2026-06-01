global.click = true;
if (current_module == 0) current_module = instance_find(module_obj, global.selectedmodule);

if (global.money > global.buildings[mcurrent, 3] - 1)
{
if (mcurrent = 0 && current_module.can_build_small)
{ 
global.basebuilding[global.selectedmodule, 0] = global.buildings[mcurrent, 0];
global.basebuilding[global.selectedmodule, 1] = global.buildings[mcurrent, 2];
global.money -= global.buildings[mcurrent, 3];
}
else
if (mcurrent = 1 && current_module.can_build_small)
{ 
global.basebuilding[global.selectedmodule, 0] = global.buildings[mcurrent, 0];
global.basebuilding[global.selectedmodule, 1] = global.buildings[mcurrent, 2];
global.money -= global.buildings[mcurrent, 3];
}
else
if (mcurrent = 2 && current_module.can_build_small)
{ 
global.basebuilding[global.selectedmodule, 0] = global.buildings[mcurrent, 0];
global.basebuilding[global.selectedmodule, 1] = global.buildings[mcurrent, 2];
global.money -= global.buildings[mcurrent, 3];
}
else
if (mcurrent = 3 && current_module.can_build_small)
{ 
global.basebuilding[global.selectedmodule, 0] = global.buildings[mcurrent, 0];
global.basebuilding[global.selectedmodule, 1] = global.buildings[mcurrent, 2];
global.money -= global.buildings[mcurrent, 3];
}
else
if (mcurrent = 4 && current_module.can_build_small)
{ 
global.basebuilding[global.selectedmodule, 0] = global.buildings[mcurrent, 0];
global.basebuilding[global.selectedmodule, 1] = global.buildings[mcurrent, 2];
global.money -= global.buildings[mcurrent, 3];
}
else
if (mcurrent = 5 && current_module.can_build_small)
{ 
global.basebuilding[global.selectedmodule, 0] = global.buildings[mcurrent, 0];
global.basebuilding[global.selectedmodule, 1] = global.buildings[mcurrent, 2];
global.money -= global.buildings[mcurrent, 3];
}
else
if (mcurrent = 6 && current_module.can_build_small)
{ 
global.basebuilding[global.selectedmodule, 0] = global.buildings[mcurrent, 0];
global.basebuilding[global.selectedmodule, 1] = global.buildings[mcurrent, 2];
global.money -= global.buildings[mcurrent, 3];
}
else
if (mcurrent = 7 && current_module.can_build_small)
{ 
global.basebuilding[global.selectedmodule, 0] = global.buildings[mcurrent, 0];
global.basebuilding[global.selectedmodule, 1] = global.buildings[mcurrent, 2];
global.money -= global.buildings[mcurrent, 3];
}
else
if (mcurrent = 8 && current_module.can_build_small)
{ 
global.basebuilding[global.selectedmodule, 0] = global.buildings[mcurrent, 0];
global.basebuilding[global.selectedmodule, 1] = global.buildings[mcurrent, 2];
global.money -= global.buildings[mcurrent, 3];
}
else
if (mcurrent = 9)
{ 
if (current_module.can_build_big)
{
global.basebuilding[global.selectedmodule, 0] = global.buildings[mcurrent, 0];
global.basebuilding[global.selectedmodule, 1] = global.buildings[mcurrent, 2];

global.basebuilding[global.selectedmodule + 1, 0] = "hangar_support";
global.basebuilding[global.selectedmodule - 5, 0] = "hangar_support";
global.basebuilding[global.selectedmodule - 6, 0] = "hangar_support";
instance_place(current_module.x + 150, current_module.y, module_obj).module = "hangar_support";
instance_place(current_module.x + 150, current_module.y - 150, module_obj).module = "hangar_support";
instance_place(current_module.x, current_module.y - 150, module_obj).module = "hangar_support";
global.money -= global.buildings[mcurrent, 3];
}
else
{
mes = instance_create(1200 / 2, 900 / 2, ask_message);
mes.event = 12;
instance_destroy(self);
}
}
else 
if (!current_module.can_build_small)
{
mes = instance_create(1200 / 2, 900 / 2, ask_message);
mes.event = 1;
instance_destroy(self);	
}
}
else { mes = instance_create(1200 / 2, 900 / 2, ask_message); mes.event = 6; }

instance_destroy(self);

