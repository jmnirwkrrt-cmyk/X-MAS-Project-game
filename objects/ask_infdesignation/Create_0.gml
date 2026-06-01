instance_destroy(text_obj_red_28_left);
image_xscale = 0;
image_yscale = 0;
image_speed = 0;
image_index = 3;

mcurrent = 0;
mmax = global.atstockpile[0, 0];
mmin = 0;
text = instance_create(x, y + 50, text_obj_red_28);
text.w = 500;
text.txt = "";
text1 = instance_create(x, y - 50, text_obj_red_28);
text1.w = 500;
text1.txt = global.txt165;
indx = ask_inf.indx;

var i;
var i1;

plane[0, 0] = 0;
for (i = 1; i <= global.planes[0, 0]; i++)
{
if (global.planes[i, 14] = 0 and global.planes[i, 2] > 0 and global.planes[i, 4] > 0) { plane[plane[0, 0] + 1, 0] = i; plane[0, 0]++; }
}
mmax = plane[0, 0];
mmin = 0;

