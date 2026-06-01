global.timespeed = 0;

/// @description  Управление картой
if (mouse_wheel_down()) { __view_set( e__VW.WView, 0, __view_get( e__VW.WView, 0 ) + (course) ); __view_set( e__VW.HView, 0, __view_get( e__VW.HView, 0 ) + (course) );}
if (mouse_wheel_up()) { __view_set( e__VW.WView, 0, __view_get( e__VW.WView, 0 ) - (course) ); __view_set( e__VW.HView, 0, __view_get( e__VW.HView, 0 ) - (course) );}
if (mouse_check_button_pressed(mb_left)) 
{
	/*drag = true;
	if (point_x = 0 or point_y = 0) { point_x = mouse_x; point_y = mouse_y; start_x = view_current.x; start_y = view_current.y; }
	view_xview[0] = start_x + (point_x - mouse_x);
	view_yview[0] = start_y + (point_y - mouse_y);
	*/
}


if (mouse_check_button_released(mb_middle)) 
{
	//drag = false;
	//point_x = 0;
	//point_y = 0;
	//view_xview[0] = mouse_x;
	//view_yview[0] = mouse_y;
}

if (!instance_exists(ask_parent) && keyboard_check(vk_down)) __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (course) );
if (!instance_exists(ask_parent) && keyboard_check(vk_up)) __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (course) );
if (!instance_exists(ask_parent) && keyboard_check(vk_left)) __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (course) );
if (!instance_exists(ask_parent) && keyboard_check(vk_right)) __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (course) );

if (!instance_exists(ask_parent) && mouse_x > __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - limit) __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (course) );
if (!instance_exists(ask_parent) && mouse_x < __view_get( e__VW.XView, 0 ) + limit) __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (course) );
if (!instance_exists(ask_parent) && mouse_y > __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - limit) __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (course) );
if (!instance_exists(ask_parent) && mouse_y < __view_get( e__VW.YView, 0 ) + limit) __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (course) );

// работает, но решил отказаться от границы карты
//if (view_xview[0] + view_wview[0] > room_width) view_xview[0] = room_width - view_wview[0];
//if (view_yview[0] + view_hview[0] > room_height) view_yview[0] = room_height - view_hview[0];
//if (view_xview[0] < 0) view_xview[0] = 0;
//if (view_yview[0] < 0) view_yview[0] = 0;

if (instance_exists(XMAS_Plane))
{
	for (var i = 0; i < instance_number(XMAS_Plane); i++)
	{
		p = instance_find(XMAS_Plane, i);
		if (p.selected != true) continue;
		else selected_plane = p;
	}
}
else
if (!instance_exists(selected_plane))
selected_plane = 0;

if (instance_exists(button_parent))
{
	button_parent.current_plane = selected_plane;
	button_parent.selected_plane = selected_plane;
	//button_parent.i = i;
	button_parent.ready = true;
}

var our_planes_exist = false;
for (var i = 0; i < instance_number(XMAS_Plane); i++)
{
	var plane = instance_find(XMAS_Plane, i);
	if (plane.side == 1) { our_planes_exist = true; break; }
}

if (!our_planes_exist && !battle_end)
{
	pause = true;
	battle_end = true;
	battle_win = false;
	instance_create(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, ask_question_plane_fight);
}
else
if (!instance_exists(EGG_Plane) && !battle_end)
{
	pause = true;
	battle_end = true;
	battle_win = true;
	instance_create(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, ask_question_plane_fight);
}

if (!battle_end && keyboard_check_released(vk_escape) && !instance_exists(ask_parent))
{
	pause = true;
	var ask = instance_create(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, ask_question_plane_fight);
	ask.event = 2;
}

/* */
/*  */
