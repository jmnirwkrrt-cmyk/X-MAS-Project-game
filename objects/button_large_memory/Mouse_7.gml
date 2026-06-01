if (!instance_exists(ask_build) and !instance_exists(ask_inf) and !instance_exists(ask_message) and !instance_exists(ask_question))
{
button_sound_effect();
image_index = 0;

background_map.list = 1;
if (background_map.type = 6) background_map.type = 7;
else if (background_map.type = 7) background_map.type = 6;


instance_destroy(text_obj_red_28);
instance_destroy(button_arrow_2);
instance_destroy(button_arrow_2I);
instance_destroy(text_obj_red_12);
instance_destroy(text_obj_white_28);
instance_destroy(text_obj_red_28_left);
instance_destroy(draw_bar);
instance_destroy(button_large_b_exit);
instance_destroy(button_large_b_planetth);
instance_destroy(button_large_b_infdesc);
instance_destroy(button_large_memory);
}

