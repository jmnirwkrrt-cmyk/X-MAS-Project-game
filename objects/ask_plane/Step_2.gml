
if (image_xscale = 1 and image_yscale = 1 and !instance_exists(ask_planeweapon) and !instance_exists(ask_question_p))
{
instance_destroy(button_large_b_planetth);
instance_destroy(text_obj_white_28);
instance_destroy(text_obj_red_28);
instance_destroy(text_obj_red_28_left);
instance_destroy(button_arrow_2P);

if ((!instance_exists(button_large_b_weapon) and global.planes[indx, 6] > -1) or !instance_exists(button_large_b_name)) {
but1 = instance_create(x - 300, y - 322, button_large_b_name); but1.indx = indx;
if (global.planes[indx, 6] > -1) { but2 = instance_create(x - 2, y - 208, button_large_b_weapon); but2.indx = indx; but2.wi = 1; }
if (global.planes[indx, 8] > -1) { but3 = instance_create(x - 2, y - 108, button_large_b_weapon); but3.indx = indx; but3.wi = 2; }
if (global.planes[indx, 10] > -1) { but4 = instance_create(x - 2, y - 8, button_large_b_weapon); but4.indx = indx; but4.wi = 3; }
}
but5 = instance_create(x - 333, y + 275, button_large_b_remove);
but5.indx = indx;
but5.type = 1;
but5.text.txt = global.txt130;
but6 = instance_create(x + 32, y + 275, button_large_b_remove);
but6.indx = indx;
but6.type = 2;
but6.text.txt = global.txt24;

if (global.planes[indx, 6] > -1) {
text1 = instance_create(x - 300, y - 198, text_obj_white_28);
text1.w = 500;
text1.txt = global.txt135; }
if (global.planes[indx, 8] > -1) {
text2 = instance_create(x - 300, y - 98, text_obj_white_28);
text2.w = 500;
text2.txt = global.txt136; }
if (global.planes[indx, 10] > -1) {
text3 = instance_create(x - 300, y + 18, text_obj_white_28);
text3.w = 500;
text3.txt = global.txt137; }

if (global.planes[indx, 6] > -1) {
text4 = instance_create(x + 305, y - 198, text_obj_white_28);
text4.w = 500;
text4.txt = global.planes[indx, 7]; }
if (global.planes[indx, 8] > -1) {
text5 = instance_create(x + 305, y - 98, text_obj_white_28);
text5.w = 500;
text5.txt = global.planes[indx, 9]; }
if (global.planes[indx, 10] > -1) {
text6 = instance_create(x + 305, y + 18, text_obj_white_28);
text6.w = 500;
text6.txt = global.planes[indx, 11]; }

if (global.planedata[global.planes[indx, 0], 12] > 0)
{

// механика груза!
plane_capacity = global.planes[indx, 5];
for (var q = 1; q <= global.team[0,0]; q++)
{
	if (global.team[q, 0] != indx) continue;
	plane_capacity--;
}
plane_capacity -= global.planes[indx, 16] * grenade_medkit_size;
plane_capacity -= global.planes[indx, 17] * grenade_medkit_size;

// механика защиты от хитрожопых (нагрузил гранат и потом пехоту) без залезания в код назначения пехоты
if (plane_capacity <= 0)
{
	if (global.planes[indx, 16] > 0 || global.planes[indx, 17] > 0)
	{
		var infinity_catch = 0;
		while (plane_capacity < 0 && infinity_catch < 500)
		{
			infinity_catch++;
			if (global.planes[indx, 16] > 0) { global.planes[indx, 16]--; plane_capacity += 1 * grenade_medkit_size; }	
			if (global.planes[indx, 17] > 0) { global.planes[indx, 17]--; plane_capacity += 1 * grenade_medkit_size; }	
		}
		if (infinity_catch >= 500) show_debug_message("Бесконечный цикл гранат\аптечек!!");
	}
}

	
var i;
mest = global.planedata[global.planes[indx, 0], 12];
for (i = 0; i <= global.team[0, 0]; i++ ) { if (global.team[i, 0] = indx) mest--; }
text1 = instance_create(x - 300, y - 198, text_obj_white_28);
text1.w = 500;
text1.txt = mest;
text1.txt = string_insert(global.txt152, text1.txt, 0);
text2 = instance_create(x - 300, y - 98, text_obj_white_28);
text2.w = 500;
text2.txt = global.planes[indx, 16];
text2.txt = string_insert(global.txt153, text2.txt, 0);
text3 = instance_create(x - 300, y + 18, text_obj_white_28);
text3.w = 500;
text3.txt = global.planes[indx, 17];
text3.txt = string_insert(global.txt154, text3.txt, 0);
text4 = instance_create(x - 300, y - 35, text_obj_white_28);
text4.w = 500;
text4.txt = global.txt443 + string(plane_capacity);

butx1 = instance_create(x + 270, y - 88, button_arrow_2P);
butx1.indx_plane = indx;
butx1.indx_type = 1;
butx2 = instance_create(x + 310, y - 88, button_arrow_2P);
butx2.indx_plane = indx;
butx2.indx_type = 1;
butx2.image_xscale = -1;

butx3 = instance_create(x + 270, y + 28, button_arrow_2P);
butx3.indx_plane = indx;
butx3.indx_type = 2;
butx4 = instance_create(x + 310, y + 28, button_arrow_2P);
butx4.indx_plane = indx;
butx4.indx_type = 2;
butx4.image_xscale = -1;
}

text7 = instance_create(x - 300, y + 108, text_obj_white_28);
text7.w = 500;
text7.txt = global.planes[indx, 1] / global.planedata[global.planes[indx, 0], 5] * 100;
text7.txt = string_insert(global.txt124, text7.txt, 0);
text8 = instance_create(x - 300, y + 208, text_obj_white_28);
text8.w = 500;
text8.txt = global.planes[indx, 2] / global.planedata[global.planes[indx, 0], 1] * 100;
text8.txt = string_insert(global.txt125, text8.txt, 0);
}


