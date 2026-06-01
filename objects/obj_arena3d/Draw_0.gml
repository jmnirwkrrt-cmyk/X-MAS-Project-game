/// Draw: obj_arena3d

draw_clear(c_black);

// считаем положение камеры вокруг target_x/target_y
var xfrom = target_x + lengthdir_x(cam_dist, cam_angle);
var yfrom = target_y + lengthdir_y(cam_dist, cam_angle);
var zfrom = cam_height;

// матрица вида: смотрим с точки (xfrom,yfrom,zfrom) в (target_x,target_y,target_z)
// up-вектор (0,0,1): ось Z вверх
var view_mat = matrix_build_lookat(
    xfrom, yfrom, zfrom,
    target_x, target_y, target_z,
    0, 0, -1
);

camera_set_view_mat(cam, view_mat); 

matrix_set(matrix_world, world_mat); 

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

// пол
vertex_submit(vbuf_floor, pr_trianglelist, tex_floor);
// верхушки столбов (как маленькие платформы)
vertex_submit(vbuf_tops,  pr_trianglelist, tex_floor);
// стенки столбов
vertex_submit(vbuf_walls, pr_trianglelist, tex_wall);

// далее можно рисовать 2D HUD / спрайты
gpu_set_zwriteenable(false);
gpu_set_ztestenable(false);
