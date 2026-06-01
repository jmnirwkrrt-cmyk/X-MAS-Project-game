/// oArena3D: Draw

cam = view_camera[0];

view_w = camera_get_view_width(cam);
view_h = camera_get_view_height(cam);

var tx = 0;
var ty = 0;
var tz = 0;

if (instance_exists(oPlayer3D)) {
    var pl = instance_find(oPlayer3D, 0);
    tx = pl.x;
    ty = pl.y;
    tz = pl.z;
}
else
if (instance_exists(obj_sight_or_pointer)) {
    var pl = instance_find(obj_sight_or_pointer, 0);
    tx = pl.x;
    ty = pl.y;
    tz = pl.z;
}

var eye_x = tx + lengthdir_x(cam_dist, cam_angle);
var eye_y = ty + lengthdir_y(cam_dist, cam_angle);
var eye_z = cam_height;

cam_eye_x = eye_x;
cam_eye_y = eye_y;
cam_eye_z = eye_z;

var view = matrix_build_lookat(
    eye_x, eye_y, eye_z,
    tx,    ty,    tz,
    0, 0, -1
);

var proj = matrix_build_projection_ortho(view_w, view_h, 1, 4000);

cam_target_x = tx; 
cam_target_y = ty;
cam_target_z = tz; 

camera_set_view_mat(cam, view);
camera_set_proj_mat(cam, proj);
camera_apply(cam);

// сохраняем реальную матрицу view*proj, которой рисует GPU
global.gm_view = view;
global.gm_proj = proj;


var old_world = matrix_get(matrix_world);

gpu_push_state();
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_cullmode(cull_noculling);
gpu_set_blendenable(true);

draw_clear(c_black);

matrix_set(matrix_world, matrix_build_identity());
vertex_submit(vb_floor, pr_trianglelist, tex_floor);

var n = array_length(pillars);
for (var i = 0; i < n; i++) {
    var p = pillars[i];

    var world = matrix_build(
        p.x, p.y, 0,
        0, 0, 0,
        pillar_size,
        pillar_size,
        pillar_height
    );

    matrix_set(matrix_world, world);
    vertex_submit(vb_pillar_walls, pr_trianglelist, tex_wall);
    vertex_submit(vb_pillar_top,   pr_trianglelist, tex_top);
}

with (pActor3D) {
    var diff_h = max(z - floor_z, 0);
    var max_h  = other.pillar_height;
    var t  = clamp(diff_h / max_h, 0, 1);

    var base_size = shadow_scale;
    var scale_xy  = base_size * (1 - 0.7 * t);

    var world = matrix_build(
        x, y, floor_z + 0.1,
        0, 0, 0,
        scale_xy, scale_xy, 1
    );

    matrix_set(matrix_world, world);

    var uv = sprite_get_uvs(other.spr_shadow_tex, 0);
    var u1 = uv[0], v1 = uv[1];
    var u2 = uv[2], v2 = uv[3];

    vertex_begin(other.vb_shadow, other.vfmt_3d);

    vertex_position_3d(other.vb_shadow, -0.5, -0.5, 0);
    vertex_texcoord   (other.vb_shadow, u1, v2);
    vertex_colour     (other.vb_shadow, c_white, 1);

    vertex_position_3d(other.vb_shadow,  0.5, -0.5, 0);
    vertex_texcoord   (other.vb_shadow, u2, v2);
    vertex_colour     (other.vb_shadow, c_white, 1);

    vertex_position_3d(other.vb_shadow,  0.5,  0.5, 0);
    vertex_texcoord   (other.vb_shadow, u2, v1);
    vertex_colour     (other.vb_shadow, c_white, 1);

    vertex_position_3d(other.vb_shadow, -0.5, -0.5, 0);
    vertex_texcoord   (other.vb_shadow, u1, v2);
    vertex_colour     (other.vb_shadow, c_white, 1);

    vertex_position_3d(other.vb_shadow,  0.5,  0.5, 0);
    vertex_texcoord   (other.vb_shadow, u2, v1);
    vertex_colour     (other.vb_shadow, c_white, 1);

    vertex_position_3d(other.vb_shadow, -0.5,  0.5, 0);
    vertex_texcoord   (other.vb_shadow, u1, v1);
    vertex_colour     (other.vb_shadow, c_white, 1);

    vertex_end(other.vb_shadow);
    vertex_submit(other.vb_shadow, pr_trianglelist, other.tex_shadow);
}

