if (!instance_exists(ask_parent))
{
	draw_set_colour(make_colour_rgb(100, 190, 190));
	draw_line(x, y, point_x, point_y);
	//if (indx != 0) radar_range = range * (image_xscale + 0.5);
	//if (indx != 0) range = global.escortplayer[indx, 3];// / (map_obj.image_xscale);
	//show_debug_message($"range: {range}");
	draw_circle_colour(x, y, range, c_lime, c_lime, true);
}

