instance_destroy(text_obj_red_28_left);
image_xscale = 0;
image_yscale = 0;
image_speed = 0;
image_index = 4;

mcurrent = 0;
mmax = global.atstockpile[0, 0];
mmin = 0;
text = instance_create(x, y + 50, text_obj_red_28);
text.w = 500;
text.txt = "";
text1 = instance_create(x, y - 50, text_obj_red_28);
text1.w = 500;
text1.txt = global.txt140;
indx = ask_inf.indx;

var i;
var i1;

weapon[0, 0] = 0;
for (i = 1; i <= global.atstockpile[0, 0]; i++)
{
if ((global.atstockpile[i, 0] = 1 or global.atstockpile[i, 0] = 3 or global.atstockpile[i, 0] = 16) and global.atstockpile[i, 1] > 0) { weapon[weapon[0, 0] + 1, 1] = global.atstockpile[i, 1]; weapon[weapon[0, 0] + 1, 0] = i;  weapon[0, 0]++; }
}
mmax = weapon[0, 0];
mmin = 0;

