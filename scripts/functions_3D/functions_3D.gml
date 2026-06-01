/// gm3d_hero_direction_to_object(obj_target, direct)
/// Направление взгляда героя на объект на ортогональной арене с учётом угла камеры.

function gm3d_hero_direction_to_object(obj_target, direct)
{
    if (!instance_exists(obj_target)) return direct;

    var tx = obj_target.x;
    var ty = obj_target.y;

    var ang = point_direction(x, y, tx, ty);

    var arena = instance_find(oArena3D, 0);
    var cam_ang = 0;
    if (instance_exists(arena)) {
        cam_ang = arena.cam_angle;
    }

    ang = ang - cam_ang;
    ang = ang mod 360;
	ang += 90;
    if (ang < 0) ang += 360;

    if (ang >= 315 || ang < 45) {
        direct = "right";
    }
    else if (ang < 135) {
        direct = "down";
    }
    else if (ang < 225) {
        direct = "left";
    }
    else {
        direct = "up";
    }

    return direct;
}






/// gm3d_world_to_screen(_x, _y, _z)
/// Возвращает [screen_x, screen_y, ndc_z] или undefined, используется система DRAW GUI!
function gm3d_world_to_screen(_x, _y, _z)
{
    var cam = view_camera[0];
    if (cam < 0) return undefined;

    // Матрицы камеры
    var view = camera_get_view_mat(cam);
    var proj = camera_get_proj_mat(cam);

    // Важно: тот же порядок, что и в рендере (world * view * proj)
    // world у нас identity, так что view * proj
    var vp = matrix_multiply(view, proj);

    // Мировая точка -> клип-пространство
    var v = matrix_transform_vertex(vp, _x, _y, _z, 1);
    var w = v[3];
    if (w == 0) return undefined;

    // NDC (-1..1)
    var ndc_x = v[0] / w;
    var ndc_y = v[1] / w;

    // Размер GUI / окна (а не view'а)
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    // NDC -> GUI-пиксели
    var sx = (ndc_x * 0.5 + 0.5) * gw;
    var sy = (-ndc_y * 0.5 + 0.5) * gh;

    return [sx, sy];
}





/// gm3d_mouse_surface_old()
/// Возвращает транспонированные координаты курсора мыши, что позволяет указать место на трехмерной арене для прицеливания или следования объекта. В этой версии есть ошибка из-за которой чем дальше объект от центра камеры, тем сильнее отставание координат от курсора.
function gm3d_mouse_surface_old()
{
    var arena = instance_find(oArena3D, 0);
    if (!instance_exists(arena)) return undefined;

    // Цель — мышь в GUI-координатах, а не в координатах комнаты/окна
    var sx_target = device_mouse_x_to_gui(0);
    var sy_target = device_mouse_y_to_gui(0);

    // Стартовая догадка — центр камеры (обычно это игрок/центр арены)
    var guess_x = arena.cam_target_x;
    var guess_y = arena.cam_target_y;

    var max_iter = 6;
    var eps_det  = 0.0001;
    var eps_err  = 1.0;
    var step     = 8.0;

    for (var i = 0; i < max_iter; i++)
    {
        var s0 = gm3d_world_to_screen(guess_x, guess_y, 0);
        if (!is_array(s0)) break;

        var sx0 = s0[0];
        var sy0 = s0[1];

        var dxs = sx_target - sx0;
        var dys = sy_target - sy0;

        if (abs(dxs) + abs(dys) < eps_err) break;

        var s_dx = gm3d_world_to_screen(guess_x + step, guess_y, 0);
        var s_dy = gm3d_world_to_screen(guess_x, guess_y + step, 0);

        if (!is_array(s_dx) || !is_array(s_dy)) break;

        var sx_dx = s_dx[0] - sx0;
        var sy_dx = s_dx[1] - sy0;

        var sx_dy = s_dy[0] - sx0;
        var sy_dy = s_dy[1] - sy0;

        var det = sx_dx * sy_dy - sx_dy * sy_dx;
        if (abs(det) < eps_det) break;

        var inv00 =  sy_dy / det;
        var inv01 = -sx_dy / det;
        var inv10 = -sy_dx / det;
        var inv11 =  sx_dx / det;

        var d_world_x = inv00 * dxs + inv01 * dys;
        var d_world_y = inv10 * dxs + inv11 * dys;

        guess_x += d_world_x;
        guess_y += d_world_y;
    }

    var wx = guess_x;
    var wy = guess_y;
    var wz = 0;

    if (is_array(global.arena_pillars)) {
        var half = global.pillar_size * 0.5;
        var h    = global.pillar_height;
        var n    = array_length(global.arena_pillars);

        for (var j = 0; j < n; j++) {
            var p = global.arena_pillars[j];

            if (abs(wx - p.x) <= half && abs(wy - p.y) <= half) {
                wz = h;
                break;
            }
        }
    }
	var tmp = wx;
    wx = -wy;
    wy = -tmp;
    return [-wy, wx, wz];
}

