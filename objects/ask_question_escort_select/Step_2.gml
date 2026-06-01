//instance_destroy(text_obj_red_28);
instance_destroy(text_obj_white_28);
instance_deactivate_object(text_obj_red_28);

global.timespeed = 0;

if (image_xscale = 1 and image_yscale = 1 and !ready)
{
but1 = instance_create(x - 288, y + 62, button_large_q_yes)
but2 = instance_create(x + 17, y + 62, button_large_q_no)
text = instance_create(x, y, text_obj_red);
text2 = instance_create(x, y - 125, text_obj_red);
left_arrow = instance_create(x - 125, y - 125, button_arrow_2_escorts);
right_arrow = instance_create(x + 125, y - 125, button_arrow_2_escorts);
left_arrow.depth = depth - 1;
right_arrow.depth = depth - 1;
right_arrow.image_xscale = -1;
text.w = 500;
text2.w = 500;
ready = true;

}
if (ready)
{
	
if (type == 1)
{
	text.txt = global.txt255;
	text2.txt = acces_escorts[selected_escort].name;
	
	but1.text.txt = global.txt256; 
	but2.text.txt = global.txt257;
	
	if (but1.yes)
	{
		//event_perform_object(acces_escorts[selected_escort], ev_left_release, 0);
		if (acces_escorts[selected_escort].object_index == onmap_escort)
		{
			ask = instance_create(1200 / 2, 900 / 2, ask_escort);
			ask.indx = acces_escorts[selected_escort].indx;
		}
		if (acces_escorts[selected_escort].object_index == onmap_enemy)
		{
			ask = instance_create(1200 / 2, 900 / 2, ask_message_big);
			ask.ufo_number = acces_escorts[selected_escort].indx;
			ask.event = 1;
			ask.target = acces_escorts[selected_escort];
		}
		if (acces_escorts[selected_escort].object_index == onmap_ally)
		{
			ask = instance_create(1200 / 2, 900 / 2, ask_message_big);
			ask.ufo_number = acces_escorts[selected_escort].indx;
			ask.target = acces_escorts[selected_escort];
			ask.event = 8;
		}
		instance_destroy(self);
	}
	else
	if (but2.no) 
	{ 
		instance_destroy(self);
	}
}
	





}

