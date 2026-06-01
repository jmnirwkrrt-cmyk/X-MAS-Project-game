if (instance_exists(ask_parent)) instance_destroy(self);

if (indx > 0)
{
if (indx = 1) sprite_index = fighter_1_s;
if (indx = 2) sprite_index = fighter_2_s;
if (indx = 3) sprite_index = x_tornado_s;
if (indx = 4) sprite_index = fighter_3_s;
if (indx = 5) sprite_index = fighter_4_s;
if (indx = 6) sprite_index = interceptor_s;
if (indx = 7) sprite_index = transport_1_s;
if (indx = 8) sprite_index = transport_2_s;
if (indx = 9) sprite_index = transport_3_s;

image_speed = 0;
image_angle = 180;
image_xscale = 0.5;
image_yscale = 0.5;

image_alpha = 1;
if (!is_on_base) image_alpha = 0.5;

if (!instance_exists(ask_parent)) draw_self();
}

