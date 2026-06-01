instance_destroy(text_obj_red_28);
instance_destroy(text_obj_white_28);

if (image_xscale = 1 and image_yscale = 1 and !ready)
{
but1 = instance_create(x - 288, y + 42, button_large_q_yes)
but2 = instance_create(x + 17, y + 42, button_large_q_no)
text = instance_create(x, y - 25, text_obj_red);
text.w = 500;
text.txt = global.txt163;
ready = true;
}
if (ready)
{
if (but1.yes)
{
global.team[ask_inf.indx, 4] = -9999999;
global.currentciv--;


//

if (global.team[ask_inf.indx, 3] = "ak")
{
var i;
d = 0;
for (i = 1; i <= global.atstockpile[0, 0]; i++)
{
if (global.atstockpile[d, 0] = 1) d = i;
}
if (d > 0) global.atstockpile[d, 1]++;
else { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = 1; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = 1; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
}
if (global.team[ask_inf.indx, 3] = "rifle")
{
var i;
d = 0;
for (i = 1; i <= global.atstockpile[0, 0]; i++)
{
if (global.atstockpile[d, 0] = 3) d = i;
}
if (d > 0) global.atstockpile[d, 1]++;
else { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = 3; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = 1; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
}
if (global.team[ask_inf.indx, 3] = "laser")
{
var i;
d = 0;
for (i = 1; i <= global.atstockpile[0, 0]; i++)
{
if (global.atstockpile[d, 0] = 16) d = i;
}
if (d > 0) global.atstockpile[d, 1]++;
else { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = 16; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = 1; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
}
//
if (global.team[ask_inf.indx, 3] = "ak")
{
var i;
d = 0;
for (i = 1; i <= global.atstockpile[0, 0]; i++)
{
if (global.atstockpile[d, 0] = 4) d = i;
}
if (d > 0) global.atstockpile[d, 1]++;
else { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = 4; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = 1; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
}
if (global.team[ask_inf.indx, 3] = "rifle")
{
var i;
d = 0;
for (i = 1; i <= global.atstockpile[0, 0]; i++)
{
if (global.atstockpile[d, 0] = 5) d = i;
}
if (d > 0) global.atstockpile[d, 1]++;
else { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = 5; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = 1; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
}
//


instance_destroy(ask_inf);
instance_destroy(self);
}
else
if (but2.no) { instance_destroy(self);}
}

