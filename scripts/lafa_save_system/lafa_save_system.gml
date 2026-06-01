/*
Другая система сохранений придуманная в тот же момент, сохраняющая вообще все кроме динамически загруженных ресурсов!
ChatGPT тоже понравилась идея!
*/ 

function save_all(filename) {
   var buf = buffer_create(16384, buffer_fixed, 1);

    // 🔹 1. Сохраняем глобальные переменные
    var global_vars = variable_struct_get_names(global);
    buffer_write(buf, buffer_u32, array_length(global_vars));
    for (var i = 0; i < array_length(global_vars); i++) {
        buffer_write(buf, buffer_string, global_vars[i]);
		show_debug_message("Saving type: " + string(buffer_string) + " | Value: " + string(global_vars[i]));
        save_value_to_buffer(buf, variable_global_get(global_vars[i]));
    }

    // 🔹 2. Сохраняем объекты
    var obj_list = array_create(instance_count);
    var idx = 0;
    with (all) {
        if (id != self) { // Исключаем загрузчик
            obj_list[idx] = id;
            idx++;
        }
    }
    buffer_write(buf, buffer_u32, idx); // Количество объектов
    for (var i = 0; i < idx; i++) {
        var obj = obj_list[i];
        buffer_write(buf, buffer_u32, obj.object_index);
        buffer_write(buf, buffer_f32, obj.x);
        buffer_write(buf, buffer_f32, obj.y);
        buffer_write(buf, buffer_f32, obj.direction);
        buffer_write(buf, buffer_f32, obj.speed);
        buffer_write(buf, buffer_f32, obj.image_index);
        buffer_write(buf, buffer_u32, obj.sprite_index); // ✅ Сохраняем спрайт
        buffer_write(buf, buffer_f32, obj.image_xscale);
        buffer_write(buf, buffer_f32, obj.image_yscale);
        buffer_write(buf, buffer_f32, obj.image_angle);

        // 🔹 Локальные переменные объекта
        var obj_vars = variable_instance_get_names(obj);
        buffer_write(buf, buffer_u32, array_length(obj_vars));
        for (var j = 0; j < array_length(obj_vars); j++) {
            buffer_write(buf, buffer_string, obj_vars[j]);
			show_debug_message("Saving type: " + string(buffer_string) + " | Value: " + string(obj_vars[j]));
            save_value_to_buffer(buf, variable_instance_get(obj, obj_vars[j]));
        }
    }

    // 🔹 3. Сохраняем буфер в файл
    buffer_save(buf, filename);
    buffer_delete(buf);
    
    show_debug_message("✅ Халява сохранена!");
}

function load_all(filename) {
     if (!file_exists(filename)) return;

    var buf = buffer_load(filename);
    buffer_seek(buf, buffer_seek_start, 0);

    // 🔹 1. Загружаем глобальные переменные
    var global_var_count = buffer_read(buf, buffer_u32);
    for (var i = 0; i < global_var_count; i++) {
        var var_name = buffer_read(buf, buffer_string);
       if (buffer_tell(buf) + 1 >= buffer_get_size(buf)) break; // ✅ Фикс выхода за буфер
        variable_global_set(var_name, load_value_from_buffer(buf));
    }

    // 🔹 2. Удаляем все объекты (кроме загрузчика)
    with (all) {
        if (id != self) instance_destroy();
    }

    // 🔹 3. Воссоздаём объекты
    var obj_count = buffer_read(buf, buffer_u32);
    for (var i = 0; i < obj_count; i++) {
        if (buffer_tell(buf) >= buffer_get_size(buf)) break; // ✅ Фикс выхода за границы
        var obj_index = buffer_read(buf, buffer_u32);

        var new_obj = instance_create_depth(x, y, 0, obj_index);
		new_obj.x = buffer_read(buf, buffer_f32);
        new_obj.y = buffer_read(buf, buffer_f32);
        new_obj.direction = buffer_read(buf, buffer_f32);
        new_obj.speed = buffer_read(buf, buffer_f32);
        new_obj.image_index = buffer_read(buf, buffer_f32);
        new_obj.sprite_index = buffer_read(buf, buffer_u32); // ✅ Загружаем спрайт
        new_obj.image_xscale = buffer_read(buf, buffer_f32);
        new_obj.image_yscale = buffer_read(buf, buffer_f32);
        new_obj.image_angle = buffer_read(buf, buffer_f32);

        // Загружаем локальные переменные
        var obj_var_count = buffer_read(buf, buffer_u32);
        for (var j = 0; j < obj_var_count; j++) {
            if (buffer_tell(buf) >= buffer_get_size(buf)) break; // ✅ Фикс выхода за границы
            var var_name = buffer_read(buf, buffer_string);
            variable_instance_set(new_obj, var_name, load_value_from_buffer(buf));
        }
    }

    buffer_delete(buf);
    
    show_debug_message("✅ Халява пришла!");
}


function save_value_to_buffer(buffer, value) {
    if (is_real(value)) {
        buffer_write(buffer, buffer_u8, 0); // Число
        buffer_write(buffer, buffer_f64, value);
    } else if (is_string(value)) {
        buffer_write(buffer, buffer_u8, 1); // Строка
        buffer_write(buffer, buffer_string, value);
    } else if (is_array(value)) {
        buffer_write(buffer, buffer_u8, 2); // Массив
        buffer_write(buffer, buffer_u32, array_length(value));
        for (var i = 0; i < array_length(value); i++) {
            save_value_to_buffer(buffer, value[i]);
        }
    } else {
        buffer_write(buffer, buffer_u8, 255); // Неизвестный тип
    }
}

function load_value_from_buffer(buffer) {
    if (buffer_tell(buffer) >= buffer_get_size(buffer)) return 0; // ✅ Фикс выхода за границы
    var type = buffer_read(buffer, buffer_u8);
    if (type == 0) {
        return buffer_read(buffer, buffer_f64); // Число
    } else if (type == 1) {
        return buffer_read(buffer, buffer_string); // Строка
    } else if (type == 2) {
        var arr_size = buffer_read(buffer, buffer_u32);
        var arr = array_create(arr_size);
        for (var i = 0; i < arr_size; i++) {
            arr[i] = load_value_from_buffer(buffer);
        }
        return arr;
    }
}
    