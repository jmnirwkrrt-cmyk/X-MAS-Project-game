/// oArena3D: Begin Step

var left  = keyboard_check(vk_left);
var right = keyboard_check(vk_right);

if (left)  cam_angle -= cam_rot_speed;
if (right) cam_angle += cam_rot_speed;

if (!instance_exists(oPlayer3D) && !left && !right) {
    cam_angle += cam_auto_rot_speed;
}

if (keyboard_check(vk_up))   cam_dist -= cam_zoom_speed;
if (keyboard_check(vk_down)) cam_dist += cam_zoom_speed;
cam_dist = clamp(cam_dist, 0.01, 2000);

if (keyboard_check(ord("Q"))) cam_height += cam_height_speed;
if (keyboard_check(ord("E"))) cam_height -= cam_height_speed;
cam_height = clamp(cam_height, 80, 800);


if (cam_angle > 360) cam_angle = 0;
if (cam_angle < 0) cam_angle = 360;


if (keyboard_check(vk_end)) { cam_dist = 0.01; cam_angle = 0.01; }


if (keyboard_check_released(vk_escape) && !battle_end = true)
{
	if (instance_exists(menu_small_3D))
	{
		instance_destroy(menu_small_3D);
		drop_pause = true;
		
	}
	else
		{
			var menu = instance_create(x, y, menu_small_3D);
			set_pause = true;
		}
	
}

if (set_pause || drop_pause)
{
	if (set_pause) { set_pause = false; drop_pause = false; global.pause = 0; }
	else if (drop_pause) { set_pause = false; drop_pause = false; global.pause = 1; }
	
	if (global.pause == 1)
	{
		instance_destroy(pause_men_3D);
		global.pause = 0;
	}
	else
	{
		global.pause = 1;
		var numb = instance_number(all_movables_objects_3D);
		for (var i = numb; i >= 0; i--) // Деактивированное улетает в конец списка
		{
			var obj = instance_find(all_movables_objects_3D, i);
			if (!instance_exists(obj)) continue;
			var paused_obj = instance_create(obj.x, obj.y, pause_men_3D);
			paused_obj.z = obj.z;
			paused_obj.object_x = obj.x;
			paused_obj.object_y = obj.y;
			paused_obj.object_z = obj.z;
			paused_obj.floor_z = obj.floor_z;
			paused_obj.original_object = obj;
			paused_obj.high = obj.high;
			paused_obj.shadow_scale = obj.shadow_scale;
			if (variable_instance_exists(obj, "massive_index"))
			paused_obj.massive_index = obj.massive_index;
			paused_obj.sprite_index = obj.sprite_index;
			paused_obj.image_index = obj.image_index;
			paused_obj.image_speed = 0;
			paused_obj.speed = 0;
			paused_obj.image_alpha = obj.image_alpha;
			paused_obj.image_angle = obj.image_angle;
		}
	}
}

if (global.XMAS_squad_onfight > 0)
{
	if (grenades == -1 && medkits == -1)
	{
		grenades = global.planes[global.XMAS_squad_onfight, 16];
		medkits = global.planes[global.XMAS_squad_onfight, 17];
		grenades_original = grenades;
		medkits_original = medkits;
	}
	global.planes[global.XMAS_squad_onfight, 16] = grenades;
	global.planes[global.XMAS_squad_onfight, 17] = medkits;
}
else
{
	grenades_on_stockpile = 0;
	medkits_on_stockpile = 0;
	for (var i = 1; i <= global.atstockpile[0, 0]; i++)
	{
		if (global.atstockpile[i, 1] < 1) continue;
		if (global.atstockpile[i, 0] == 32) { if (medkits == -1) { medkits = global.atstockpile[i, 1]; medkits_on_stockpile = i; medkits_original = medkits; } }
		if (global.atstockpile[i, 0] == 6) { if (grenades == -1) { grenades = global.atstockpile[i, 1]; grenades_on_stockpile = i; grenades_original = grenades; } }
	}
	
	if (grenades_on_stockpile > 0)
	{
		global.atstockpile[grenades_on_stockpile, 1] = grenades;
	}
	if (medkits_on_stockpile > 0)
	{
		global.atstockpile[medkits_on_stockpile, 1] = medkits;
	}
	
}


if (keyboard_check_pressed(ord("N")) && global.debug) snow_enabled = !snow_enabled;

if (snow_enabled)
{
    var cx = 0;
    var cy = 0;
    var cz = 0;

    if (instance_exists(oPlayer3D)) {
        var pl = instance_find(oPlayer3D, 0);
        cx = pl.x; cy = pl.y; cz = pl.floor_z;
    }

    var wx = lengthdir_x(1, snow_wind_angle) * snow_wind_speed;
    var wy = lengthdir_y(1, snow_wind_angle) * snow_wind_speed;

    for (var i = 0; i < snow_count; i++)
    {
        var f = snow[i];

        var wobx = sin((current_time * snow_wobble_spd) + f.ph) * snow_wobble_amp;
        var woby = cos((current_time * snow_wobble_spd) + f.ph) * snow_wobble_amp;

        f.x += (wx * f.w) + wobx;
        f.y += (wy * f.w) + woby;
        f.z -= (snow_fall_speed * f.v);

        var dx = f.x - cx;
        var dy = f.y - cy;

        if (dx >  snow_area) f.x -= snow_area * 2;
        if (dx < -snow_area) f.x += snow_area * 2;
        if (dy >  snow_area) f.y -= snow_area * 2;
        if (dy < -snow_area) f.y += snow_area * 2;

        var floor_here = gm3d_get_pillar_height_at(f.x, f.y);
        if (f.z <= floor_here || f.z < snow_min_z)
        {
            f.x = cx + random_range(-snow_area, snow_area);
            f.y = cy + random_range(-snow_area, snow_area);
            f.z = floor_here + random_range(snow_top * 0.6, snow_top);
            f.ph = random(1000);
        }

        snow[i] = f;
    }
}
