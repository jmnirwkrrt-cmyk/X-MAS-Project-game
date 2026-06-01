/// @description Рисуем РЛС

draw_flush();

radar_size = 250 * (__view_get( e__VW.WView, 0 ) / 1500);
radar_draw_limit = 0;

x_radar = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 );
y_radar = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 );

zero_x_radar = x_radar - radar_size;
zero_y_radar = y_radar - radar_size;
max_x_radar = x_radar;
max_y_radar = y_radar

scan_range_radar = 10000;

draw_circle_colour(zero_x_radar, zero_y_radar, radar_size, c_black, c_black, false);
draw_circle_colour(zero_x_radar, zero_y_radar, radar_size, c_teal, c_teal, true);;

draw_circle_colour(zero_x_radar, zero_y_radar, 5 * (1500 / __view_get( e__VW.WView, 0 )), c_teal, c_teal, false);

for (i = 0; i < instance_number(XMAS_Plane); i++)
{
	target = instance_find(XMAS_Plane, i);
	distance = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, target.x, target.y);
	if (distance < scan_range_radar)
	{
		x_onradar = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, target.y, target.x, target.y) / (scan_range_radar / (radar_size - radar_draw_limit));
		y_onradar = point_distance(target.x, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, target.x, target.y) / (scan_range_radar / (radar_size - radar_draw_limit));
	}
	else
	{
		//if (view_xview[0] + view_wview[0] / 2 > target.x) x_onradar = point_distance(view_xview[0] + view_wview[0] / 2, target.y, -scan_range_radar, target.y) / (scan_range_radar / (radar_size - radar_draw_limit));
		//else x_onradar = point_distance(view_xview[0] + view_wview[0] / 2, target.y, scan_range_radar, target.y) / (scan_range_radar / (radar_size - radar_draw_limit));
		//if (view_yview[0] + view_hview[0] / 2 > target.y) y_onradar = point_distance(target.x, view_yview[0] + view_hview[0] / 2, target.x, -scan_range_radar) / (scan_range_radar / (radar_size - radar_draw_limit));
		//else y_onradar = point_distance(target.x, view_yview[0] + view_hview[0] / 2, target.x, scan_range_radar) / (scan_range_radar / (radar_size - radar_draw_limit));
	}
	if (__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2 > target.x) x_onradar = -x_onradar;
	if (__view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2 > target.y) y_onradar = -y_onradar;
	if (target.side == 1) if (distance < scan_range_radar) draw_circle_colour(zero_x_radar + x_onradar, zero_y_radar + y_onradar, 3 * (1500 / __view_get( e__VW.WView, 0 )), c_lime, c_lime, false);
	if (target.side == 3) if (distance < scan_range_radar) draw_circle_colour(zero_x_radar + x_onradar, zero_y_radar + y_onradar, 3 * (1500 / __view_get( e__VW.WView, 0 )), c_aqua, c_aqua, false);
}
for (i = 0; i < instance_number(EGG_Plane); i++)
{
	target = instance_find(EGG_Plane, i);
	distance = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, target.x, target.y);
	
	if (distance < scan_range_radar)
	{
		x_onradar = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, target.y, target.x, target.y) / (scan_range_radar / (radar_size - radar_draw_limit));
		y_onradar = point_distance(target.x, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, target.x, target.y) / (scan_range_radar / (radar_size - radar_draw_limit));
	}
	else
	{
		//if (view_xview[0] + view_wview[0] / 2 > target.x) x_onradar = point_distance(view_xview[0] + view_wview[0] / 2, target.y, -scan_range_radar, target.y) / (scan_range_radar / (radar_size - radar_draw_limit));
		//else x_onradar = point_distance(view_xview[0] + view_wview[0] / 2, target.y, scan_range_radar, target.y) / (scan_range_radar / (radar_size - radar_draw_limit));
		//if (view_yview[0] + view_hview[0] / 2 > target.y) y_onradar = point_distance(target.x, view_yview[0] + view_hview[0] / 2, target.x, -scan_range_radar) / (scan_range_radar / (radar_size - radar_draw_limit));
		//else y_onradar = point_distance(target.x, view_yview[0] + view_hview[0] / 2, target.x, scan_range_radar) / (scan_range_radar / (radar_size - radar_draw_limit));
	}
	
	if (__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2 > target.x) x_onradar = -x_onradar;
	if (__view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2 > target.y) y_onradar = -y_onradar;
	if (distance < scan_range_radar) draw_circle_colour(zero_x_radar + x_onradar, zero_y_radar + y_onradar, 3 * (1500 / __view_get( e__VW.WView, 0 )), c_red, c_red, false);
}


