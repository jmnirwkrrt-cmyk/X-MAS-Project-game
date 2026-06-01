// впервые прибегнул к помощи ChatGPT в этом вопросе, давно хотел проверить насколько он полезен. Далее пишет сам GPT с моими правками


/// can_remove_module(x, y)
/// Проверяет, можно ли удалить модуль на (x, y) без разрыва базы.
/// Использует global.base_map – двумерный массив 6x6.
/// Возвращает **true**, если удаление допустимо, **false** – если приведёт к разрыву базы.

function debug_print_base_map(base_map, size) {
    show_debug_message("Текущая карта базы:");
    for (var yy = 0; yy < size; yy++) {
        var row = "";
        for (var xx = 0; xx < size; xx++) {
            row += base_map[xx, yy] + "\t";
        }
        show_debug_message(row);
    }
}

function can_remove_module(index) {
    var size = 6;
    
    // Создаём карту базы из одномерного массива
    var base_map;
    base_map[0, 0] = 0;
    var cx = 0, cy = 0;

    for (var i = 1; i <= 36; i++) { 
        base_map[cx, cy] = global.basebuilding[i, 0];
        cx++;
        if (cx == size) { cx = 0; cy++; }
    }
    
    debug_print_base_map(base_map, size); // Вывод карты базы перед удалением
    
    // Определяем координаты удаляемого модуля
    var mod_x = (index - 1) % size;
    var mod_y = (index - 1) div size;
    
    show_debug_message("Попытка удалить модуль: " + string(base_map[mod_x, mod_y]) + " на (" + string(mod_x) + "," + string(mod_y) + ")");
    
    // Запрещаем удаление лифта
    if (base_map[mod_x, mod_y] == "lift") {
        show_debug_message("Нельзя удалить лифт.");
        return false;
    }
    
    // Учитываем ангар (занимает 4 клетки)
    if (base_map[mod_x, mod_y] == "hangar") {
        base_map[mod_x, mod_y] = "empty";
        base_map[mod_x + 1, mod_y] = "empty";
        base_map[mod_x, mod_y - 1] = "empty";
        base_map[mod_x + 1, mod_y - 1] = "empty";
        show_debug_message("Удаление ангара с подмодулями");
    } else {
        base_map[mod_x, mod_y] = "empty";
    }
    
    debug_print_base_map(base_map, size); // Вывод карты после удаления
    
    // BFS обход от лифта
    var queue = ds_queue_create();
    var visited;
    visited[0, 0] = false;
    var vx = 0, vy = 0;
    for (var i = 1; i <= 36; i++) {
        visited[vx, vy] = false;
        vx++;
        if (vx == size) { vx = 0; vy++; }
    }
    
    var lift_pos = find_lift_index(base_map, size);
    show_debug_message("Лифт найден на (" + string(lift_pos[0]) + "," + string(lift_pos[1]) + ")");
    
    ds_queue_enqueue(queue, lift_pos);
    visited[lift_pos[0], lift_pos[1]] = true;
    
    while (!ds_queue_empty(queue)) {
        var current = ds_queue_dequeue(queue);
        var neighbors = get_neighbors(current, size);
        
        for (var i = 0; i < array_length(neighbors); i++) {
            var neighbor = neighbors[i];
            var nx = neighbor[0], ny = neighbor[1];
            
            if (!visited[nx, ny] && base_map[nx, ny] != "empty") {
                visited[nx, ny] = true;
                ds_queue_enqueue(queue, [nx, ny]);
                show_debug_message("BFS посещает модуль (" + string(nx) + "," + string(ny) + "): " + string(base_map[nx, ny]));
            }
        }
    }
    
    // Проверяем, остались ли не посещенные модули
    for (var i = 0; i < size; i++) {
        for (var j = 0; j < size; j++) {
            if (base_map[i, j] != "empty" && !visited[i, j]) {
                show_debug_message("Найден отрезанный модуль: (" + string(i) + "," + string(j) + ")");
                return false; // Найден отрезанный модуль
            }
        }
    }
    
    show_debug_message("Модуль успешно удалён, соединение сохранено.");
	show_debug_message("Карта после удаления модуля:");
	for (var j = 0; j < size; j++) {
    var row = "";
    for (var i = 0; i < size; i++) {
        row += string(base_map[i, j]) + "\t";
    }
    show_debug_message(row);
	}
    return true;
}

// Функция поиска лифта
function find_lift_index(base_map, size) {
    for (var fx = 0; fx < size; fx++) {
        for (var fy = 0; fy < size; fy++) {
            if (base_map[fx, fy] == "lift") return [fx, fy];
        }
    }
    return [-1, -1];
}

// Функция получения соседних клеток
function get_neighbors(pos, size) {
    var px = pos[0], py = pos[1];
    var neighbors = [];
    
    if (px > 0) array_push(neighbors, [px - 1, py]);
    if (px < size - 1) array_push(neighbors, [px + 1, py]);
    if (py > 0) array_push(neighbors, [px, py - 1]);
    if (py < size - 1) array_push(neighbors, [px, py + 1]);
    
    return neighbors;
}