/// gm3d_mouse_surface()
/// Возвращает транспонированные координаты курсора мыши, что позволяет указать место на трехмерной арене для прицеливания или следования объекта.
function gm3d_mouse_surface()
{
    var arena = instance_find(oArena3D, 0);
    if (!instance_exists(arena)) return undefined;

    var sx_target = device_mouse_x_to_gui(0);
    var sy_target = device_mouse_y_to_gui(0);

    static guess_x = 0;
    static guess_y = 0;

    if (is_undefined(guess_x) || is_undefined(guess_y))
    {
        guess_x = arena.cam_target_x;
        guess_y = arena.cam_target_y;
    }

    var max_iter = 10;
    var eps_det  = 0.000001;
    var eps_err  = 0.5;
    var step     = 8.0;

    for (var i = 0; i < max_iter; i++)
    {
        var s0 = gm3d_world_to_screen(guess_x, guess_y, 0);
        if (!is_array(s0)) break;

        var sx0 = s0[0];
        var sy0 = s0[1];

        var dxs = sx_target - sx0;
        var dys = sy_target - sy0;

        if (abs(dxs) + abs(dys) < eps_err) break;

        var s_dx = gm3d_world_to_screen(guess_x + step, guess_y, 0);
        var s_dy = gm3d_world_to_screen(guess_x, guess_y + step, 0);

        if (!is_array(s_dx) || !is_array(s_dy)) break;

        var sx_dx = s_dx[0] - sx0;
        var sy_dx = s_dx[1] - sy0;

        var sx_dy = s_dy[0] - sx0;
        var sy_dy = s_dy[1] - sy0;

        var det = sx_dx * sy_dy - sx_dy * sy_dx;
        if (abs(det) < eps_det) break;

        var inv00 =  sy_dy / det;
        var inv01 = -sx_dy / det;
        var inv10 = -sy_dx / det;
        var inv11 =  sx_dx / det;

        var d_world_x = inv00 * dxs + inv01 * dys;
        var d_world_y = inv10 * dxs + inv11 * dys;

        guess_x += d_world_x;
        guess_y += d_world_y;
    }

    var wx = guess_x;
    var wy = guess_y;
    var wz = 0;

    if (is_array(global.arena_pillars))
    {
        var half = global.pillar_size * 0.5;
        var h    = global.pillar_height;
        var n    = array_length(global.arena_pillars);

        for (var j = 0; j < n; j++)
        {
            var p = global.arena_pillars[j];

            if (wx >= p.x - half && wx <= p.x + half &&
                wy >= p.y - half && wy <= p.y + half)
            {
                wz = h;
                break;
            }
        }
    }

    guess_x = wx;
    guess_y = wy;

    var tmp = wx;
    wx = -wy;
    wy = -tmp;

    return [-wy, wx, wz];
}




