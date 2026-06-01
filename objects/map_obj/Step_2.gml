
if (map_menu.mouse){ drag = 0; }

image_xscale = basic_size;
image_yscale = basic_size;

xy_max = (900 * basic_size - 900) / 2;
if (drag == 1)
{
	x = mouse_x + drag_offx;
	y = mouse_y + drag_offy;
}
if (x - basic_x > xy_max) { x = xy_max + basic_x; }
if (y - basic_y > xy_max) { y = xy_max + basic_y; }
if (x < basic_x - xy_max) { x = basic_x - xy_max; }
if (y < basic_y - xy_max) { y = basic_y - xy_max; }
if (image_xscale = 1 and image_yscale = 1) { x = basic_x; y = basic_y; }

if (global.isbuild /*or instance_exists(mouse_target_inter)*/) { image_xscale = 1; image_yscale = 1; x = 900 / 2; y = 900 / 2; drag = 0; }

if (!instance_exists(acc_button) && visible)
{
	instance_activate_object(acc_button);
	if (!instance_exists(acc_button)) // если до сих пор не существует
	{
		show_debug_message("Кнопки ускорения исчезли!");
	}
	else
	show_debug_message("Кнопки ускорения восстановлены!");
}