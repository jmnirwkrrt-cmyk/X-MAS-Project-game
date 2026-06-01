/// Step: obj_arena3d

var rot_speed  = 0.5;
var zoom_speed = 8;

// вращение вокруг арены
if (keyboard_check(vk_left))  cam_angle -= rot_speed;
if (keyboard_check(vk_right)) cam_angle += rot_speed;

// зум
if (keyboard_check(vk_up))   cam_dist -= zoom_speed;
if (keyboard_check(vk_down)) cam_dist += zoom_speed;

cam_dist = clamp(cam_dist, 300, 1200);

// переключаем режим камеры клавишей F
if (keyboard_check_pressed(ord("F")))
{
    cam_mode = (cam_mode == CAM_FREE) ? CAM_FOLLOW : CAM_FREE;
}

// если цели камеры нет, но есть игрок — захватываем его
if (!instance_exists(hero_obj) && instance_exists(hero_obj))
{
    cam_target = instance_find(hero_obj, 0);
}

// обновляем точку, на которую смотрим
if (cam_mode == CAM_FOLLOW && instance_exists(cam_target))
{
    // предполагаем, что у игрока есть px/py — координаты по полу
    target_x = cam_target.px;
    target_y = cam_target.py;
}
else
{
    // свободное перемещение камеры по арене (WASD)
    var pan = 8;
    if (keyboard_check(ord("A"))) target_x -= pan;
    if (keyboard_check(ord("D"))) target_x += pan;
    if (keyboard_check(ord("W"))) target_y -= pan;
    if (keyboard_check(ord("S"))) target_y += pan;
}
