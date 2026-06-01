instance_destroy(text_obj_red_28);
instance_destroy(text_obj_white_28);

if (image_xscale = 1 and image_yscale = 1 and !ready)
{
but1 = instance_create(x - 288, y + 42, button_large_q_yes)
but2 = instance_create(x + 17, y + 42, button_large_q_no)
text = instance_create(x, y - 25, text_obj_red);
text.w = 500;
text.txt = global.txt138;
ready = true;
}
if (ready)
{
if (but1.yes)
{
global.planes[ask_plane.indx, 2] = -1;
global.maxplanes++;


//
if (global.planes[ask_plane.indx, 6] > 0 and global.airweapon[global.planes[ask_plane.indx, 6], 0] = global.airweapon[1, 0]) {
d = 0;
for (i = 0; i <= global.atstockpile[0, 0]; i++)
{
if (global.airweapon[global.planes[ask_plane.indx, 6], 0] = global.atstockpile[i, 0]) { d = i; break; }
}
if (d > 0) global.atstockpile[d, 1]++;
if (d < 1) { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = global.airweapon[global.planes[ask_plane.indx, 6], 0]; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = 1; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
}
if (global.planes[ask_plane.indx, 8] > 0 and global.airweapon[global.planes[ask_plane.indx, 8], 0] = global.airweapon[1, 0]) {
d = 0;
for (i = 0; i <= global.atstockpile[0, 0]; i++)
{
if (global.airweapon[global.planes[ask_plane.indx, 8], 0] = global.atstockpile[i, 0]) { d = i; break; }
}
if (d > 0) global.atstockpile[d, 1]++;
if (d < 1) { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = global.airweapon[global.planes[ask_plane.indx, 8], 0]; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = 1; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
}
if (global.planes[ask_plane.indx, 10] > 0 and global.airweapon[global.planes[ask_plane.indx, 10], 0] = global.airweapon[1, 0]) {
d = 0;
for (i = 0; i <= global.atstockpile[0, 0]; i++)
{
if (global.airweapon[global.planes[ask_plane.indx, 10], 0] = global.atstockpile[i, 0]) { d = i; break; }
}
if (d > 0) global.atstockpile[d, 1]++;
if (d < 1) { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = global.airweapon[global.planes[ask_plane.indx, 10], 0]; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = 1; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
}
if (global.planes[ask_plane.indx, 6 + 1] > 0)
{

if (global.airweapon[global.planes[ask_plane.indx, 6], 0] = 10 and global.planes[ask_plane.indx, 6 + 1] > 0) global.planes[ask_plane.indx, 6 + 1] = 1;
d = 0;
for (i = 0; i <= global.atstockpile[0, 0]; i++)
{
if (global.airweapon[global.planes[ask_plane.indx, 6], 3] = global.atstockpile[i, 0]) { d = i; break; }
}
if (d > 0) global.atstockpile[d, 1]++;
if (d < 1) { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = global.airweapon[global.planes[ask_plane.indx, 6], 3]; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = global.planes[ask_plane.indx, 6 + 1]; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
}
if (global.planes[ask_plane.indx, 8 + 1] > 0)
{

if (global.airweapon[global.planes[ask_plane.indx, 8], 0] = 10 and global.planes[ask_plane.indx, 8 + 1] > 0) global.planes[ask_plane.indx, 8 + 1] = 1;
d = 0;
for (i = 0; i <= global.atstockpile[0, 0]; i++)
{
if (global.airweapon[global.planes[ask_plane.indx, 8], 3] = global.atstockpile[i, 0]) { d = i; break; }
}
if (d > 0) global.atstockpile[d, 1]++;
if (d < 1) { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = global.airweapon[global.planes[ask_plane.indx, 8], 3]; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = global.planes[ask_plane.indx, 8 + 1]; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
}

if (global.planes[ask_plane.indx, 10 + 1] > 0)
{

if (global.airweapon[global.planes[ask_plane.indx, 10], 0] = 10 and global.planes[ask_plane.indx, 10 + 1] > 0) global.planes[ask_plane.indx, 10 + 1] = 1;
d = 0;
for (i = 0; i <= global.atstockpile[0, 0]; i++)
{
if (global.airweapon[global.planes[ask_plane.indx, 10], 3] = global.atstockpile[i, 0]) { d = i; break; }
}
if (d > 0) global.atstockpile[d, 1]++;
if (d < 1) { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = global.airweapon[global.planes[ask_plane.indx, 10], 3]; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = global.planes[ask_plane.indx, 10 + 1]; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
}
//


instance_destroy(ask_plane);
instance_destroy(self);
}
else
if (but2.no) { instance_destroy(self);}
}

