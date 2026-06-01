direction = point_direction(x, y, target_x, target_y);

// --- Правильное изменение Z ---
var xy_dist = max(0.0001, target_xy_dist);
var z_step  = (target_z_delta / xy_dist) * speed;

z += z_step;

if (target_z_delta > 0 && z > target_z) z = target_z;
if (target_z_delta < 0 && z < target_z) z = target_z;


// --- Дистанция до точки назначения ---
var distance = point_distance_3d(x, y, z, target_x, target_y, target_z);

if (distance > target_prev_distance)
{
    x = target_x;
    y = target_y;
    z = target_z;
    instance_destroy(self);
    exit;
}

target_prev_distance = distance;

if (distance <= speed)
{
    x = target_x;
    y = target_y;
    z = target_z;
    instance_destroy(self);
    exit;
}


image_angle = direction - 90;


// --- Проверка пола / вершины столба ---
var new_floor_z = 0;

if (is_array(global.arena_pillars))
{
    var n3 = array_length(global.arena_pillars);
    var size3 = global.pillar_size;
    var half3 = size3 * 0.5;

    for (var k = 0; k < n3; k++)
    {
        var pp = global.arena_pillars[k];

        if (abs(x - pp.x) < half3 && abs(y - pp.y) < half3)
        {
            new_floor_z = global.pillar_height;
            break;
        }
    }
}

floor_z = new_floor_z;

if (z <= floor_z)
{
    z = floor_z;
    instance_destroy(self);
    exit;
}












/*
var px = x;
var py = y;
var pz = z;

x += vx;
y += vy;
z += vz;

life -= 1;
if (life <= 0) { instance_destroy(); exit; }

// 1) непрерывная коллизия со столбами (луч по отрезку)
var hit = gm3d_raycast_pillars(px, py, pz, x, y, z);
if (is_array(hit))
{
    x = hit[0];
    y = hit[1];
    z = hit[2];
    instance_destroy();
    exit;
}

// 2) коллизия с полом/верхом столба
var fz = gm3d_get_pillar_height_at(x, y); // 0 или pillar_height
if (z <= fz)
{
    z = fz;
    instance_destroy();
    exit;
}

// 3) проверка "перелёта" цели (надёжнее distance>prev_distance)
var to_tx = target_x - x;
var to_ty = target_y - y;
var to_tz = target_z - z;

var dot = to_tx*dirx + to_ty*diry + to_tz*dirz;
if (dot <= 0)
{
    instance_destroy();
    exit;
}

image_angle = point_direction(px, py, x, y) - 90;

*/
