sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
image_index = 0;
anyinf = false;
selected = false;
imin = 0;
imax = 0;
icount = 0;
menu_index = menu_small.index;
if (menu_index = 0 and global.team[0, 0] > 0) { menu_index = 1; }
ic = 0;
var i;
for (i = 1; i <= global.team[0, 0]; i++)
{
if (global.team[i, 4] > 0 and global.team[i, 0] = global.currentsquad)
{ 
icount++;  
}
}
for (i = 1; i <= global.team[0, 0]; i++)
{

if (global.team[i, 4] > 0 and global.team[i, 0] = global.currentsquad)
{ 
anyinf = true;
ic++;
if (imin = 0) { imin = i; }  
if (ic = icount) { imax = i; }
}

}

if (anyinf)
{

if (image_xscale = -1)
{

for (i = menu_index + 1; !selected; i++)
{
if (i > imax) { i = imin; }
if (global.team[i, 4] > 0 and global.team[i, 0] = global.currentsquad)
{ 
menu_small.index = i; 
selected = true; 
}

}
}
else 
{ 
for (i = menu_index - 1; !selected; i--)
{
if (i < imin) { i = imax; }
if (global.team[i, 4] > 0 and global.team[i, 0] = global.currentsquad)
{ 
menu_small.index = i; 
selected = true; 
}

}
}
 
}
else
{
menu_small.index = 0;
}


