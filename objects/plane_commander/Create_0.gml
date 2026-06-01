point_x = 0;
point_y = 0;
start_x = __view_get( e__VW.WView, 0 );
start_y = __view_get( e__VW.HView, 0 );
drag = false;

battle_end = false;
battle_win = false;

messages[0, 0] = 0;

w = 450;

pause = true;

random_spawn_dev = 1000;

z = 0;
global_planes = 0;
global_shells = 0;

XMAS_spawn_x = 2200;
XMAS_spawn_y = 500;
EGG_spawn_x = 2200;
EGG_spawn_y = 8200;
SANTA_spawn_x = 5000;
SANTA_spawn_y = 2000;

but1 = instance_create(x, y, button_for_plane);
but1.index = 0;
but2 = instance_create(x, y, button_for_plane);
but2.index = 1;
but3 = instance_create(x, y, button_for_plane);
but3.index = 2;
but4 = instance_create(x, y, button_for_plane);
but4.index = 3;
but5 = instance_create(x, y, button_for_plane);
but5.index = 4;
but6 = instance_create(x, y, button_for_plane);
but6.index = 5;
but7 = instance_create(x, y, button_for_plane);
but7.index = 6;
but8 = instance_create(x, y, button_for_plane);
but8.index = 7;
but9 = instance_create(x, y, button_for_plane);
but9.index = 8;
but10 = instance_create(x, y, button_for_plane);
but10.index = 9;
but11 = instance_create(x, y, button_for_plane);
but11.index = 10;
but12 = instance_create(x, y, button_for_plane);
but12.index = 11;

selected_plane = 0;

course = 60; // чувствительность управления
limit = 100; // расстояние до конца окна для перемещения

saved_planes = array_create(0);

for (var i = 1; i <= global.planes[0, 0]; i++)
{
	if ((global.planes[i, 14] == global.XMAS_escort_onfight && global.planes[i, 2] > 0) && global.XMAS_escort_onfight > 0)
	{
		var plane = instance_create(XMAS_spawn_x + random_range(-random_spawn_dev, random_spawn_dev), XMAS_spawn_y +  + random_range(-random_spawn_dev, random_spawn_dev), XMAS_Plane)
		plane.indx_esc = global.XMAS_escort_onfight;
		plane.indx = i;
		plane.image_angle = 180;
		
		var saved_plane = { index: i, hp: global.planes[i, 2], side: 1, w_1a: global.planes[i, 7], w_2a: global.planes[i, 9], w_3a: global.planes[i, 11]};
		array_insert(saved_planes, 0, saved_plane);
	}
}

for (var i = 1; i <= global.santaplanes[0, 0]; i++)
{
	if ((global.santaplanes[i, 12] == global.SANTA_escort_onfight && global.santaplanes[i, 1] > 0) && global.SANTA_escort_onfight > 0)
	{
		var plane = instance_create(SANTA_spawn_x + random_range(-random_spawn_dev, random_spawn_dev), SANTA_spawn_y +  + random_range(-random_spawn_dev, random_spawn_dev), XMAS_Plane)
		plane.indx_esc = global.SANTA_escort_onfight;
		plane.side = 3;
		plane.indx = i;
		plane.image_angle = 90
		
		var saved_plane = { index: i, hp: global.santaplanes[i, 1], side: 2, w_1a: global.santaplanes[i, 6], w_2a: global.santaplanes[i, 8], w_3a: global.santaplanes[i, 10]};
		array_insert(saved_planes, 0, saved_plane);
	}
}

for (var i = 1; i <= global.eggplanes[0, 0]; i++)
{
	if ((global.eggplanes[i, 12] == global.EGG_escort_onfight && global.eggplanes[i, 1] > 0) && global.EGG_escort_onfight > 0)
	{
		var plane = instance_create(EGG_spawn_x + random_range(-random_spawn_dev, random_spawn_dev), EGG_spawn_y +  + random_range(-random_spawn_dev, random_spawn_dev), EGG_Plane)
		plane.indx_esc = global.EGG_escort_onfight;
		plane.indx = i;
		
		var saved_plane = { index: i, hp: global.eggplanes[i, 1], side: 3, w_1a: global.eggplanes[i, 6], w_2a: global.eggplanes[i, 8], w_3a: global.eggplanes[i, 10]};
		array_insert(saved_planes, 0, saved_plane);
	}
}

//game_save("fight_save.dat"); - ломает глобальные переменные

ready = false;