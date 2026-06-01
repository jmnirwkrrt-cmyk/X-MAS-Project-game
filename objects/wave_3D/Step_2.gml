time--;
if (time < 1) { image_alpha -= 0.05; }
if (image_alpha = 0) { instance_destroy(self); }

x += vel_x;
y += vel_y;

var direct = gm3d_direct4_cam_from_vec(vel_x, vel_y, oArena3D.cam_angle - 90, "up");
if (direct == "right") { sprite_index = wave_right; }
if (direct == "left") { sprite_index = wave_left; }
if (direct == "up") { sprite_index = wave_up; }
if (direct == "down") { sprite_index = wave_down; }

// чтобы не сбегала с арены:
//var clas = gm3d_clamp_to_arena(x, y, r);
//x = clas[0];
//y = clas[1];

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

    if (new_floor_z != floor_z) { instance_destroy(self); }
}

