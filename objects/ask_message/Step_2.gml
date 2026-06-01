if (event == 1) { image_index = 0; }
if (event == 2) { image_index = 0; }
if (event == 3) { image_index = 0; }
if (event == 4) { image_index = 0; }
if (event == 5) { image_index = 0; }
if (event == 6) { image_index = 1; }
if (event == 7) { image_index = 2; }
if (event == 8) { image_index = 1; }
if (event == 9) { image_index = 0; }
if (event == 10) { image_index = 1; }
if (event == 11) { image_index = 1; }
if (event == 12) { image_index = 1; }
if (event == 13) { image_index = 3; }
if (event == 14) { image_index = 1; }
if (event == 15) { image_index = 3; }
if (event == 16) { image_index = 4; }
if (event == 17) { image_index = 2; }
if (event == 18) { image_index = 2; }
if (event == 19) { image_index = 2; }
if (event == 20) { image_index = 2; }
if (event == 21) { image_index = 3; }
if (event == 22) { image_index = 3; }
if (event == 23) { image_index = 3; }
if (event == 24) { image_index = 0; }
if (event == 25) { image_index = 0; }
if (event == 26) { image_index = 4; } 
if (event == 27) { image_index = 1; } 
if (event == 28) { image_index = 1; } 
if (event == 29) { image_index = 1; } 
if (event == 30) { image_index = 3; } 
if (event == -10) { image_index = 3; }
if (event == -9) { image_index = 2; }
if (event == -8) { image_index = 2; }
if (event == -7) { image_index = 2; }
if (event == -6) { image_index = 2; }
if (event == -5) { image_index = 2; }
if (event == -4) { image_index = 2; }
if (event == -3) { image_index = 2; }
if (event == -2) { image_index = 2; }
if (event == -1) { image_index = 2; }


if (global.startbuilding[0] > 0) rmv = true;

if (image_xscale = 1 and image_yscale = 1 and !ready)
{
if (event > 0 and event != 5) { but1 = instance_create(x - 140, y + 42, button_large_q_ok); but1.depth = depth - 1; }
text = instance_create(x, y - 25, text_obj_red);
text.w = 600;
ready = true;
}
if (ready)
{
if (event < 0 && event >= -9 && global.base_exists) { event = -global.startbuilding[0]; }
else
if (!global.base_exists) { event = -9; }
if (event == 1) { text.txt = global.txt20; image_index = 0; }
if (event == 2) { text.txt = global.txt21; image_index = 0; }
if (event == 3) { text.txt = global.txt22; image_index = 0; }
if (event == 4) { text.txt = global.txt23; image_index = 0; }
if (event == 5) { text.txt = global.txt45; image_index = 0; }
if (event == 6) { text.txt = global.txt83; image_index = 1; }
if (event == 7) { text.txt = global.txt86; image_index = 2; }
if (event == 8) { text.txt = global.txt87; image_index = 1; }
if (event == 9) { text.txt = global.items[item_index, 0]; text.txt = string_insert(text.txt, global.txt88, 0); image_index = 0; }
if (event == 10) { text.txt = global.txt99; image_index = 1; }
if (event == 11) { text.txt = global.txt100; image_index = 1; }
if (event == 12) { text.txt = global.txt101; image_index = 1; }
if (event == 13) { text.txt = global.txt132; image_index = 3; }
if (event == 14) { text.txt = global.txt155; image_index = 1; }
if (event == 15) { text.txt = string_insert(plane_indx, global.txt186, 0); image_index = 3; }
if (event == 16) { text.txt = global.txt239; image_index = 4; }
if (event == 17) { text.txt = global.txt251; image_index = 2; }
if (event == 18) { text.txt = global.txt252; image_index = 2; }
if (event == 19) { text.txt = global.txt253; image_index = 2; }
if (event == 20) { text.txt = global.txt254; image_index = 2; }
if (event == 21) { text.txt = global.txt293; image_index = 3; }
if (event == 22) { text.txt = txt; image_index = 3; }
if (event == 23) { text.txt = global.txt295; image_index = 3; }
if (event == 24) { text.txt = global.txt344 + global.items[global.constructitem[plane_indx, 0], 0]; image_index = 0; }
if (event == 25) { text.txt = global.txt394; image_index = 0; }
if (event == 26) { text.txt = global.txt396; image_index = 4; }
if (event == 27) { text.txt = global.txt406; image_index = 1; }
if (event == 28) { text.txt = global.txt410; image_index = 1; }
if (event == 29) { text.txt = global.txt427; image_index = 1; }
if (event == 30) { text.txt = global.txt428; image_index = 3; }
if (event == -10) { text.txt = global.txt177; image_index = 3; }
if (event == -9) { text.txt = global.txt166; image_index = 2; }
if (event == -8) { text.txt = global.txt37; image_index = 2; }
if (event == -7) { text.txt = global.txt38; image_index = 2; }
if (event == -6) { text.txt = global.txt39; image_index = 2; }
if (event == -5) { text.txt = global.txt40; image_index = 2; }
if (event == -4) { text.txt = global.txt41; image_index = 2; }
if (event == -3) { text.txt = global.txt42; image_index = 2; }
if (event == -2) { text.txt = global.txt43; image_index = 2; }
if (event == -1) { text.txt = global.txt44; image_index = 2; }

if (rmv and global.startbuilding[0] = 0) instance_destroy(self);
}

if (image_xscale = 1 and image_yscale = 1 and event > 0 and event != 5 and but1.ok) { instance_destroy(self); }

if (event == -10 && !instance_exists(mouse_target_inter)) { instance_destroy(self); }