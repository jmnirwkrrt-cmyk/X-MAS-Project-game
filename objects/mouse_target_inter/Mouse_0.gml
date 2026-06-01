if (x < 900 and y < 900 and !instance_exists(ask_question_inter) and !global.click) 
{
	target_x = mouse_x;
	target_y = mouse_y;
	
	instance_destroy(ask_message);
	var mes = instance_create(1200 / 2, 900 / 2, ask_question_inter);
	
	
	var map = map_obj; // или self, если код внутри карты
	var sx = map.image_xscale;
	var sy = map.image_yscale;
	var dx = map.x - map.basic_x;
	var dy = map.y - map.basic_y;
	// координаты точки НА КАРТЕ (как твои base_x / base_y)
	var target_x_mod = (mouse_x - dx - 450) / sx + 450;
	var target_y_mod = (mouse_y - dy - 450) / sy + 450;
	target_x = target_x_mod;
	target_y = target_y_mod;
	mes.target_x = target_x_mod;
	mes.target_y = target_y_mod;
	
	mes.indx = indx;
	
	var onmap_enemy_var = noone;
	var onmap_enemysite_var = noone;
	var onmap_building_var = noone;
	var onmap_building_enemy_var = noone;
	if (instance_exists(onmap_enemy)) onmap_enemy_var = instance_nearest(x, y, onmap_enemy);
	if (instance_exists(onmap_enemysite)) onmap_enemysite_var = instance_nearest(x, y, onmap_enemysite);
	if (instance_exists(onmap_building)) onmap_building_var = instance_nearest(x, y, onmap_building);
	if (instance_exists(onmap_building_enemy)) onmap_building_enemy_var = instance_nearest(x, y, onmap_building_enemy);
	
	
	if (instance_exists(onmap_enemy_var) && onmap_enemy_var.founded && distance_to_object(onmap_enemy_var) <= 1) { mes.event = 1; mes.enemy_indx = onmap_enemy_var.indx; mes.target = onmap_enemy_var; show_debug_message($"Мышкой выбрана цель {mes.target.object_index}"); }
	else 
	if (instance_exists(onmap_enemysite_var) && distance_to_object(onmap_enemysite_var) <= 1 && onmap_enemysite_var.revealed) { mes.event = 2; mes.enemy_indx = onmap_enemysite_var.indx; mes.target = onmap_enemysite_var; show_debug_message($"Мышкой выбрана цель {mes.target.object_index}"); }
	else
	if (instance_exists(onmap_building_var) && distance_to_object(onmap_building_var) <= 1 && onmap_building_var.type == 1) { mes.event = 3; mes.target = onmap_building_var; show_debug_message($"Мышкой выбрана цель {mes.target.object_index}"); }
	else
	if (instance_exists(onmap_building_enemy_var) && onmap_building_enemy_var.revealed && distance_to_object(onmap_building_enemy_var) <= 1) { mes.event = 4; mes.target = onmap_building_enemy_var; show_debug_message($"Мышкой выбрана цель {mes.target.object_index}"); }
	else
	mes.event = 0;
}