/// Рисуем детализацию самолета
square_size = 350 * (__view_get( e__VW.WView, 0 ) / 1500);
button_size = 50 * (__view_get( e__VW.WView, 0 ) / 1500);

x_detail = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - square_size - 5;
y_detail = __view_get( e__VW.YView, 0 ) + 10;

zero_x_detail = x_detail;
zero_y_detail = y_detail;

draw_set_colour(c_black);
draw_rectangle(zero_x_detail, zero_y_detail, zero_x_detail + square_size, zero_y_detail + square_size, false);
draw_set_colour(c_teal);
draw_rectangle(zero_x_detail, zero_y_detail, zero_x_detail + square_size, zero_y_detail + square_size, true);

if (instance_exists(selected_plane) && selected_plane != 0)
{
	hp = selected_plane.hp;
	max_hp = selected_plane.max_hp
	if (hp < 0) hp = 0;
	draw_sprite_ext(selected_plane.sprite_index, 0, zero_x_detail + square_size / 2,  zero_y_detail + square_size / 2, 1.35  * (__view_get( e__VW.WView, 0 ) / 1500), 1.35  * (__view_get( e__VW.WView, 0 ) / 1500), 180, make_color_rgb(200 - 200 * (hp / max_hp), 200 * (hp / max_hp), 0), 1);
	draw_set_font(font_general_28);
	draw_set_halign(fa_right);
	draw_text_ext_colour(x_detail - 20, y_detail, string_hash_to_newline(selected_plane.name), 30, w, c_white, c_white, c_teal, c_teal, 1);
}

// модули

if (instance_exists(selected_plane) && selected_plane != 0)
{
	for (q = 0; q < global.plane_modules[global.planes[selected_plane.indx, 0], 1]; q++) 
	{
		v = global.plane_modules[global.planes[selected_plane.indx, 0], q + 2];
		if (selected_plane.module_hp[v] == -1) continue;
		module_hp = selected_plane.module_hp[v];
		if (module_hp < 0) module_hp = 0;
		draw_sprite_ext(selected_plane.sprite_module_index, v - 1, zero_x_detail + square_size / 2,  zero_y_detail + square_size / 2, 1.35  * (__view_get( e__VW.WView, 0 ) / 1500), 1.35  * (__view_get( e__VW.WView, 0 ) / 1500), 180, make_color_rgb(255 - 255 * (module_hp / global.module_hp), 255 * (module_hp / global.module_hp), 0), 1);
	}

}

//draw_arrow(x_detail, y_detail + square_size + 180, x_detail + button_size, y_detail + button_size, 1);
//draw_circle_colour(x_detail + button_size + button_size / 2 + 5, x_detail + button_size, button_size, c_teal, c_white, false);
//draw_arrow(x_detail + button_size * 2 + 10, y_detail + square_size + 180, x_detail + button_size, y_detail + button_size, 1);


//but1.x = x_detail + 80 * (__view_get( e__VW.WView, 0 ) / 1500);
//but1.y = y_detail + square_size + 50 * (__view_get( e__VW.WView, 0 ) / 1500);
//but2.x = x_detail + 180 * (__view_get( e__VW.WView, 0 ) / 1500);
//but2.y = y_detail + square_size + 50 * (__view_get( e__VW.WView, 0 ) / 1500);
//but3.x = x_detail + 280 * (__view_get( e__VW.WView, 0 ) / 1500);
//but3.y = y_detail + square_size + 50 * (__view_get( e__VW.WView, 0 ) / 1500);
//but4.x = x_detail + 80 * (__view_get( e__VW.WView, 0 ) / 1500);
//but4.y = y_detail + square_size + 150 * (__view_get( e__VW.WView, 0 ) / 1500);
//but5.x = x_detail + 180 * (__view_get( e__VW.WView, 0 ) / 1500);
//but5.y = y_detail + square_size + 150 * (__view_get( e__VW.WView, 0 ) / 1500);
//but6.x = x_detail + 280 * (__view_get( e__VW.WView, 0 ) / 1500);
//but6.y = y_detail + square_size + 150 * (__view_get( e__VW.WView, 0 ) / 1500);
//but7.x = x_detail + 80 * (__view_get( e__VW.WView, 0 ) / 1500);
//but7.y = y_detail + square_size + 250 * (__view_get( e__VW.WView, 0 ) / 1500);
//but8.x = x_detail + 80 * (__view_get( e__VW.WView, 0 ) / 1500);
//but8.y = y_detail + square_size + 350 * (__view_get( e__VW.WView, 0 ) / 1500);
//but9.x = x_detail + 180 * (__view_get( e__VW.WView, 0 ) / 1500);
//but9.y = y_detail + square_size + 350 * (__view_get( e__VW.WView, 0 ) / 1500);
//but10.x = x_detail + 280 * (__view_get( e__VW.WView, 0 ) / 1500);
//but10.y = y_detail + square_size + 350 * (__view_get( e__VW.WView, 0 ) / 1500);
//but11.x = x_detail + 180 * (__view_get( e__VW.WView, 0 ) / 1500);
//but11.y = y_detail + square_size + 250 * (__view_get( e__VW.WView, 0 ) / 1500);
//but12.x = x_detail + 280 * (__view_get( e__VW.WView, 0 ) / 1500);
//but12.y = y_detail + square_size + 250 * (__view_get( e__VW.WView, 0 ) / 1500);

