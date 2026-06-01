/*

var px = x, py = y, pz = z;

x += vx;
y += vy;
z += vz;

vz -= g;

t += 1;
life -= 1;
if (life <= 0) { instance_destroy(); exit; }

// Вращение (или можешь сделать привязку к скорости)
image_angle += spin;

// Коллизия только по высоте (пол или верх столба)
var fz = gm3d_get_pillar_height_at(x, y); // 0 или global.pillar_height
if (z <= fz)
{
    z = fz;

    // тут твой взрыв/урон/эффект
    // example:
    // var e = instance_create_depth(x, y, -9999, oExplosion3D);
    // e.z = z;

    instance_destroy();
    exit;
}

// Перелёт по времени (на случай, если target в воздухе/невалидный)
if (t >= T + 6)
{
    // можно “дожать” к цели, если надо:
    // x = target_x; y = target_y; z = target_z;

    instance_destroy();
    exit;
}

// если хочешь, чтобы спрайт “смотрел по полёту”:
//image_angle = point_direction(px, py, x, y) - 90;

*/