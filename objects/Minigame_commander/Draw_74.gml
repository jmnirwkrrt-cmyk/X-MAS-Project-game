draw_set_halign(fa_left);
draw_set_font(font_general_18);

var txt_x = 15;
var txt_y = 15;
if (outline)
{
	draw_set_colour(outline_color);
	draw_text_ext(txt_x - outline_thickness, txt_y,  string_hash_to_newline(global.txt435), 35, w);
	draw_text_ext(txt_x + outline_thickness, txt_y,  string_hash_to_newline(global.txt435), 35, w);
	draw_text_ext(txt_x, txt_y + outline_thickness,  string_hash_to_newline(global.txt435), 35, w);
	draw_text_ext(txt_x, txt_y - outline_thickness,  string_hash_to_newline(global.txt435), 35, w);
}

draw_text_ext_colour(txt_x, txt_y, string_hash_to_newline(global.txt435), 35, w, make_colour_rgb(255, 240, 240), make_colour_rgb(255, 30, 20), make_colour_rgb(200, 200, 200), make_colour_rgb(200, 200, 200), 1);

txt_x = 15;
txt_y = 300;
if (outline)
{
	draw_set_colour(outline_color);
	draw_text_ext(txt_x - outline_thickness, txt_y,  string_hash_to_newline($"{global.txt436} {minigame_score}"), 35, w);
	draw_text_ext(txt_x + outline_thickness, txt_y,  string_hash_to_newline($"{global.txt436} {minigame_score}"), 35, w);
	draw_text_ext(txt_x, txt_y + outline_thickness,  string_hash_to_newline($"{global.txt436} {minigame_score}"), 35, w);
	draw_text_ext(txt_x, txt_y - outline_thickness,  string_hash_to_newline($"{global.txt436} {minigame_score}"), 35, w);
}
draw_text_ext_colour(txt_x, txt_y, string_hash_to_newline($"{global.txt436} {minigame_score}"), 35, w, make_colour_rgb(255, 240, 240), make_colour_rgb(255, 30, 20), make_colour_rgb(200, 200, 200), make_colour_rgb(200, 200, 200), 1);

txt_x = 15;
txt_y = 330;
if (outline)
{
	draw_set_colour(outline_color);
	draw_text_ext(txt_x - outline_thickness, txt_y,  string_hash_to_newline($"{global.txt437} {tries}"), 35, w);
	draw_text_ext(txt_x + outline_thickness, txt_y,  string_hash_to_newline($"{global.txt437} {tries}"), 35, w);
	draw_text_ext(txt_x, txt_y + outline_thickness,  string_hash_to_newline($"{global.txt437} {tries}"), 35, w);
	draw_text_ext(txt_x, txt_y - outline_thickness,  string_hash_to_newline($"{global.txt437} {tries}"), 35, w);
}
draw_text_ext_colour(txt_x, txt_y, string_hash_to_newline($"{global.txt437} {tries}"), 35, w, make_colour_rgb(255, 240, 240), make_colour_rgb(255, 30, 20), make_colour_rgb(200, 200, 200), make_colour_rgb(200, 200, 200), 1);


txt_x = view_get_wport(0) / 2;
txt_y = view_get_hport(0) / 2;
if (is_game_winned == 1)
{
	draw_set_halign(fa_center);
	draw_set_font(font_general_28);
	if (outline)
	{
		draw_set_colour(outline_color);
		draw_text_ext(txt_x - outline_thickness, txt_y,  string_hash_to_newline(global.txt439), 35, w);
		draw_text_ext(txt_x + outline_thickness, txt_y,  string_hash_to_newline(global.txt439), 35, w);
		draw_text_ext(txt_x, txt_y + outline_thickness,  string_hash_to_newline(global.txt439), 35, w);
		draw_text_ext(txt_x, txt_y - outline_thickness,  string_hash_to_newline(global.txt439), 35, w);
	}
	draw_text_ext_colour(txt_x, txt_y, string_hash_to_newline(global.txt439), 35, w, make_colour_rgb(255, 240, 240), make_colour_rgb(255, 30, 20), make_colour_rgb(200, 200, 200), make_colour_rgb(200, 200, 200), 1);

}
else
if (is_game_winned == -1)
{
	draw_set_halign(fa_center);
	draw_set_font(font_general_28);
	if (outline)
	{
		draw_set_colour(outline_color);
		draw_text_ext(txt_x - outline_thickness, txt_y,  string_hash_to_newline(global.txt438), 35, w);
		draw_text_ext(txt_x + outline_thickness, txt_y,  string_hash_to_newline(global.txt438), 35, w);
		draw_text_ext(txt_x, txt_y + outline_thickness,  string_hash_to_newline(global.txt438), 35, w);
		draw_text_ext(txt_x, txt_y - outline_thickness,  string_hash_to_newline(global.txt438), 35, w);
	}
	draw_text_ext_colour(txt_x, txt_y, string_hash_to_newline(global.txt438), 35, w, make_colour_rgb(255, 200, 200), make_colour_rgb(100, 0, 0), make_colour_rgb(100, 0, 0), make_colour_rgb(200, 200, 200), 1);

}