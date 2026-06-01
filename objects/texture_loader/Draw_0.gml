// Предзагрузка всех спрайтов игры
//var sprites = asset_get_ids(asset_sprite); // Получаем список всех спрайтов
//
//for (var i = 0; i < array_length(sprites); i++) {
//var spr = sprites[i]; // ID спрайта
//
//if (asset_get_type(spr) == asset_sprite) { // Проверяем, что это спрайт
//    var subimg_count = sprite_get_number(spr); // Количество кадров
//
//    for (var j = 0; j < subimg_count; j++) { // Проходимся по кадрам
//        draw_sprite(spr, j, -10000, -10000); // Рисуем за пределами экрана
//    }
//}
//}
//// Принудительная перерисовка экрана
//window_set_cursor(cr_none); // Убираем курсор (чтобы что-то изменилось)
//window_set_cursor(cr_default); // Возвращаем курсор
//
////texture_flush(false);
	