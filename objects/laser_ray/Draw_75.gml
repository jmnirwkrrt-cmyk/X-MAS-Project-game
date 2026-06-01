//https://docs2.yoyogames.com/source/_build/3_scripting/4_gml_reference/drawing/colour/index.html

if (time_delay_current < time_delay / 2 and alpha < 1) { alpha += 1 / (time_delay / 2) } 
if (time_delay_current > time_delay / 2 and alpha > 0) { alpha -= 1 / (time_delay / 2) } 

draw_set_alpha(alpha);
draw_set_alpha_test(false);
draw_set_colour(c_red);
draw_line(x,y, target_x, target_y);
draw_set_lighting(true);

time_delay_current++;

draw_set_alpha(1);

