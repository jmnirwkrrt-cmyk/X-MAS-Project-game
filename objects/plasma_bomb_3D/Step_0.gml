/*
var px = x, py = y, pz = z;

x += vx;
y += vy;
z += vz;

life--;
if (life <= 0) { instance_destroy(); exit; }

// проверка "пролетели цель" (надёжнее, чем distance>prev_distance)
var tx = target_x - x;
var ty = target_y - y;
var tz = target_z - z;

if (tx*dirx + ty*diry + tz*dirz <= 0) {
    x = target_x; y = target_y; z = target_z;
    instance_destroy();
    exit;
}

// страховка: если вдруг цель внутри/под полом/столбом
var fz = gm3d_get_pillar_height_at(x, y); // 0 или pillar_height
if (z <= fz) { instance_destroy(); exit; }

// визуальный угол (только для спрайта)
image_angle = point_direction(px, py, x, y) - 90;
*/