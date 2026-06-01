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

    if (floor_z > z) instance_destroy(self);
}