with (pActor3D) {
    var spr = sprite_index;
    var img = image_index;

    if (spr >= 0) {
        var tex   = sprite_get_texture(spr, img);
        var uv    = sprite_get_uvs(spr, img);
        var u1    = uv[0], v1 = uv[1];
        var u2    = uv[2], v2 = uv[3];

        var spr_w = max(1, sprite_get_width(spr));
        var spr_h = max(1, sprite_get_height(spr));

        var desired_h = other.pillar_height * 0.5 * high;
        var ratio     = spr_w / spr_h;
        var world_h   = desired_h;
        var world_w   = desired_h * ratio;
        var half_w    = world_w * 0.5;

        var cx = other.cam_eye_x;
        var cy = other.cam_eye_y;

        var vx = x - cx;
        var vy = y - cy;
        var len = sqrt(vx * vx + vy * vy);
        if (len <= 0.0001) {
            vx = 1;
            vy = 0;
            len = 1;
        }
        vx /= len;
        vy /= len;

        var rx =  vy;
        var ry = -vx;

        var x0 = x - rx * half_w;
        var y0 = y - ry * half_w;
        var x1 = x + rx * half_w;
        var y1 = y + ry * half_w;

        var z0 = z;
        var z1 = z + world_h;
		
		if (image_blend == -1) image_blend = c_white;

        matrix_set(matrix_world, matrix_build_identity());

        vertex_begin(other.vb_actor, other.vfmt_3d);

        vertex_position_3d(other.vb_actor, x0, y0, z0);
        vertex_texcoord   (other.vb_actor, u1, v2);
        vertex_colour     (other.vb_actor, image_blend, 1);

        vertex_position_3d(other.vb_actor, x1, y1, z0);
        vertex_texcoord   (other.vb_actor, u2, v2);
        vertex_colour     (other.vb_actor, image_blend, 1);

        vertex_position_3d(other.vb_actor, x1, y1, z1);
        vertex_texcoord   (other.vb_actor, u2, v1);
        vertex_colour     (other.vb_actor, image_blend, 1);

        vertex_position_3d(other.vb_actor, x0, y0, z0);
        vertex_texcoord   (other.vb_actor, u1, v2);
        vertex_colour     (other.vb_actor, image_blend, 1);

        vertex_position_3d(other.vb_actor, x1, y1, z1);
        vertex_texcoord   (other.vb_actor, u2, v1);
        vertex_colour     (other.vb_actor, image_blend, 1);

        vertex_position_3d(other.vb_actor, x0, y0, z1);
        vertex_texcoord   (other.vb_actor, u1, v1);
        vertex_colour     (other.vb_actor, image_blend, 1);

        vertex_end(other.vb_actor);
        vertex_submit(other.vb_actor, pr_trianglelist, tex);
    }
}

for (var a = 1; a <= laser_rays[0, 0]; a++)
{
	if (laser_rays[a, 7] < 0) continue;
	laser_rays[a, 7]--;
	gm3d_draw_laser(
            laser_rays[a, 0],  laser_rays[a, 1],  laser_rays[a, 2],
            laser_rays[a, 3], laser_rays[a, 4], laser_rays[a, 5], laser_rays[a, 6],
            laser_rays[a, 7]
    );
	
}



if (snow_enabled)
{
    var cx = cam_eye_x;
    var cy = cam_eye_y;

    var uv = sprite_get_uvs(spr_snow, 0);
    var u1 = uv[0], v1 = uv[1];
    var u2 = uv[2], v2 = uv[3];

    matrix_set(matrix_world, matrix_build_identity());
    gpu_set_blendmode(bm_normal);
    gpu_set_ztestenable(true);
    gpu_set_zwriteenable(false);

    vertex_begin(vb_snow, vfmt_3d);

    for (var i = 0; i < snow_count; i++)
    {
        var f = snow[i];

        var vx = f.x - cx;
        var vy = f.y - cy;
        var len = sqrt(vx*vx + vy*vy);
        if (len < 0.0001) { vx = 1; vy = 0; len = 1; }
        vx /= len; vy /= len;

        var rx =  vy;
        var ry = -vx;

        var hw = f.s * 0.5;
        var hh = f.s * 0.5;

        var x0 = f.x - rx * hw;
        var y0 = f.y - ry * hw;
        var x1 = f.x + rx * hw;
        var y1 = f.y + ry * hw;

        var z0 = f.z - hh;
        var z1s = f.z + hh;

        var a = 0.75;

        vertex_position_3d(vb_snow, x0, y0, z0);
        vertex_texcoord   (vb_snow, u1, v2);
        vertex_colour     (vb_snow, c_white, a);

        vertex_position_3d(vb_snow, x1, y1, z0);
        vertex_texcoord   (vb_snow, u2, v2);
        vertex_colour     (vb_snow, c_white, a);

        vertex_position_3d(vb_snow, x1, y1, z1s);
        vertex_texcoord   (vb_snow, u2, v1);
        vertex_colour     (vb_snow, c_white, a);

        vertex_position_3d(vb_snow, x0, y0, z0);
        vertex_texcoord   (vb_snow, u1, v2);
        vertex_colour     (vb_snow, c_white, a);

        vertex_position_3d(vb_snow, x1, y1, z1s);
        vertex_texcoord   (vb_snow, u2, v1);
        vertex_colour     (vb_snow, c_white, a);

        vertex_position_3d(vb_snow, x0, y0, z1s);
        vertex_texcoord   (vb_snow, u1, v1);
        vertex_colour     (vb_snow, c_white, a);
    }

    vertex_end(vb_snow);
    vertex_submit(vb_snow, pr_trianglelist, tex_snow);

    gpu_set_zwriteenable(true);
}



gpu_pop_state();
matrix_set(matrix_world, old_world);
