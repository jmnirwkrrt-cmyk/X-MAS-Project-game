/// Create: obj_arena3d

// --- Вью и камера ---
view_enabled    = true;
view_visible[0] = true;

cam = camera_create();
view_camera[0] = cam;

// Размер арены (в мире)
arena_half_w = 320;
arena_half_h = 240;

// Ортографическая проекция под размер арены
var proj_w = arena_half_w * 2;
var proj_h = arena_half_h * 2;

proj_mat = matrix_build_projection_ortho(proj_w, proj_h, 1.0, 32000.0);
camera_set_proj_mat(cam, proj_mat); // ортопроекция для камеры :contentReference[oaicite:8]{index=8}

// --- Параметры камеры ---
cam_angle  = 45;    // поворот вокруг арены (в градусах)
cam_dist   = 600;   // дистанция в плоскости X/Y
cam_height = 400;   // высота камеры (Z)

CAM_FREE   = 0;
CAM_FOLLOW = 1;
cam_mode   = CAM_FREE;
cam_target = noone;

// Точка, в которую смотрит камера (центр арены по умолчанию)
target_x = 0;
target_y = 0;
target_z = 0;

// --- GPU и матрицы ---
gpu_set_ztestenable(true);   // включаем z-buffer :contentReference[oaicite:9]{index=9}
gpu_set_zwriteenable(true);
gpu_set_cullmode(cull_noculling); // пока без бэк-фейс куллинга :contentReference[oaicite:10]{index=10}

world_mat = matrix_build_identity();
matrix_set(matrix_world, world_mat);

// --- Текстуры ---
tex_floor = sprite_get_texture(terrain_1s, 0);
tex_wall  = sprite_get_texture(spr_wall,  0); 

// --- Вершинный формат: позиция 3D + UV ---
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vf_3d = vertex_format_end(); 

// ---------- ПОЛ ----------
vbuf_floor = vertex_create_buffer();

var hw = arena_half_w;
var hh = arena_half_h;

// повтор текстуры по полу
var rep_x = 4;
var rep_y = 3;

vertex_begin(vbuf_floor, vf_3d);

// два треугольника на плоскости Z = 0
vertex_position_3d(vbuf_floor, -hw, -hh, 0); vertex_texcoord(vbuf_floor, 0,    0);
vertex_position_3d(vbuf_floor,  hw, -hh, 0); vertex_texcoord(vbuf_floor, rep_x,0);
vertex_position_3d(vbuf_floor,  hw,  hh, 0); vertex_texcoord(vbuf_floor, rep_x,rep_y);

vertex_position_3d(vbuf_floor, -hw, -hh, 0); vertex_texcoord(vbuf_floor, 0,    0);
vertex_position_3d(vbuf_floor,  hw,  hh, 0); vertex_texcoord(vbuf_floor, rep_x,rep_y);
vertex_position_3d(vbuf_floor, -hw,  hh, 0); vertex_texcoord(vbuf_floor, 0,    rep_y);

vertex_end(vbuf_floor);
vertex_freeze(vbuf_floor); 


// ---------- СТОЛБЫ (фиксированная высота, без пересечений) ----------

pillar_height = 96;  // на такую высоту можно запрыгнуть
pillar_size   = 64;
pillar_count  = 10;

pillars = []; // массив: каждый элемент — {x1,y1,x2,y2,z0,z1}

vbuf_walls = vertex_create_buffer();
vbuf_tops  = vertex_create_buffer();

vertex_begin(vbuf_walls, vf_3d);
vertex_begin(vbuf_tops,  vf_3d);

// локальная функция проверки пересечения прямоугольников
var pillar_intersects = function(x1, y1, x2, y2)
{
    var n = array_length(pillars);
    for (var i = 0; i < n; i++)
    {
        var p = pillars[i];
        // если не пересекаются — продолжаем
        if (x2 <= p.x1 || x1 >= p.x2 || y2 <= p.y1 || y1 >= p.y2)
        {
            // ок
        }
        else
        {
            return true;
        }
    }
    return false;
};

