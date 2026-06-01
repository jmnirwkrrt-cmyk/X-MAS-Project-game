image_angle++;



var distance = point_distance_3d(x, y, z, target_x, target_y, target_z);
var distance_2d = point_distance(x, y, target_x, target_y);
//if (distance > target_prev_distance) instance_destroy(self);

if (distance > target_dist / 2 && speed > throwv / 10) speed -= 0.1;
else
if (distance < target_dist / 2 && speed < throwv) speed += 0.15;

// Первая половина траектории — граната набирает высоту,
// но только если ещё не достигла вершины дуги.
if (distance_2d > target_dist / 2 && z < zmax)
{
    z += 0.1;
}
else
// Вторая половина — тянем z к высоте цели.
// Работает и для броска вниз, и для броска вверх.
if (distance_2d <= target_dist / 2)
{
    if (z > target_z)
    {
        z -= 1;
    }
    else
    if (z < target_z)
    {
        z += 1;
    }
}

// Небольшой snap к высоте цели уже почти в точке броска,
// чтобы не висеть на дробном расхождении.
if (distance < target_dist / 20 && abs(z - target_z) < 1)
{
    z = target_z;
}

direction = point_direction(x, y, target_x, target_y);
target_prev_distance = distance;
if (distance < speed) instance_destroy(self);


if (true) { // !airborne
    var new_floor_z = 0;

    if (is_array(global.arena_pillars)) {
        var n3 = array_length(global.arena_pillars);
        var size3 = global.pillar_size;
        var half3 = size3 * 0.5;

        for (var k = 0; k < n3; k++) {
            var pp = global.arena_pillars[k];
            if (abs(x - pp.x) < half3 && abs(y - pp.y) < half3) {
                new_floor_z = global.pillar_height;
                break;
            }
        }
    }

    var prev_floor_z = floor_z;
    floor_z = new_floor_z;

    if (floor_z >= z) instance_destroy(self);
	
}




