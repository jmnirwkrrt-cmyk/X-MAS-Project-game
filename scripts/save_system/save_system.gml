/* 
Сохранение игры по методу, который предложил ChatGPT. Ума не приложу, что я бы без него делал.
Он предложил записать все текущие глобальные переменные через DS_map. Встроенная система сохранений сама по себе
не подходит, а комбинированная будет запасным вариантом, потому что это тот ещё геморрой. 
Надо иметь ввиду, что все объекты на карте все же придется воссоздавать, к счастью, за счет ограничения 
сохранениями только на карте мира, это не так трудно, так как многое там и так изначально записано в переменных
и создается по их значениям. 
*/


/// save_globals("savefile.dat")
/// Сохраняет все глобальные переменные в файл
function save_globals(_filename) {
    var buffer = buffer_create(8192, buffer_grow, 1);
    var global_map = variable_struct_get_names(global);
    var len = array_length(global_map);

    buffer_write(buffer, buffer_u16, len); // Количество переменных

    for (var i = 0; i < len; i++) {
        var var_name = global_map[i];
        var var_value = variable_global_get(var_name);

        buffer_write(buffer, buffer_string, var_name);

        if (is_real(var_value)) {
            buffer_write(buffer, buffer_u8, 0); // Число
            buffer_write(buffer, buffer_f64, var_value);
        } 
        else if (is_string(var_value)) {
            buffer_write(buffer, buffer_u8, 1); // Строка
            buffer_write(buffer, buffer_string, var_value);
        } 
        else if (is_array(var_value)) {
            buffer_write(buffer, buffer_u8, 2); // Массив
            var rows = array_length(var_value);
            buffer_write(buffer, buffer_u16, rows); // Кол-во строк

            for (var j = 0; j < rows; j++) {
                var row = var_value[j];
                var cols = array_length(row);
                buffer_write(buffer, buffer_u16, cols); // Кол-во столбцов

                for (var k = 0; k < cols; k++) {
                    var cell = row[k];
                    if (is_real(cell)) {
                        buffer_write(buffer, buffer_u8, 0); // Число
                        buffer_write(buffer, buffer_f64, cell);
                    } 
                    else if (is_string(cell)) {
                        buffer_write(buffer, buffer_u8, 1); // Строка
                        buffer_write(buffer, buffer_string, cell);
                    }
                }
            }
        }
    }

    buffer_save(buffer, _filename);
    buffer_delete(buffer);
}

/// load_globals("savefile.dat")
/// Загружает глобальные переменные из файла
function load_globals(_filename) {
    if (!file_exists(_filename)) return;

    var buffer = buffer_load(_filename);
    buffer_seek(buffer, buffer_seek_start, 0);
    
    var len = buffer_read(buffer, buffer_u16);

    for (var i = 0; i < len; i++) {
        var var_name = buffer_read(buffer, buffer_string);
        var var_type = buffer_read(buffer, buffer_u8);

        if (var_type == 0) { // Число
            variable_global_set(var_name, buffer_read(buffer, buffer_f64));
        } 
        else if (var_type == 1) { // Строка
            variable_global_set(var_name, buffer_read(buffer, buffer_string));
        } 
        else if (var_type == 2) { // Массив
            var rows = buffer_read(buffer, buffer_u16);
            var arr = [];

            for (var j = 0; j < rows; j++) {
                var cols = buffer_read(buffer, buffer_u16);
                arr[j] = [];
                for (var k = 0; k < cols; k++) {
                    var cell_type = buffer_read(buffer, buffer_u8);
                    if (cell_type == 0) {
                        arr[j][k] = buffer_read(buffer, buffer_f64);
                    } else if (cell_type == 1) {
                        arr[j][k] = buffer_read(buffer, buffer_string);
                    }
                }
            }
            variable_global_set(var_name, arr);
        }
    }

    buffer_delete(buffer);
}
