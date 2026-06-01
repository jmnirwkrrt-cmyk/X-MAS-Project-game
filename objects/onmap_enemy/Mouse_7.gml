if (!instance_exists(ask_parent) && founded && indx != 0)
{
	acces_escorts[0] = 0;
	
	
	
	//for (i = 0; i < instance_number(map_escort_objects); i++)
	//{
	//	if (!instance_exists(instance_find(map_escort_objects, i))) continue;
	//	if (distance_to_object(instance_find(map_escort_objects, i)) < 20) { acces_escorts[0]++; acces_escorts[acces_escorts[0]] = instance_find(map_escort_objects, i); }
	//}
	
	// Создаём список для результатов
	var _list = ds_list_create();
	// Проверяем столкновения по прямоугольной области маски текущего спрайта
	collision_rectangle_list(
	    bbox_left, bbox_top,   // границы текущей маски
	    bbox_right, bbox_bottom,
	    map_escort_objects,    
	    false,                 
	    false,                
	    _list,                 
	    false                  
	);
	// Если найдены пересечения
	if (ds_list_size(_list) > 0) {
	    // Превратим DS list в обычный массив GML
	    acces_escorts[0] = ds_list_size(_list)
	    for (var i = 0; i < ds_list_size(_list); i++) {
	        acces_escorts[i + 1] = _list[| i]; // сохраняем ID инстансов
	    }
		show_debug_message($"Найдено пересечений при выборе эскадрильи: {acces_escorts[0]}");
	}
	else show_debug_message($"Не найдено пересечений при выборе эскадрильи");
	// Освобождаем список
	ds_list_destroy(_list);
	
	
	if (acces_escorts[0] < 2)
	{
		ask = instance_create(1200 / 2, 900 / 2, ask_message_big);
		ask.ufo_number = indx;
		ask.event = 1;
		ask.target = self;
		ask.target_x = x;
		ask.target_y = y;
	}
	else
	{
		ask = instance_create(1200 / 2, 900 / 2, ask_question_escort_select);
		ask.type = 1;
		ask.indx = indx;
		ask.acces_escorts[0] = acces_escorts[0];
		for (i = 1; i <= acces_escorts[0]; i++)
		{
			ask.acces_escorts[i] = acces_escorts[i];
		}
	}
	
}
if (indx == 0) instance_destroy(self);