for (var i = 0; i < pillar_count; i++)
{
    var placed  = false;
    var attempts = 0;
    
    while (!placed && attempts < 50)
    {
        attempts++;
        
        // рандомный центр столба, с отступом от краёв
        var px = irandom_range(-hw + pillar_size, hw - pillar_size);
        var py = irandom_range(-hh + pillar_size, hh - pillar_size);
        
        var s  = pillar_size * 0.5;
        var x1 = px - s;
        var x2 = px + s;
        var y1 = py - s;
        var y2 = py + s;
        
        if (pillar_intersects(x1, y1, x2, y2)) continue; // пересекается — пробуем ещё
        
        placed = true;
        
        var z0 = 0;
        var z1 = pillar_height;
        
        // запоминаем для геймплея (коллизии/прыжки)
        var p = { x1:x1, y1:y1, x2:x2, y2:y2, z0:z0, z1:z1 };
        pillars[array_length(pillars)] = p;
        
        // ---- стенки (4 стороны, по 2 треугольника) ----
        // front (y1)
        vertex_position_3d(vbuf_walls, x1, y1, z0); vertex_texcoord(vbuf_walls, 0, 1);
        vertex_position_3d(vbuf_walls, x2, y1, z0); vertex_texcoord(vbuf_walls, 1, 1);
        vertex_position_3d(vbuf_walls, x2, y1, z1); vertex_texcoord(vbuf_walls, 1, 0);

        vertex_position_3d(vbuf_walls, x1, y1, z0); vertex_texcoord(vbuf_walls, 0, 1);
        vertex_position_3d(vbuf_walls, x2, y1, z1); vertex_texcoord(vbuf_walls, 1, 0);
        vertex_position_3d(vbuf_walls, x1, y1, z1); vertex_texcoord(vbuf_walls, 0, 0);

        // back (y2)
        vertex_position_3d(vbuf_walls, x2, y2, z0); vertex_texcoord(vbuf_walls, 0, 1);
        vertex_position_3d(vbuf_walls, x1, y2, z0); vertex_texcoord(vbuf_walls, 1, 1);
        vertex_position_3d(vbuf_walls, x1, y2, z1); vertex_texcoord(vbuf_walls, 1, 0);

        vertex_position_3d(vbuf_walls, x2, y2, z0); vertex_texcoord(vbuf_walls, 0, 1);
        vertex_position_3d(vbuf_walls, x1, y2, z1); vertex_texcoord(vbuf_walls, 1, 0);
        vertex_position_3d(vbuf_walls, x2, y2, z1); vertex_texcoord(vbuf_walls, 0, 0);

        // left (x1)
        vertex_position_3d(vbuf_walls, x1, y2, z0); vertex_texcoord(vbuf_walls, 0, 1);
        vertex_position_3d(vbuf_walls, x1, y1, z0); vertex_texcoord(vbuf_walls, 1, 1);
        vertex_position_3d(vbuf_walls, x1, y1, z1); vertex_texcoord(vbuf_walls, 1, 0);

        vertex_position_3d(vbuf_walls, x1, y2, z0); vertex_texcoord(vbuf_walls, 0, 1);
        vertex_position_3d(vbuf_walls, x1, y1, z1); vertex_texcoord(vbuf_walls, 1, 0);
        vertex_position_3d(vbuf_walls, x1, y2, z1); vertex_texcoord(vbuf_walls, 0, 0);

        // right (x2)
        vertex_position_3d(vbuf_walls, x2, y1, z0); vertex_texcoord(vbuf_walls, 0, 1);
        vertex_position_3d(vbuf_walls, x2, y2, z0); vertex_texcoord(vbuf_walls, 1, 1);
        vertex_position_3d(vbuf_walls, x2, y2, z1); vertex_texcoord(vbuf_walls, 1, 0);

        vertex_position_3d(vbuf_walls, x2, y1, z0); vertex_texcoord(vbuf_walls, 0, 1);
        vertex_position_3d(vbuf_walls, x2, y2, z1); vertex_texcoord(vbuf_walls, 1, 0);
        vertex_position_3d(vbuf_walls, x2, y1, z1); vertex_texcoord(vbuf_walls, 0, 0);

        // ---- верхушка (как кусок пола) ----
        vertex_position_3d(vbuf_tops, x1, y1, z1); vertex_texcoord(vbuf_tops, 0, 0);
        vertex_position_3d(vbuf_tops, x2, y1, z1); vertex_texcoord(vbuf_tops, 1, 0);
        vertex_position_3d(vbuf_tops, x2, y2, z1); vertex_texcoord(vbuf_tops, 1, 1);

        vertex_position_3d(vbuf_tops, x1, y1, z1); vertex_texcoord(vbuf_tops, 0, 0);
        vertex_position_3d(vbuf_tops, x2, y2, z1); vertex_texcoord(vbuf_tops, 1, 1);
        vertex_position_3d(vbuf_tops, x1, y2, z1); vertex_texcoord(vbuf_tops, 0, 1);
    }
}

vertex_end(vbuf_walls);
vertex_freeze(vbuf_walls);

vertex_end(vbuf_tops);
vertex_freeze(vbuf_tops);
