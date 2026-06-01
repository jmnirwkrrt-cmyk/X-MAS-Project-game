depth = depthh;

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font_new_times_14);

// 1) Считаем размер текста при заданных wrap/sep
var ww = string_width_ext(txt, 30, w) * image_xscale;
var hh = string_height_ext(txt, 30, w) * image_yscale;

// 2) Рисуем полупрозрачный фон
var a_prev = draw_get_alpha();
var c_prev = draw_get_colour();

draw_set_alpha(0.5);
draw_set_colour(c_black);
pad = 2; // отступ рамки от текста
draw_rectangle(x - pad, y - pad, x + ww + pad, y + hh + pad, false);

// 3) Рисуем сам текст поверх
draw_set_alpha(1);
//draw_text_ext_colour(x, y, string_hash_to_newline(txt), 2, w, c_white, c_white, c_ltgrey, c_ltgrey, 1);
draw_set_colour(c_white);
draw_text_ext_transformed(x, y, string_hash_to_newline(txt), 30, w, image_xscale, image_yscale, 0);
