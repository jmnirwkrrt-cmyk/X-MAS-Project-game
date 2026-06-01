/// [FORMAT] Убраны дублирующиеся instance_destroy, код выровнен.
/// [FIX] Исправлены явные ошибки сравнения/сброса состояний.
/// [FIX] Логика "Не выбраны перехватчики..." теперь работает только для type == 8.

instance_destroy(wikiimage_small);
instance_destroy(wikiimage_medium);

instance_destroy(background_line);
instance_destroy(background_line2);
instance_destroy(background_line3);
instance_destroy(background_line4);
instance_destroy(background_line_2o);

instance_destroy(button_arrow_2W);
instance_destroy(button_arrow_2);
instance_destroy(button_arrow_2I);

instance_destroy(text_obj_red_28);
instance_destroy(text_obj_red_12);
instance_destroy(text_obj_white_28);
instance_destroy(text_obj_white_28_c);
instance_destroy(text_obj_red_28_left);
instance_destroy(text_obj_red_wiki);

instance_destroy(draw_bar);
instance_destroy(select_inmenu);

instance_destroy(button_large_b_exit);
instance_destroy(button_large_b_planetth);
instance_destroy(button_large_b_research);
instance_destroy(button_large_b_construct);
instance_destroy(button_large_b_infdesc);
instance_destroy(button_large_memory);
instance_destroy(button_large_b_mail);
instance_destroy(button_large_intercapply);
instance_destroy(button_large_b_buy);

// instance_destroy(but1);
// instance_destroy(but2);
// надо удалять всё в "завершить шаг", потому что если в завершении шага уже успели
// удалиться кнопки, то он грохнет кнопки ускорения из-за некорректной ссылки

// instance_destroy(button_large_ufopedia);

