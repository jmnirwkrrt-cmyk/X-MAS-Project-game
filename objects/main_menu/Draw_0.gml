/// Main Menu: Draw

draw_self();

if (image_xscale != 1 || image_yscale != 1) exit;

for (var i = 0; i < array_length(but); i++)
{
    var b = but[i];
	if (b.menu_type != menu_type || (!global.debug && i == 19 && !global.is_minigame_unlocked)) continue;
    draw_sprite_ext(b.spr, b.image_index, b.x, b.y, b.xs, b.ys, 0, c_aqua, 1);
	
	
	if (b.txt != "" && i != 10 && i != 11)
	{
		draw_set_halign(fa_center);
		draw_set_font(font_oswald_14);
		
		if (outline)
		{
		    draw_set_colour(outline_color);
		    draw_text_ext(b.x + 300 / 2 - outline_thickness,  b.y + 20 / 2,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x + 300 / 2 + outline_thickness,  b.y + 20 / 2,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x + 300 / 2,  b.y + 20 / 2 + outline_thickness,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x + 300 / 2,  b.y + 20 / 2 - outline_thickness,  string_hash_to_newline(b.txt), 25, 200);
		}
		
		draw_text_ext_colour(b.x + 300 / 2, b.y + 20 / 2, string_hash_to_newline(b.txt), 25, 200,
		make_colour_rgb(215, 245, 255), make_colour_rgb(215, 245, 255), make_colour_rgb(150, 250, 255), make_colour_rgb(150, 250, 255), 1);
	}
	else
	if (b.txt != "" && (i == 10 || i == 11))
	{
		draw_set_halign(fa_right);
		draw_set_font(font_oswald_14);
		
		if (outline)
		{
		    draw_set_colour(outline_color);
		    draw_text_ext(b.x - 301 - outline_thickness,  b.y,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x - 301 + outline_thickness,  b.y,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x - 301,  b.y + outline_thickness,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x - 301,  b.y - outline_thickness,  string_hash_to_newline(b.txt), 25, 200);
		}
		
		draw_text_ext_colour(b.x - 301, b.y, string_hash_to_newline(b.txt), 25, 200,
		make_colour_rgb(215, 245, 255), make_colour_rgb(215, 245, 255), make_colour_rgb(150, 250, 255), make_colour_rgb(150, 250, 255), 1);
	}
	else
	if (b.txt != "" && (i == 16 || i == 15))
	{
		draw_set_halign(fa_left);
		draw_set_font(font_oswald_14);
		
		if (outline)
		{
		    draw_set_colour(outline_color);
		    draw_text_ext(b.x - 141 - outline_thickness,  b.y,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x - 141 + outline_thickness,  b.y,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x - 141,  b.y + outline_thickness,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x - 141,  b.y - outline_thickness,  string_hash_to_newline(b.txt), 25, 200);
		}
		
		draw_text_ext_colour(b.x - 141, b.y, string_hash_to_newline(b.txt), 25, 200,
		make_colour_rgb(215, 245, 255), make_colour_rgb(215, 245, 255), make_colour_rgb(150, 250, 255), make_colour_rgb(150, 250, 255), 1);
	}
	
}

draw_set_halign(fa_center);
draw_set_font(font_general_28);

if (outline)
{
    draw_set_colour(outline_color);
    draw_text_ext(x - outline_thickness, y - 210,  string_hash_to_newline(text1_txt), 25, text1_w);
    draw_text_ext(x + outline_thickness, y - 210,  string_hash_to_newline(text1_txt), 25, text1_w);
    draw_text_ext(x, y - 210 + outline_thickness,  string_hash_to_newline(text1_txt), 25, text1_w);
    draw_text_ext(x, y - 210 - outline_thickness,  string_hash_to_newline(text1_txt), 25, text1_w);
}

draw_text_ext_colour(x, y - 210, string_hash_to_newline(text1_txt), 25, text1_w,
    make_colour_rgb(215, 245, 255), make_colour_rgb(215, 245, 255), make_colour_rgb(150, 250, 255), make_colour_rgb(150, 250, 255), 1);

if (menu_type == 1)
{
	draw_text_ext_colour(x, y + 210, string_hash_to_newline(text2_txt), 25, text2_w,
	    make_colour_rgb(255, 30, 20), make_colour_rgb(255, 30, 20), make_colour_rgb(100, 0, 0), make_colour_rgb(100, 0, 0), 1);
}

draw_text_ext_colour(x, y, string_hash_to_newline(text3_txt), 25, text3_w,
    make_colour_rgb(0, 200, 0), make_colour_rgb(0, 200, 0), make_colour_rgb(0, 150, 70), make_colour_rgb(0, 150, 70), 1);