/// gm3d_draw_laser(x1, y1, z1, x2, y2, z2, width, time)
/// Рисует лазер на арене между двумя точками в мировых координатах.
function gm3d_draw_laser(_x1, _y1, _z1, _x2, _y2, _z2, _width, _time)
{
    var arena = instance_find(oArena3D, 0);
    if (!instance_exists(arena)) return;

    var dx = _x2 - _x1;
    var dy = _y2 - _y1;
    var len = sqrt(dx*dx + dy*dy);
    if (len <= 0.0001) return;

    dx /= len;
    dy /= len;

    var nx = -dy;
    var ny =  dx;

    var half_w = _width * 0.5;
    nx *= half_w;
    ny *= half_w;

    var x1a = _x1 + nx;
    var y1a = _y1 + ny;
    var x1b = _x1 - nx;
    var y1b = _y1 - ny;

    var x2a = _x2 + nx;
    var y2a = _y2 + ny;
    var x2b = _x2 - nx;
    var y2b = _y2 - ny;

    var uv = sprite_get_uvs(arena.spr_laser_tex, 0);
    var u1 = uv[0];
    var v1 = uv[1];
    var u2 = uv[2];
    var v2 = uv[3];

    var pulse = 0.5 + 0.5 * sin(_time * 15);
    var col_core  = merge_colour(c_white, c_red, pulse);
    var col_outer = make_colour_rgb(180 + 75 * pulse, 0, 0);
    var alpha_core  = 0.1 * _time; // 0.9
    var alpha_outer = 0.4;

    var gw = _width * 1.8;
    var ghalf = gw * 0.5;
    var gx = -dy * ghalf;
    var gy =  dx * ghalf;

    var gx1a = _x1 + gx;
    var gy1a = _y1 + gy;
    var gx1b = _x1 - gx;
    var gy1b = _y1 - gy;

    var gx2a = _x2 + gx;
    var gy2a = _y2 + gy;
    var gx2b = _x2 - gx;
    var gy2b = _y2 - gy;

    gpu_set_blendmode(bm_add);
    matrix_set(matrix_world, matrix_build_identity());

    vertex_begin(arena.vb_laser, arena.vfmt_3d);

    // Внешнее "сияние" (широкий полупрозрачный квад)
    vertex_position_3d(arena.vb_laser, gx1b, gy1b, _z1);
    vertex_texcoord   (arena.vb_laser, u1, v2);
    vertex_colour     (arena.vb_laser, col_outer, alpha_outer);

    vertex_position_3d(arena.vb_laser, gx1a, gy1a, _z1);
    vertex_texcoord   (arena.vb_laser, u1, v1);
    vertex_colour     (arena.vb_laser, col_outer, alpha_outer);

    vertex_position_3d(arena.vb_laser, gx2a, gy2a, _z2);
    vertex_texcoord   (arena.vb_laser, u2, v1);
    vertex_colour     (arena.vb_laser, col_outer, alpha_outer);

    vertex_position_3d(arena.vb_laser, gx1b, gy1b, _z1);
    vertex_texcoord   (arena.vb_laser, u1, v2);
    vertex_colour     (arena.vb_laser, col_outer, alpha_outer);

    vertex_position_3d(arena.vb_laser, gx2a, gy2a, _z2);
    vertex_texcoord   (arena.vb_laser, u2, v1);
    vertex_colour     (arena.vb_laser, col_outer, alpha_outer);

    vertex_position_3d(arena.vb_laser, gx2b, gy2b, _z2);
    vertex_texcoord   (arena.vb_laser, u2, v2);
    vertex_colour     (arena.vb_laser, col_outer, alpha_outer);

    // Ядро луча (узкий яркий квад)
    vertex_position_3d(arena.vb_laser, x1b, y1b, _z1);
    vertex_texcoord   (arena.vb_laser, u1, v2);
    vertex_colour     (arena.vb_laser, col_core, alpha_core);

    vertex_position_3d(arena.vb_laser, x1a, y1a, _z1);
    vertex_texcoord   (arena.vb_laser, u1, v1);
    vertex_colour     (arena.vb_laser, col_core, alpha_core);

    vertex_position_3d(arena.vb_laser, x2a, y2a, _z2);
    vertex_texcoord   (arena.vb_laser, u2, v1);
    vertex_colour     (arena.vb_laser, col_core, alpha_core);

    vertex_position_3d(arena.vb_laser, x1b, y1b, _z1);
    vertex_texcoord   (arena.vb_laser, u1, v2);
    vertex_colour     (arena.vb_laser, col_core, alpha_core);

    vertex_position_3d(arena.vb_laser, x2a, y2a, _z2);
    vertex_texcoord   (arena.vb_laser, u2, v1);
    vertex_colour     (arena.vb_laser, col_core, alpha_core);

    vertex_position_3d(arena.vb_laser, x2b, y2b, _z2);
    vertex_texcoord   (arena.vb_laser, u2, v2);
    vertex_colour     (arena.vb_laser, col_core, alpha_core);

    vertex_end(arena.vb_laser);
    vertex_submit(arena.vb_laser, pr_trianglelist, arena.tex_laser);

    gpu_set_blendmode(bm_normal);
}



