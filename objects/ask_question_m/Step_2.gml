if (image_xscale = 1 and image_yscale = 1 and !ready)
{
but1 = instance_create(x - 288, y + 42, button_large_q_yes)
but2 = instance_create(x + 17, y + 42, button_large_q_no)

text.w = 500;
text1.w = 500;
text.txt = global.txt175;
ready = true;
text1.txt = global.onmapbuilding[type, 0];
keyboard_string = global.onmapbuilding[type, 0];
}
if (image_xscale = 1 and image_yscale = 1 and ready) text1.txt = keyboard_string;


if (image_xscale = 1 and image_yscale = 1 and but1.yes)
{
obj = instance_create(x_base, y_base, onmap_building);
obj.name = text1.txt;
obj.type = type;
global.baseonmap = obj;
if (type = 4) global.factories++;
obj.building_time = global.onmapbuilding[type, 2];
global.money -= global.onmapbuilding[type, 4];
global.click = true;
if (!global.base_exists)
{
global.base_exists = true;
global.click = true;
global.isbuild = false;
instance_destroy(text);
instance_destroy(text1);
if (!instance_exists(map_base)) instance_create(0, 0, map_base); 
}
instance_destroy(text); instance_destroy(text1);
instance_destroy(self);
}
else
if (image_xscale = 1 and image_yscale = 1 and but2.no) { instance_destroy(text); instance_destroy(text1); instance_destroy(self); }


