if (visible)
{
	if (image_index == 1) 
	{
		text_ru();
		global_variables();
		ufopedia();
		planes_and_infantry();
		script_technologies();
		image_index = 0;
	}
	else 
	{
		text_eng();
		global_variables();
		ufopedia();
		planes_and_infantry();
		script_technologies();
		image_index = 1;
	}
}