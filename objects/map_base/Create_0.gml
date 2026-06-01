instance_deactivate_object(text_obj_red_28);
instance_deactivate_object(draw_onmap);
instance_deactivate_object(map_obj);
instance_deactivate_object(map_objects);
instance_deactivate_object(map_grid);
instance_deactivate_object(acc_button);
instance_deactivate_object(draw_onmap_plane);
instance_destroy(button_large_intercept);
//instance_destroy(button_large_research);
instance_destroy(button_large_workshop);
instance_destroy(button_large_build_onmap);
instance_destroy(button_large_ufopedia);

map_menu.image_index = 1;
button_large_base.y -= 190; // 265
button_large_research.y -= 240;
but_mail = instance_create(905, button_large_research.y + 50, button_large_mail);
but1 = instance_create(905, 465, button_large_build);
but2 = instance_create(905, 515, button_large_buy);
but3 = instance_create(905, 565, button_large_sell);
but4 = instance_create(905, 615, button_large_info);
but5 = instance_create(905, 665, button_large_plane);
but6 = instance_create(905, 715, button_large_infantry);

var i;
var_x = 0;
var_y = 0;
for (i = 1; i < 37; i++)
{
	if (var_x > 750) { var_x = 0; var_y += 150; }
	var module = instance_create(var_x, var_y, module_obj);
	module.index = i;
	module.index_xx = var_x;
	module_index_xy = var_y;
	module.module = global.basebuilding[i, 0];
	module.building_time = global.basebuilding[i, 1];
	var_x += 150;
	module.depth = depth - 1;
}

timespeed = global.timespeed;
global.timespeed = 0;

