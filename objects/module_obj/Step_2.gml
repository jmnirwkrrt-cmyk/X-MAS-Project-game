
text.txt = "";
if (!instance_exists(ask_parent)) if (global.basebuilding[index, 1] > 0) text.txt = global.basebuilding[index, 1] / 3600;

//conn_count = 0;
//if (x > 150 and instance_nearest(x - 150, y, module_obj).module != "empty") { conn_count++; }
//if (x < 750 and instance_nearest(x + 150, y, module_obj).module != "empty") { conn_count++; }
//if (y > 150 and instance_nearest(x, y - 150, module_obj).module != "empty") { conn_count++; }
//if (y < 750 and instance_nearest(x, y + 150, module_obj).module != "empty") { conn_count++; }



module = global.basebuilding[index, 0];
building_time = global.basebuilding[index, 1];
if (module = "hangar")
{
hangar_1 = instance_nearest(x, y - 150, module_obj);
hangar_2 = instance_nearest(x + 150, y - 150, module_obj);
hangar_3 = instance_nearest(x + 150, y, module_obj);

hangar_1.module = "hangar_support";
hangar_2.module = "hangar_support";
hangar_3.module = "hangar_support";
}

if (!global.isbuild) selected = false;