/// Рисуем надписи + пауза
if (pause)
{
	draw_set_halign(fa_center);
	draw_set_font(font_general_28);
	draw_text_ext_colour(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, string_hash_to_newline(global.txt5), 30, w, c_white, c_white, c_lime, c_lime, 1);
	
	
	if (global_planes == 0)
	{
		global_planes[0, 0] = instance_number(plane_parent);
		for(q = 0; q < global_planes[0, 0]; q++)
		{
			if (!instance_exists(instance_find(plane_parent, q))) continue;
			if (instance_exists(instance_find(plane_parent, q))) global_planes[q + 1, 0] = instance_find(plane_parent, q);
			if (instance_exists(global_planes[q + 1, 0])) global_planes[q + 1, 1] = instance_find(plane_parent, q).speed;
			if (instance_exists(global_planes[q + 1, 0])) global_planes[q + 1, 2] = instance_find(plane_parent, q).image_angle;
			if (instance_exists(global_planes[q + 1, 0])) global_planes[q + 1, 3] = instance_find(plane_parent, q).task;
		}
	}
	
	if (global_shells == 0)
	{
		global_shells[0, 0] = instance_number(plane_shell);
		for(q = 0; q < global_shells[0, 0]; q++)
		{
			if (!instance_exists(instance_find(plane_shell, q))) continue;
			if (instance_exists(instance_find(plane_shell, q))) global_shells[q + 1, 0] = instance_find(plane_shell, q);
			if (instance_exists(global_shells[q + 1, 0])) global_shells[q + 1, 1] = instance_find(plane_shell, q).speed;
			if (instance_exists(global_shells[q + 1, 0])) global_shells[q + 1, 2] = instance_find(plane_shell, q).image_angle;
		}
	}
	
	for(q = 0; q < global_planes[0, 0]; q++)
	{
		if (!instance_exists(global_planes[q + 1, 0])) continue;
		if (instance_exists(global_planes[q + 1, 0])) global_planes[q + 1, 0].speed = 0;
		if (instance_exists(global_planes[q + 1, 0])) global_planes[q + 1, 0].image_angle = global_planes[q + 1, 2];
		//global_planes[q + 1, 0].task = "patrol";
	}
	for(q = 0; q < global_shells[0, 0]; q++)
	{
		if (!instance_exists(global_shells[q + 1, 0])) continue;
		if (instance_exists(global_shells[q + 1, 0])) { global_shells[q + 1, 0].speed = 0; }
		if (instance_exists(global_shells[q + 1, 0])) global_shells[q + 1, 0].image_angle = global_shells[q + 1, 2];
	}

}
	
else 
{
	if (global_planes != 0)
	{
		for(q = 0; q < global_planes[0, 0]; q++)
		{
			if (!instance_exists(global_planes[q + 1, 0])) continue;
			if (instance_exists(global_planes[q + 1, 0])) global_planes[q + 1, 0].speed = global_planes[q + 1, 1];
			if (instance_exists(global_planes[q + 1, 0])) global_planes[q + 1, 0].image_angle = global_planes[q + 1, 2];
			//global_planes[q + 1, 0].task = global_planes[q + 1, 3];
		}
		for(q = 0; q < global_shells[0, 0]; q++)
		{
			if (!instance_exists(global_shells[q + 1, 0])) continue;
			if (instance_exists(global_shells[q + 1, 0])) global_shells[q + 1, 0].speed = global_shells[q + 1, 1];
			if (instance_exists(global_shells[q + 1, 0])) global_shells[q + 1, 0].image_angle = global_shells[q + 1, 2];
		}
	}

	global_planes = 0;
	global_shells = 0;
}

/// Рисуем сообщения
h = 0;
for (i = 1; i <= messages[0, 0]; i++)
{
	if (messages[i, 0] < 1) continue;
	messages[i, 0]--;
	draw_set_halign(fa_left);
	draw_set_font(font_general_18);
	draw_text_ext_colour(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ) + h, string_hash_to_newline(messages[i, 1]), 35, w, c_white, c_white, c_teal, c_teal, 1);
	h += 65;
}

ready = true;