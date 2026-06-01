live_time--;
if (live_time < 1) { instance_destroy(self); exit; } 
direction = point_direction(x,y, point_x, point_y);

if (distance_to_point(point_x, point_y) < 30)
{
	var clas = gm3d_random_point_any_surface(r, 100);
	point_x = clas[0];
	point_y = clas[1];
	var clas = gm3d_clamp_to_arena(point_x, point_y, r);
	
	point_x = clas[0];
	point_y = clas[1];
}


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
}


z = floor_z + 25;


/*
if (distance_to_point(point_x, point_y) < 30)
{
point_x = irandom_range(0, global.arena_half * 2);
point_y = irandom_range(0, global.arena_half * 2);
var clas = gm3d_clamp_to_arena(point_x, point_y, r);

point_x = clas[0];
point_y = clas[1];
}
speed = 2;


*/
