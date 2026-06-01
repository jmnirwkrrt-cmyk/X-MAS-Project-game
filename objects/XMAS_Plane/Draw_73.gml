depth = -1;
draw_flush();
draw_self();
draw_set_halign(fa_center);
draw_set_font(font_thick_12);
if (side == 1)
{
	draw_text_ext_colour(x, y - 85, string_hash_to_newline(name), 10, w, c_lime, c_lime, c_green, c_green, 1);
	draw_text_ext_colour(x, y - 70, string_hash_to_newline(string_insert(global.txt199, speed * spd_div, 0)), 10, w, c_lime, c_lime, c_lime, c_green, 1);
	draw_text_ext_colour(x, y - 55, string_hash_to_newline(string_insert(global.txt198, string_insert("1: ", w_1a, 0), 0)), 10, w, c_lime, c_lime, c_lime, c_green, 1);
	draw_text_ext_colour(x, y - 40, string_hash_to_newline(string_insert(global.txt198, string_insert("2: ", w_2a, 0), 0)), 10, w, c_lime, c_lime, c_lime, c_green, 1);
	draw_text_ext_colour(x, y - 25, string_hash_to_newline(string_insert(global.txt198, string_insert("3: ", w_3a, 0), 0)), 10, w, c_lime, c_lime, c_lime, c_green, 1);
	draw_text_ext_colour(x, y - 10, string_hash_to_newline(string_insert(global.txt200, hp, 0)), 10, w, c_lime, c_lime, c_green, c_lime, 1);
}
else
{
	draw_text_ext_colour(x, y - 85, string_hash_to_newline(name), 10, w, c_teal, c_teal, c_teal, c_teal, 1);
	draw_text_ext_colour(x, y - 70, string_hash_to_newline(string_insert(global.txt199, speed * spd_div, 0)), 10, w, c_teal, c_teal, c_teal, c_teal, 1);
	draw_text_ext_colour(x, y - 10, string_hash_to_newline(string_insert(global.txt200, hp, 0)), 10, w, c_teal, c_teal, c_teal, c_teal, 1);
}


if (selected) draw_circle_colour(x, y, 100, c_lime, c_lime, true)
if (w_1r > 0 && w_1use && selected && w_1a > 0) draw_circle_colour(x, y, w_1r, c_white, c_white, true)
if (w_2r > 0 && w_2use && selected && w_2a > 0) draw_circle_colour(x, y, w_2r, c_ltgray, c_ltgray, true)
if (w_3r > 0 && w_3use && selected && w_3a > 0) draw_circle_colour(x, y, w_3r, c_gray, c_gray, true)

if (task == "move" || task == "return")
{
	draw_line_colour(x, y, move_target_x, move_target_y, c_aqua, c_aqua);
}
if (task == "attack" && instance_exists(enemy_target_indx))
{
	draw_line_colour(x, y, enemy_target_indx.x, enemy_target_indx.y, c_red, c_red);
}

if ((task == "destroyed" || task == "returned") && !plane_commander.pause)
{
	roll_cooldown-=0.005;
	if (roll < 10)
	{
		roll_cooldown = 1;
		roll = irandom_range(10, 13);
		if (task == "returned") roll = 15;
	}
	if (roll == 10)
	{
		image_angle+=2;
	}
	if (roll == 11)
	{
		image_angle-=3;
		image_speed = 1;
	}
	if (roll == 12)
	{
		image_speed = 0;
	}
	if (roll == 13)
	{
		image_speed = 1
	}
	image_alpha = roll_cooldown;
	if (roll_cooldown < 0) instance_destroy(self);
}

var __b__;
__b__ = action_if_variable(task, "destroyed", 0);
if !__b__
{
	__b__ = action_if_variable(indx, 7, 0);
	if !__b__
	{
		action_effect(9, x, y, 1, 16384, 0);
	}
	else
	{
		action_effect(4, x, y, 1, 16384, 0);
	}
}
