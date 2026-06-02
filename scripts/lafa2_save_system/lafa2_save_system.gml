/// ============================================================
/// SAVE / LOAD SYSTEM
/// версия с:
/// - сохранением globals
/// - сохранением instance vars
/// - рекурсивной сериализацией array/struct
/// - явным x/y/depth
/// - relink own_id -> target_id / owner_id
/// - пропуском справочных глобалов
/// - применением vars ПОСЛЕ Create
/// ============================================================

/// ------------------------------------------------------------
/// СПИСОК СОХРАНЯЕМЫХ ОБЪЕКТОВ
/// ------------------------------------------------------------
function __save_get_object_list()
{
    return [
        time_m,
        onmap_ally,
        onmap_building,
        onmap_building_enemy,
        onmap_city,
        onmap_enemy,
        onmap_enemysite,
        onmap_escort
    ];
}

/// ------------------------------------------------------------
/// СПИСОК ОБЪЕКТОВ, КОТОРЫЕ ЧИСТИМ ПЕРЕД ЗАГРУЗКОЙ
/// ------------------------------------------------------------
function __save_get_clear_object_list()
{
    return [
        onmap_ally,
        onmap_building,
        onmap_building_enemy,
        onmap_city,
        onmap_enemy,
        onmap_enemysite,
        onmap_escort
    ];
}

/// ------------------------------------------------------------
/// КАКИЕ GLOBAL СОХРАНЯТЬ НЕ НУЖНО
/// Сюда добавляй все справочники, runtime-ссылки и прочее,
/// что должно собираться обычной инициализацией, а не сейвом
/// ------------------------------------------------------------
function __save_should_skip_global(_name, _val)
{
    if (string_length(_name) >= 2 && string_copy(_name, 1, 2) == "@@") return true;
    if (is_method(_val)) return true;

    // Пропускаем только txt + число: txt1, txt174, txt9999...
    if (string_length(_name) > 3 && string_copy(_name, 1, 3) == "txt")
    {
        var _suffix = string_delete(_name, 1, 3);
        if (real(_suffix) > 0 || _suffix == "0") return true;
    }
	
	if (string_length(_name) > 5 && string_copy(_name, 1, 5) == "wikit")
    {
        var _suffix = string_delete(_name, 1, 5);
        if (real(_suffix) > 0 || _suffix == "0") return true;
    }
	
	if (string_length(_name) >= 17 && string_copy(_name, 1, 17) == "map_messages_text") return true;

    switch (_name)
    {
        case "onmapbuilding":
        case "planedata":
		case "buyable":
		case "items":
        case "plane_modules":
        case "airweapon":
		case "game_version":
        case "eggplanedata":
            return true;

        case "baseonmap":
            return true;
		case "game_autoloading":
			return true;
		case "game_loading":
			return true;
    }

    return false;
}

/// ------------------------------------------------------------
/// РЕКУРСИВНАЯ СЕРИАЛИЗАЦИЯ
/// ------------------------------------------------------------
function __save_value(_val)
{
    if (is_method(_val))
    {
        return { __save_type: "method_skip" };
    }

    if (is_undefined(_val))
    {
        return { __save_type: "undefined" };
    }

    if (is_array(_val))
    {
        var _len = array_length(_val);
        var _items = array_create(_len);

        for (var i = 0; i < _len; i++)
        {
            _items[i] = __save_value(_val[i]);
        }

        return {
            __save_type : "array",
            items       : _items
        };
    }

    if (is_struct(_val))
    {
        var _names = struct_get_names(_val);
        var _count = array_length(_names);
        var _out = {};

        for (var i = 0; i < _count; i++)
        {
            var _name = _names[i];
            var _field = struct_get(_val, _name);

            if (is_method(_field)) continue;

            struct_set(_out, _name, __save_value(_field));
        }

        return {
            __save_type : "struct",
            fields      : _out
        };
    }

    return _val;
}

