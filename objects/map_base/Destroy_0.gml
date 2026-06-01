instance_activate_object(map_obj);
instance_activate_object(map_objects);
instance_activate_object(text_obj_red_28);
instance_activate_object(draw_onmap);
instance_activate_object(map_grid);
instance_activate_object(acc_button);
instance_activate_object(draw_onmap_plane);
instance_create(905, 515, button_large_intercept);
//instance_create(905, 565, button_large_research);
instance_create(905, 615, button_large_workshop);
instance_create(905, 665, button_large_build_onmap);
instance_create(905, 715, button_large_ufopedia);
button_large_base.y = button_large_base.oldy;
button_large_research.y += 240;
map_menu.image_index = 0;

instance_destroy(module_obj);
instance_destroy(but1);
instance_destroy(but2);
instance_destroy(but3);
instance_destroy(but4);
instance_destroy(but5);
instance_destroy(but6);
instance_destroy(but_mail);
instance_destroy(draw_plane);

global.timespeed = timespeed;


