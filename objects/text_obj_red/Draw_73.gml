draw_set_halign(fa_center);
draw_set_font(font_general_18);
if (outline)
{
	draw_set_colour(outline_color);
	draw_text_ext(x - outline_thickness, y,  string_hash_to_newline(txt), 25, w);
	draw_text_ext(x + outline_thickness, y,  string_hash_to_newline(txt), 25, w);
	draw_text_ext(x, y + outline_thickness,  string_hash_to_newline(txt), 25, w);
	draw_text_ext(x, y - outline_thickness,  string_hash_to_newline(txt), 25, w);
}
draw_text_ext_colour(x, y, string_hash_to_newline(txt), 25, w, make_colour_rgb(255, 30, 20), make_colour_rgb(255, 30, 20), make_colour_rgb(100, 0, 0), make_colour_rgb(100, 0, 0), 1);

if (follow)
{
	x = x_x;
	y = y_y;
}



