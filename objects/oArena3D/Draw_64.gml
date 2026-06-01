/// oArena3D: Draw GUI

// Рисуем всех 3D-актёров (игрок, враги и т.п.)
//with (pActor3D)
//{
//    // Тень — чёрный приплюснутый эллипс
//    var r = 24 * shadow_scale;
//    draw_set_alpha(0.5);
//    draw_set_color(c_black);
//    draw_ellipse(
//        shadow_x - r,
//        shadow_y - r * 0.4,
//        shadow_x + r,
//        shadow_y + r * 0.4,
//        false
//    );
//    draw_set_alpha(1);
//
//    // Спрайт (рекомендую origin: по X центр, по Y низ)
//    draw_sprite_ext(
//        sprite_index, image_index,
//        screen_x, screen_y,
//        1, 1,
//        0,
//        c_white,
//        1
//    );
//}

// Пример HUD — угол камеры
if (global.debug)
{
	draw_set_color(c_white);
	draw_text(16, 16, "Cam angle: " + string_format(cam_angle, 0, 1));
	draw_text(16, 32, "Actors: " + string(instance_number(pActor3D)));
	draw_text(16, 48, "Device Mouse_X: " + string(device_mouse_x(0)) + " Mouse_Y: " + string (device_mouse_y(0)));
	draw_text(16, 64, "Device GUI Mouse_X: " + string(device_mouse_x_to_gui(0)) + " Mouse_Y: " + string (device_mouse_y_to_gui(0)));
	draw_text(16, 80, "Window view Mouse_X: " + string(window_view_mouse_get_x(0)) + " Mouse_Y: " + string (window_view_mouse_get_y(0)));
	draw_text(16, 96, "Mouse_X: " + string(mouse_x) + " Mouse_Y: " + string(mouse_y));
	draw_text(16, 112, "Raw Mouse_X: " + string(device_mouse_raw_x(0)) + " Mouse_Y: " + string(device_mouse_raw_y(0)));
	if (instance_exists(oPlayer3D)) draw_text(16, 128, $"Floor Z: {instance_find(oPlayer3D, 0).floor_z} Z: {instance_find(oPlayer3D, 0).z}");
}

// Здоровье и энергия союзников

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var app_w = surface_get_width(application_surface);
var app_h = surface_get_height(application_surface);

var kx = gui_w / app_w;
var ky = gui_h / app_h;

if (global.pause == 1 || (!instance_exists(oPlayer3D) && !instance_exists(X_MAS_team_3D)))
{
	draw_set_colour(c_lime);
	draw_set_halign(fa_center);
	draw_set_font(font_general_28);
	draw_text_ext(gui_w / 2, gui_h / 2, global.txt5, 1.5, 900);
}
if (survive_timer != global.survive_timer)
{
	var minutes = 0;
	var seconds = 0;
	var total_seconds = (survive_timer + 59) div 60;  // это ceil(survive_timer / 60), но без float

	minutes = total_seconds div 60;
	seconds = total_seconds mod 60;
	//minutes = survive_timer / (60 * 60);
	//if (minutes < 1) minutes = 0;
	//if (minutes > 0) seconds = 59 - round(60 * ((round(minutes) - minutes)));
	//else seconds = survive_timer;
	draw_set_colour(c_lime);
	draw_set_halign(fa_center);
	draw_set_font(font_general_28);
	draw_text_ext(gui_w / 2, gui_h / 2 - 290, $"{round(minutes)}:{seconds}", 1.5, 900);
}

