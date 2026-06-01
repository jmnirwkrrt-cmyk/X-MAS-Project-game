draw_self();

draw_set_halign(fa_center);
draw_set_font(font_general_18);

if (outline)
{
	draw_set_colour(outline_color);
	draw_text_ext(x + 150 - outline_thickness, y,  string_hash_to_newline(txt), 25, w);
	draw_text_ext(x + 150 + outline_thickness, y,  string_hash_to_newline(txt), 25, w);
	draw_text_ext(x + 150, y + outline_thickness,  string_hash_to_newline(txt), 25, w);
	draw_text_ext(x + 150, y - outline_thickness,  string_hash_to_newline(txt), 25, w);
}

draw_text_ext_colour(x + 150, y, string_hash_to_newline(txt), 25, w, c_white, c_white, c_white, c_white, 1);

if (follow)
{
x = x_x;
y = y_y;
}