/// gm3d_raycast_pillars(x1,y1,z1, x2,y2,z2)
/// Возвращает struct:
/// { x, y, z, t, dist, pillar_index, pillar }
/// или undefined, если ни в один столб не попало.
function gm3d_raycast_pillars(_x1, _y1, _z1, _x2, _y2, _z2)
{
    var pillars = global.arena_pillars;
    if (!is_array(pillars)) return undefined;

    var half = global.pillar_size * 0.5;
    var h    = global.pillar_height;

    var ox = _x1;
    var oy = _y1;
    var oz = _z1;

    var dx = _x2 - _x1;
    var dy = _y2 - _y1;
    var dz = _z2 - _z1;

    var seg_len = sqrt(dx*dx + dy*dy + dz*dz);
    if (seg_len <= 0.000001) return undefined;

    var eps   = 0.000001;
    var eps_t = 0.0001;

    var best_t      = 1000000000; // большой номер
    var hit_x       = 0;
    var hit_y       = 0;
    var hit_z       = 0;
    var hit_index   = -1;

    var n = array_length(pillars);
    for (var i = 0; i < n; i++)
    {
        var p = pillars[i];

        var minx = p.x - half;
        var maxx = p.x + half;
        var miny = p.y - half;
        var maxy = p.y + half;
        var minz = 0;
        var maxz = h;

        var tmin = 0.0;
        var tmax = 1.0;

        // X
        if (abs(dx) < eps) {
            if (ox < minx || ox > maxx) continue;
        } else {
            var t0 = (minx - ox) / dx;
            var t1 = (maxx - ox) / dx;
            if (t0 > t1) { var tmp = t0; t0 = t1; t1 = tmp; }
            if (t0 > tmin) tmin = t0;
            if (t1 < tmax) tmax = t1;
            if (tmax < tmin) continue;
        }

        // Y
        if (abs(dy) < eps) {
            if (oy < miny || oy > maxy) continue;
        } else {
            var t2 = (miny - oy) / dy;
            var t3 = (maxy - oy) / dy;
            if (t2 > t3) { var tmp2 = t2; t2 = t3; t3 = tmp2; }
            if (t2 > tmin) tmin = t2;
            if (t3 < tmax) tmax = t3;
            if (tmax < tmin) continue;
        }

        // Z
        if (abs(dz) < eps) {
            if (oz < minz || oz > maxz) continue;
        } else {
            var t4 = (minz - oz) / dz;
            var t5 = (maxz - oz) / dz;
            if (t4 > t5) { var tmp3 = t4; t4 = t5; t5 = tmp3; }
            if (t4 > tmin) tmin = t4;
            if (t5 < tmax) tmax = t5;
            if (tmax < tmin) continue;
        }

        var t_hit = tmin;

        if (t_hit < eps_t) {
            t_hit = tmax;
        }

        if (t_hit < eps_t || t_hit > 1.0) continue;

        if (t_hit < best_t)
        {
            best_t = t_hit;
            hit_x  = ox + dx * t_hit;
            hit_y  = oy + dy * t_hit;
            hit_z  = oz + dz * t_hit;
            hit_index = i;
        }
    }

    if (hit_index < 0) return undefined;

    var dist = seg_len * best_t;

    return {
        x: hit_x,
        y: hit_y,
        z: hit_z,
        t: best_t,
        dist: dist,
        pillar_index: hit_index,
        pillar: global.arena_pillars[hit_index]
    };
}




/// gm3d_get_pillar_height_at(x, y)
/// Если в этой точке есть столб — возвращает высоту столба,
/// иначе возвращает 0.
function gm3d_get_pillar_height_at(_x, _y)
{
    var pillars = global.arena_pillars;
    if (!is_array(pillars)) return 0;

    var half = global.pillar_size * 0.5;
    var n    = array_length(pillars);

    for (var i = 0; i < n; i++)
    {
        var p = pillars[i];

        if (_x >= p.x - half && _x <= p.x + half &&
            _y >= p.y - half && _y <= p.y + half)
        {
            return global.pillar_height;
        }
    }

    return 0;
}





/// gm3d_clamp_to_arena(x, y, radius)
/// Возвращает [x, y], "прижатые" к границам арены
function gm3d_clamp_to_arena(_x, _y, _radius)
{
    var h = global.arena_half - _radius;

    if (_x < -h) _x = -h;
    else if (_x >  h) _x =  h;

    if (_y < -h) _y = -h;
    else if (_y >  h) _y =  h;

    return [_x, _y];
}


/// gm3d_random_point_any_surface
/// Случайная точка на арене включая столбы (с безопасным радиусом и числом попыток)
function gm3d_random_point_any_surface(_radius, _tries)
{
    if (is_undefined(_tries)) _tries = 64;

    var h = global.arena_half - _radius;

    for (var t = 0; t < _tries; t++)
    {
        var px = random_range(-h, h);
        var py = random_range(-h, h);

        var z = gm3d_get_pillar_height_at(px, py); // 0 или высота столба
        return [px, py, z];
    }

    return [0, 0, 0];
}

/// gm3d_random_point_floor
/// Случайная точка на арене исключая столбы (с безопасным радиусом и числом попыток)
function gm3d_random_point_floor(_radius, _tries)
{
    if (is_undefined(_tries)) _tries = 64;

    var h = global.arena_half - _radius;
    var half_p = global.pillar_size * 0.5;
    var pillars = global.arena_pillars;

    for (var t = 0; t < _tries; t++)
    {
        var px = random_range(-h, h);
        var py = random_range(-h, h);

        var ok = true;

        if (is_array(pillars))
        {
            var n = array_length(pillars);
            for (var i = 0; i < n; i++)
            {
                var p = pillars[i];

                // расширяем AABB столба на радиус объекта
                if (abs(px - p.x) <= half_p + _radius &&
                    abs(py - p.y) <= half_p + _radius)
                {
                    ok = false;
                    break;
                }
            }
        }

        if (ok)
            return [px, py, 0];
    }

    return [0, 0, 0];
}