/// ------------------------------------------------------------
/// РЕКУРСИВНАЯ ДЕСЕРИАЛИЗАЦИЯ
/// ------------------------------------------------------------
function __load_value(_val)
{
    if (is_struct(_val) && variable_struct_exists(_val, "__save_type"))
    {
        switch (_val.__save_type)
        {
            case "undefined":
                return undefined;

            case "method_skip":
                return undefined;

            case "array":
            {
                if (!variable_struct_exists(_val, "items")) return [];
                var _src = _val.items;
                if (!is_array(_src)) return [];

                var _len = array_length(_src);
                var _arr = array_create(_len);

                for (var i = 0; i < _len; i++)
                {
                    _arr[i] = __load_value(_src[i]);
                }

                return _arr;
            }

            case "struct":
            {
                if (!variable_struct_exists(_val, "fields")) return {};
                var _src = _val.fields;
                if (!is_struct(_src)) return {};

                var _names = struct_get_names(_src);
                var _count = array_length(_names);
                var _out = {};

                for (var i = 0; i < _count; i++)
                {
                    var _name = _names[i];
                    struct_set(_out, _name, __load_value(struct_get(_src, _name)));
                }

                return _out;
            }
        }
    }

    return _val;
}

/// ------------------------------------------------------------
/// СОБРАТЬ СОХРАНЯЕМЫЕ ПЕРЕМЕННЫЕ ИНСТАНСА
/// x/y/depth отдельно
/// ------------------------------------------------------------
function __save_instance_vars(_inst)
{
    var _out = {};
    var _names = variable_instance_get_names(_inst);
    var _count = array_length(_names);

    for (var i = 0; i < _count; i++)
    {
        var _name = _names[i];

        if (string_length(_name) >= 2 && string_copy(_name, 1, 2) == "@@") continue;

        if (_name == "id") continue;
        if (_name == "object_index") continue;
        if (_name == "x") continue;
        if (_name == "y") continue;
        if (_name == "depth") continue;
        if (_name == "layer") continue;

        var _v = variable_instance_get(_inst, _name);

        if (is_method(_v)) continue;

        struct_set(_out, _name, __save_value(_v));
    }

    return _out;
}

/// ------------------------------------------------------------
/// DEBUG 2D ARRAY
/// ------------------------------------------------------------
function debug_array_2d(_arr, _name)
{
    if (!is_array(_arr))
    {
        show_debug_message("[ARRAY DEBUG] " + _name + " не массив");
        return;
    }

    var _outer = array_length(_arr);
    show_debug_message("[ARRAY DEBUG] " + _name + " outer len = " + string(_outer));

    for (var i = 0; i < _outer; i++)
    {
        if (is_array(_arr[i]))
        {
            show_debug_message("[ARRAY DEBUG] " + _name + "[" + string(i) + "] len = " + string(array_length(_arr[i])));
        }
        else if (is_undefined(_arr[i]))
        {
            show_debug_message("[ARRAY DEBUG] " + _name + "[" + string(i) + "] = undefined");
        }
        else
        {
            show_debug_message("[ARRAY DEBUG] " + _name + "[" + string(i) + "] не подмассив");
        }
    }
}

/// ------------------------------------------------------------
/// DEBUG ОБЪЕКТОВ ИЗ СЕЙВА
/// ------------------------------------------------------------
function __debug_dump_loaded_objects(_save_data, _limit)
{
    if (!variable_struct_exists(_save_data, "objects"))
    {
        show_debug_message("[LOAD DEBUG] В save_data нет поля objects");
        return;
    }

    var _arr = _save_data.objects;
    var _count = array_length(_arr);
    var _max = min(_count, _limit);

    show_debug_message("[LOAD DEBUG] objects count = " + string(_count));

    for (var i = 0; i < _max; i++)
    {
        var _rec = _arr[i];

        var _name  = variable_struct_exists(_rec, "obj_name") ? string(_rec.obj_name) : "<NO_NAME>";
        var _x     = variable_struct_exists(_rec, "x") ? string(_rec.x) : "<NO_X>";
        var _y     = variable_struct_exists(_rec, "y") ? string(_rec.y) : "<NO_Y>";
        var _depth = variable_struct_exists(_rec, "depth") ? string(_rec.depth) : "<NO_DEPTH>";

        show_debug_message("[LOAD DEBUG] #" + string(i) + " " + _name
            + " x=" + _x + " y=" + _y + " depth=" + _depth);
    }
}

