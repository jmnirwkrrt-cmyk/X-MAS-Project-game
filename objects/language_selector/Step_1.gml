if (instance_exists(main_menu))
{
	if (main_menu.image_yscale == 1 && main_menu.image_xscale == 1 && main_menu.menu_type == 1) visible = true;
	else visible = false;
}
else
{
	visible = false;	
}