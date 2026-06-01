if (instance_exists(text)) instance_destroy(text);
if (event > 0 && event != 5 && instance_exists(but1)) instance_destroy(but1);
if (event == 23 || event == 22 || event == 21 || event == 30)
{
	instance_activate_object(ask_question_plane_designation_reached);
	instance_activate_object(button_large_q_no);
	instance_activate_object(button_large_q_ok);
	instance_activate_object(button_large_q_yes);
	instance_activate_object(text_obj_red);
}

