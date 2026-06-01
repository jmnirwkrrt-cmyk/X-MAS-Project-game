gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
gpu_set_blendmode(bm_normal);

draw_self();

for (var i = 0; i < array_length(but); i++)
{
    var b = but[i];
    draw_sprite_ext(b.spr, b.image_index, b.x, b.y, b.xs, b.ys, 0, c_white, 1);
	
	
	if (b.txt != "")
	{
		draw_set_halign(fa_center);
		draw_set_font(font_oswald_14);
		
		if (outline)
		{
		    draw_set_colour(outline_color);
		    draw_text_ext(b.x + 281 / 2 - outline_thickness,  b.y + 20 / 2,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x + 281 / 2 + outline_thickness,  b.y + 20 / 2,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x + 281 / 2,  b.y + 20 / 2 + outline_thickness,  string_hash_to_newline(b.txt), 25, 200);
		    draw_text_ext(b.x + 281 / 2,  b.y + 20 / 2 - outline_thickness,  string_hash_to_newline(b.txt), 25, 200);
		}
		
		draw_text_ext_colour(b.x + 281 / 2, b.y + 20 / 2, string_hash_to_newline(b.txt), 25, 200,
		make_colour_rgb(255, 30, 20), make_colour_rgb(255, 30, 20), make_colour_rgb(100, 0, 0), make_colour_rgb(100, 0, 0), 1);
	}
	
}

draw_set_halign(fa_center);
draw_set_font(font_oswald_14);

if (outline)
{
    draw_set_colour(outline_color);
    draw_text_ext(x + 594 - outline_thickness, y + 85,  string_hash_to_newline(text1_txt), 25, text1_w);
    draw_text_ext(x + 594 + outline_thickness, y + 85,  string_hash_to_newline(text1_txt), 25, text1_w);
    draw_text_ext(x + 594, y + 85 + outline_thickness,  string_hash_to_newline(text1_txt), 25, text1_w);
    draw_text_ext(x + 594, y + 85 - outline_thickness,  string_hash_to_newline(text1_txt), 25, text1_w);
}

draw_text_ext_colour(x + 594, y + 85, string_hash_to_newline(text1_txt), 25, text1_w,
    make_colour_rgb(255, 30, 20), make_colour_rgb(255, 30, 20), make_colour_rgb(100, 0, 0), make_colour_rgb(100, 0, 0), 1);

draw_text_ext_colour(x + 560, y + 182, string_hash_to_newline(text2_txt), 25, text2_w,
    make_colour_rgb(255, 30, 20), make_colour_rgb(255, 30, 20), make_colour_rgb(100, 0, 0), make_colour_rgb(100, 0, 0), 1);

draw_text_ext_colour(x + 556, y + 321, string_hash_to_newline(text3_txt), 25, text3_w,
    make_colour_rgb(0, 200, 0), make_colour_rgb(0, 200, 0), make_colour_rgb(0, 150, 70), make_colour_rgb(0, 150, 70), 1);

if (index > 0)
{
	var spr = noone;
	if (global.team[index, 2] = "tails") spr = tails_down_idle;
	if (global.team[index, 2] = "amy") spr = amy_down_idle;
	if (global.team[index, 2] = "sonic") spr = sonic_down_idle;
	if (global.team[index, 2] = "knuckles") spr = knuckles_down_idle;
	if (global.team[index, 2] = "rouge") spr = rouge_down_idle;
	if (global.team[index, 2] = "shadow") spr = shadow_down_idle;
	if (global.team[index, 2] = "silver") spr = silver_down_idle;
	if (global.team[index, 2] = "snowman") spr = snowman_down_idle;
	if (global.team[index, 2] = "snowman" and global.team[index, 3] = "ak") spr = snowmanak_down_idle;
	if (global.team[index, 2] = "snowman" and global.team[index, 3] = "rifle") spr = snowmanrifle_down_idle;
	if (global.team[index, 2] = "snowman" and global.team[index, 3] = "laser") spr = snowmanlaser_down_idle;
	if (spr != noone) draw_sprite_ext(spr, 0, x + 570, y + 500, 2, 2, 0, c_green, 1);
	
}