/// ------------------------------------------------------------
/// НАЙТИ ИНСТАНС ПО own_id
/// ------------------------------------------------------------
function __find_created_instance_by_own_id(_created_instances, _wanted_id)
{
    if (is_undefined(_wanted_id)) return noone;
    if (_wanted_id == noone) return noone;

    var _len = array_length(_created_instances);

    for (var i = 0; i < _len; i++)
    {
        var _inst = _created_instances[i];

        if (_inst == noone) continue;
        if (!instance_exists(_inst)) continue;
        if (!variable_instance_exists(_inst, "own_id")) continue;

        if (variable_instance_get(_inst, "own_id") == _wanted_id)
        {
            return _inst;
        }
    }

    return noone;
}

/// ------------------------------------------------------------
/// ВОССТАНОВИТЬ ССЫЛКИ ПО *_id
/// ------------------------------------------------------------
function __resolve_saved_links(_created_instances)
{
    var _pairs =
    [
        ["target_id", "target"],
        ["owner_id",  "owner"]
    ];

    var _inst_count = array_length(_created_instances);
    var _pair_count = array_length(_pairs);

    for (var i = 0; i < _inst_count; i++)
    {
        var _inst = _created_instances[i];

        if (_inst == noone) continue;
        if (!instance_exists(_inst)) continue;

        for (var p = 0; p < _pair_count; p++)
        {
            var _id_var  = _pairs[p][0];
            var _ref_var = _pairs[p][1];

            if (variable_instance_exists(_inst, _id_var))
            {
                var _wanted_id = variable_instance_get(_inst, _id_var);
                var _target = __find_created_instance_by_own_id(_created_instances, _wanted_id);

                variable_instance_set(_inst, _ref_var, _target);
            }
        }
    }

    // Восстановить ссылку на базу
    global.baseonmap = noone;
    for (var i = 0; i < instance_number(onmap_building); i++)
    {
        var obj = instance_find(onmap_building, i);
        if (obj != noone && obj.type == 1)
        {
            global.baseonmap = obj;
            break;
        }
    }
}

/// ------------------------------------------------------------
/// ПРИМЕНИТЬ СОХРАНЁННЫЕ ПЕРЕМЕННЫЕ К УЖЕ СОЗДАННОМУ ИНСТАНСУ
/// ВАЖНО: это делается ПОСЛЕ Create, чтобы Create не затёр save vars
/// ------------------------------------------------------------
function __apply_loaded_vars_to_instance(_inst, _inst_data)
{
    if (!variable_struct_exists(_inst_data, "vars")) return;
    if (!is_struct(_inst_data.vars)) return;

    var _vars = _inst_data.vars;
    var _names = struct_get_names(_vars);
    var _count = array_length(_names);

    for (var i = 0; i < _count; i++)
    {
        var _name = _names[i];

        if (_name == "id") continue;
        if (_name == "object_index") continue;
        if (_name == "layer") continue;
		if (_name == "drawradar") continue;
		if (_name == "drawaa") continue;
		if (_name == "text") continue;
		if (_name == "drw") continue;
        if (string_length(_name) >= 2 && string_copy(_name, 1, 2) == "@@") continue;

        var _val = __load_value(struct_get(_vars, _name));
        variable_instance_set(_inst, _name, _val);
    }
}

/// ------------------------------------------------------------
/// СОХРАНЕНИЕ
/// ------------------------------------------------------------
function save_game_json(_filename)
{
    var save_data =
    {
        globals : [],
        objects : []
    };

    // 1) Globals
    var gnames = variable_instance_get_names(global);
    var gcount = array_length(gnames);

    for (var i = 0; i < gcount; i++)
    {
        var _name = gnames[i];
        var _val = variable_global_get(_name);

        if (__save_should_skip_global(_name, _val)) continue;

        array_push(save_data.globals,
        {
            name  : _name,
            value : __save_value(_val)
        });
    }

    // 2) Objects
    var obj_list = __save_get_object_list();
    var obj_len  = array_length(obj_list);

    for (var oi = 0; oi < obj_len; oi++)
    {
        var _obj = obj_list[oi];

        with (_obj)
        {
            var _inst_data =
            {
                obj_name : object_get_name(object_index),
                x        : x,
                y        : y,
                depth    : depth,
                vars     : __save_instance_vars(id)
            };

            array_push(save_data.objects, _inst_data);
        }
    }

    // 3) JSON -> file
    var _json = json_stringify(save_data, true);

    var _file = file_text_open_write(_filename);
    file_text_write_string(_file, _json);
    file_text_close(_file);

    show_debug_message("✅ Сохранение завершено: " + string(_filename));
    show_debug_message("✅ Сохранено объектов: " + string(array_length(save_data.objects)));
}

