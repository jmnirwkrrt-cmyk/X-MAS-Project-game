draw_set_alpha(0.5);
var cas = gm3d_world_to_screen(enemy.x, enemy.y, enemy.z);
draw_ellipse_colour(cas[0] - 15, cas[1] - 15, cas[0] + 15, cas[1] + 15, c_navy, c_aqua, true);
enemy.image_blend = c_aqua;
draw_set_alpha(1);