with (X_MAS_ally_3D)
{
    if (object_index == oPlayer3D) exit;
	if (object_index == bpla_3D) exit;
	if (object_index == landmine_3D) exit;

    var head_z = z + global.pillar_height * 0.5 * high + 18;

    var p = gm3d_world_to_screen(x, y, head_z);
    if (!is_array(p)) exit;

    var sx = p[0] * kx;
    var sy = p[1] * ky;

    // если хочешь прятать полоски, когда бот за столбом:
    //if (!is_undefined(gm3d_raycast_pillars(other.cam_eye_x, other.cam_eye_y, other.cam_eye_z, x, y, head_z))) exit;

    var w = 54;
    var h = 6;

    var x1 = sx - w * 0.5;
    var x2 = sx + w * 0.5;

    var y_hp1 = sy - 34;
    var y_hp2 = y_hp1 + h;

    var hp_max = max(1, max_hp);
    var hp_t = clamp(hp / hp_max, 0, 1);

    draw_set_alpha(0.85);
    draw_set_color(make_colour_rgb(20, 20, 20));
    draw_rectangle(x1, y_hp1, x2, y_hp2, false);

    draw_set_color(make_colour_rgb(20, 200, 40));
    draw_rectangle(x1, y_hp1, x1 + w * hp_t, y_hp2, false);

    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_rectangle(x1, y_hp1, x2, y_hp2, true);

    // ENERGY (если есть)
    if (variable_instance_exists(id, "energy") && variable_instance_exists(id, "max_energy"))
    {
        var y_en1 = y_hp2 + 3;
        var y_en2 = y_en1 + h;

        var en_max = max(1, max_energy);
        var en_t = clamp(energy / en_max, 0, 1);

        draw_set_alpha(0.80);
        draw_set_color(make_colour_rgb(20, 20, 20));
        draw_rectangle(x1, y_en1, x2, y_en2, false);

        draw_set_color(make_colour_rgb(60, 100, 255));
        draw_rectangle(x1, y_en1, x1 + w * en_t, y_en2, false);

        draw_set_alpha(1);
        draw_set_color(c_black);
        draw_rectangle(x1, y_en1, x2, y_en2, true);
    }
}


with (Turret_3D)
{
    if (team_is_enemy) exit;

    var head_z = z + global.pillar_height * 0.5 * high + 18;

    var p = gm3d_world_to_screen(x, y, head_z);
    if (!is_array(p)) exit;

    var sx = p[0] * kx;
    var sy = p[1] * ky;

    // если хочешь прятать полоски, когда бот за столбом:
    //if (!is_undefined(gm3d_raycast_pillars(other.cam_eye_x, other.cam_eye_y, other.cam_eye_z, x, y, head_z))) exit;

    var w = 54;
    var h = 6;

    var x1 = sx - w * 0.5;
    var x2 = sx + w * 0.5;

    var y_hp1 = sy - 34;
    var y_hp2 = y_hp1 + h;

    var hp_max = max(1, max_hp);
    var hp_t = clamp(hp / hp_max, 0, 1);

    draw_set_alpha(0.85);
    draw_set_color(make_colour_rgb(20, 20, 20));
    draw_rectangle(x1, y_hp1, x2, y_hp2, false);

    draw_set_color(make_colour_rgb(20, 200, 40));
    draw_rectangle(x1, y_hp1, x1 + w * hp_t, y_hp2, false);

    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_rectangle(x1, y_hp1, x2, y_hp2, true);

    // ENERGY (если есть)
    if (variable_instance_exists(id, "energy") && variable_instance_exists(id, "max_energy"))
    {
        var y_en1 = y_hp2 + 3;
        var y_en2 = y_en1 + h;

        var en_max = max(1, max_energy);
        var en_t = clamp(energy / en_max, 0, 1);

        draw_set_alpha(0.80);
        draw_set_color(make_colour_rgb(20, 20, 20));
        draw_rectangle(x1, y_en1, x2, y_en2, false);

        draw_set_color(make_colour_rgb(60, 100, 255));
        draw_rectangle(x1, y_en1, x1 + w * en_t, y_en2, false);

        draw_set_alpha(1);
        draw_set_color(c_black);
        draw_rectangle(x1, y_en1, x2, y_en2, true);
    }
}