/// ------------------------------------------------------------
/// ЗАГРУЗКА
/// ------------------------------------------------------------
function load_game_json(_filename)
{
    if (!file_exists(_filename))
    {
        show_debug_message("❌ Файл сохранения не найден: " + string(_filename));
        return false;
    }

    // 1) Читаем файл
    var _file = file_text_open_read(_filename);
    var _json = "";

    while (!file_text_eof(_file))
    {
        _json += file_text_readln(_file);
        if (!file_text_eof(_file)) _json += "\n";
    }

    file_text_close(_file);

    // 2) Парсим JSON
    var save_data = json_parse(_json);

    if (!is_struct(save_data))
    {
        show_debug_message("❌ json_parse вернул не struct");
        return false;
    }

    __debug_dump_loaded_objects(save_data, 20);

    // 3) Восстанавливаем globals
    // Справочные таблицы типа global.onmapbuilding не трогаем
    if (variable_struct_exists(save_data, "globals"))
    {
        var garr = save_data.globals;
        var glen = array_length(garr);

        for (var i = 0; i < glen; i++)
        {
            var _rec = garr[i];

            if (!variable_struct_exists(_rec, "name")) continue;
            if (!variable_struct_exists(_rec, "value")) continue;

            var _name = _rec.name;
            var _val = __load_value(_rec.value);

            if (__save_should_skip_global(_name, _val)) continue;

            variable_global_set(_name, _val);
        }
		
		global.baseonmap = time_m; // заглушка для избегания краша во время воссоздания эскадрилий, ссылка на базу будет восстановлена позже
    }

    // Если нужно, можно посмотреть, что стартовый справочник жив:
    // debug_array_2d(global.onmapbuilding, "global.onmapbuilding");

    // 4) Сносим старые world-объекты
    var clear_list = __save_get_clear_object_list();
    var clear_len  = array_length(clear_list);

    for (var oi = 0; oi < clear_len; oi++)
    {
        instance_destroy(clear_list[oi]);
    }

    // 5) Создаём объекты
    // ВАЖНО: создаём БЕЗ var_struct и накатываем vars ПОСЛЕ Create
    var created_instances = [];

    if (variable_struct_exists(save_data, "objects"))
    {
        var obj_arr   = save_data.objects;
        var obj_count = array_length(obj_arr);

        for (var i = 0; i < obj_count; i++)
        {
            var _inst_data = obj_arr[i];

            if (!variable_struct_exists(_inst_data, "obj_name"))
            {
                show_debug_message("⚠ Запись объекта без obj_name, пропускаю #" + string(i));
                continue;
            }

            var _obj_name  = _inst_data.obj_name;
            var _obj_index = asset_get_index(_obj_name);

            if (_obj_index == -1)
            {
                show_debug_message("⚠ Объект " + string(_obj_name) + " не найден, пропускаю.");
                continue;
            }

            var _x     = variable_struct_exists(_inst_data, "x")     ? _inst_data.x     : 0;
            var _y     = variable_struct_exists(_inst_data, "y")     ? _inst_data.y     : 0;
            var _depth = variable_struct_exists(_inst_data, "depth") ? _inst_data.depth : 0;

            show_debug_message("[LOAD] " + string(_obj_name)
                + " -> x=" + string(_x)
                + " y=" + string(_y)
                + " depth=" + string(_depth));

            var _inst = noone;

            if (_obj_name == "time_m")
            {
                _inst = instance_find(time_m, 0);

                if (_inst == noone)
                {
                    _inst = instance_create_depth(_x, _y, _depth, _obj_index);
                }
                else
                {
                    _inst.x = _x;
                    _inst.y = _y;
                    _inst.depth = _depth;
                }
            }
            else
            {
                _inst = instance_create_depth(_x, _y, _depth, _obj_index);
            }

            if (_inst != noone)
            {
                __apply_loaded_vars_to_instance(_inst, _inst_data);
                array_push(created_instances, _inst);
            }
        }
    }

    // 6) Восстановление ссылок
    __resolve_saved_links(created_instances);

    // DEBUG
    // debug_array_2d(global.onmapbuilding, "global.onmapbuilding");

    show_debug_message("✅ Загрузка завершена: " + string(_filename));
    show_debug_message("✅ Восстановлено инстансов: " + string(array_length(created_instances)));

    return true;
}