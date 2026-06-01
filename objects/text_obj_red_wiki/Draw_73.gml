var sep = 35;

draw_set_halign(fa_left);
if (string_length(txt) < max_width) 
{ 
	draw_set_font(font_general_28);
	sep = 35;
}
else
if (string_length(txt) < max_width * 2)
{
	draw_set_font(font_general_18);
	sep = 22;
}
else
{
	draw_set_font(font_general_12);
	sep = 15;
}

if (outline)
{
	draw_set_colour(outline_color);
	draw_text_ext(x - outline_thickness, y,  string_hash_to_newline(txt), sep, w);
	draw_text_ext(x + outline_thickness, y,  string_hash_to_newline(txt), sep, w);
	draw_text_ext(x, y + outline_thickness,  string_hash_to_newline(txt), sep, w);
	draw_text_ext(x, y - outline_thickness,  string_hash_to_newline(txt), sep, w);
}

draw_text_ext_colour(x, y, string_hash_to_newline(txt), sep, w, make_colour_rgb(255, 30, 20), make_colour_rgb(255, 30, 20), make_colour_rgb(100, 0, 0), make_colour_rgb(100, 0, 0), 1);

if (follow)
{
x = x_x;
y = y_y;
}



