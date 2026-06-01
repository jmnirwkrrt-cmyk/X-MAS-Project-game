if (!messages_mode)
{
draw_set_halign(fa_center);
draw_set_font(font_time_96);
draw_text_ext_colour(x, y, string_hash_to_newline(txt), 25, w, c_lime, c_lime, c_green, c_green, 1);
}
else
{
draw_set_halign(fa_center);
draw_set_font(font_general_12);
h = 0;
string_length_current = 0;
for (i = 1; i <= menu_messages[0,0]; i++)
{
	current_message = i;
	if (i == menu_messages[0,0]) new_messages = false;
	if (menu_messages[i,1] < 1) continue;
	//string_length_current += string_length(menu_messages[i,0]);
	//if (string_length_current > string_max_length || h > string_max_length) break;
	//menu_messages[i,1]--; - таймер заменен на ручной пропуск
	draw_text_ext_colour(x, y + h, string_hash_to_newline( menu_messages[i,0]), 15, w, c_lime, c_lime, c_green, c_green, 1);
	h += string_length(menu_messages[i,0]) * (180 / string_max_length);
	break;
}
}