//
// ПРИМЕНЕНИЕ ВЫБОРА ПЕРЕХВАТЧИКОВ
//
if (type == 8) // [FIX] вынесено отдельно, чтобы else ниже не срабатывал на других type
{
    if (esc)
    {
        instance_activate_object(onmap_enemy);
        instance_activate_object(onmap_enemysite);
        instance_activate_object(onmap_building_enemy);
        instance_activate_object(onmap_building);

        var escort_exists = false;
        var count = 0;
        var i;
        var i1;

        for (i = 1; i <= global.planes[0, 0]; i++)
        {
            if (global.planes[i, 12] == -1)
            {
                count++;
                if (global.planes[i, 14] > 0) escort_exists = true;
            }
        }

        show_debug_message("Запуск перехватчиков!");

        if (count > 0)
        {
            if (escort_exists)
            {
                show_debug_message("Перенацеливание!");

                var escort_index = 0;

                for (i = 1; i <= global.planes[0, 0]; i++)
                {
                    if (global.planes[i, 12] == -1)
                    {
                        escort_index = global.planes[i, 14];
                        break;
                    }
                }

                // [FIX] Было:
                // if (global.planes[i, 12] != -1) continue;
                // if (global.planes[i, 12] != -1) global.planes[i, 12] = 0;
                // Вторая проверка была невозможной.
                for (i = 1; i <= global.planes[0, 0]; i++)
                {
                    if (global.planes[i, 12] != -1) continue;
                    global.planes[i, 12] = 0;
                }

                escort = 0;

                show_debug_message("Поиск эскадрильи....");

                instance_activate_object(onmap_escort);

                for (i1 = 0; i1 < instance_number(onmap_escort); i1++)
                {
                    if (instance_find(onmap_escort, i1).indx != escort_index) continue;

                    show_debug_message($"Найдена эскадрилья {i1}");

                    escort = instance_find(onmap_escort, i1);
                    escort.point_x = target_x;
                    escort.point_y = target_y;
                    escort.status = 7;

                    if (instance_exists(target))
                    {
                        if (global.debug) show_debug_message($"Найдена и цель для эскадрильи!");

                        escort.target = target;
                        escort.point_x = target.base_x;
                        escort.point_y = target.base_y;
                        escort.status = 1;

                        if (target.object_index == onmap_enemysite || target.object_index == onmap_building_enemy)
                        {
                            escort.status = 4;
                        }
                    }

                    break;
                }

                instance_deactivate_object(onmap_escort);
            }
            else
            {
                show_debug_message("Запуск с базы!");

                global.escortplayer[0, 0]++;

                for (i = 1; i <= global.planes[0, 0]; i++)
                {
                    if (global.planes[i, 12] == -1)
                    {
                        global.planes[i, 14] = global.escortplayer[0, 0];
                    }
                }

                global.escortplayer[global.escortplayer[0, 0], 0] = count;

                if (
                    !instance_exists(target) ||
                    (instance_exists(target) && target != global.baseonmap && target.x != global.baseonmap.x && target.y != global.baseonmap.y)
                )
                {
                    escort = instance_create(global.baseonmap.base_x, global.baseonmap.base_y, onmap_escort);
                    escort.base_x = global.baseonmap.base_x;
                    escort.base_y = global.baseonmap.base_y;
                    escort.indx = global.escortplayer[0, 0];
                    escort.point_x = target_x;
                    escort.point_y = target_y;
                    escort.status = 7;

                    if (instance_exists(target))
                    {
                        if (global.debug) show_debug_message($"Найдена цель для новой эскадрильи!");

                        escort.target = target;
                        escort.point_x = target.base_x;
                        escort.point_y = target.base_y;
                        escort.status = 1;

                        if (target.object_index == onmap_enemysite || target.object_index == onmap_building_enemy)
                        {
                            escort.status = 4;
                        }
                    }
                    else if (global.debug)
                    {
                        show_debug_message($"Цель для новой эскадрильи не найдена!");
                    }

                    q = 0;

                    for (i = 1; i <= global.planes[0, 0]; i++)
                    {
                        // [FIX] было "=" вместо "=="
                        if (global.planes[i, 14] == global.escortplayer[0, 0])
                        {
                            global.escortplayer[global.escortplayer[0, 0], 4 + q] = i;
                            q++;
                        }
                    }

                    for (i = 1; i <= global.planes[0, 0]; i++)
                    {
                        if (global.planes[i, 12] == -1) global.planes[i, 12] = 0;
                    }
                }
                else
                {
                    show_debug_message("Пуск с одной и той же базы на базу не имеет смысла! Отменено во избежание краша по scr(NaN)");

                    for (i = 1; i <= global.planes[0, 0]; i++)
                    {
                        if (global.planes[i, 12] == -1)
                        {
                            global.planes[i, 12] = 0;
                            global.planes[i, 14] = 0; // [FIX] иначе самолёты остаются приписаны к несуществующей эскадрилье
                        }
                    }
                }
            }
        }

        instance_deactivate_object(onmap_enemy);
        instance_deactivate_object(onmap_enemysite);
        instance_deactivate_object(onmap_building_enemy);
        instance_deactivate_object(onmap_building);
    }
    else
    {
        show_debug_message("Не выбраны перехватчики...");

        for (var i = 1; i <= global.planes[0, 0]; i++)
        {
            if (global.planes[i, 12] == -1) global.planes[i, 12] = 0;
        }
    }
}

//
// ВОССТАНОВЛЕНИЕ / ПОВТОРНАЯ ДЕАКТИВАЦИЯ
//
if (type != 14 || !start_base_defense) instance_activate_all();

if (instance_exists(map_base))
{
    show_debug_message("Обнаружена карта базы, кнопки деактивированы повторно");

    instance_deactivate_object(text_obj_red_28);
    instance_deactivate_object(draw_onmap);
    instance_deactivate_object(map_objects);
    instance_deactivate_object(map_obj);
    instance_deactivate_object(map_grid);
    instance_deactivate_object(acc_button);
	instance_deactivate_object(draw_onmap_plane);
	with (module_obj) instance_activate_object(text);
}

//
// ПЕРЕХОДЫ
//
if (type == 11)
{
    room_goto(ground_map);
}
if (type == 12)
{
	fight_win_drop();	
}

if (type == 14 && start_base_defense)
{
	global.ground_battle_type = 5;

    var back = instance_create(0, 0, background_map);
    back.type = 11;
}

if (type == 15 || type == 16)
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