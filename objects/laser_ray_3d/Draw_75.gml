//https://docs2.yoyogames.com/source/_build/3_scripting/4_gml_reference/drawing/colour/index.html

//if (time_delay_current < time_delay / 2 and alpha < 1) { alpha += 1 / (time_delay / 2) } 
//if (time_delay_current > time_delay / 2 and alpha > 0) { alpha -= 1 / (time_delay / 2) } 
//
//draw_set_alpha(alpha);
//draw_set_alpha_test(false);
//draw_set_colour(c_red);
//draw_line(x,y, target_x, target_y);
////draw_set_lighting(true);
//
//time_delay_current++;
//
//draw_set_alpha(1);
//
//
//var hit = gm3d_screen_to_world_ground(target_x, target_y, target_z);
//if (is_array(hit))
//{
//    var ps = gm3d_world_to_screen(x, y, z + 5);
//    var ts = gm3d_world_to_screen(hit[0], hit[1], hit[2]);
//
//    if (is_array(ps) && is_array(ts))
//    {
//        var sx1 = ps[0], sy1 = ps[1];
//        var sx2 = ts[0], sy2 = ts[1];
//
//        draw_set_color(c_lime);
//        draw_set_alpha(0.8);
//        draw_line_width(sx1, sy1, sx2, sy2, 2);
//        draw_set_alpha(1);
//    }
//}

