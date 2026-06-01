if (image_xscale = 1 and image_yscale = 1)
{
instance_destroy(button_large_b_weapon);
instance_destroy(text_obj_white_28);
if (mcurrent > 0)
while (weapon[mcurrent, 1] < 1 and mcurrent < mmax) mcurrent++;

if (mcurrent > mmax) mcurrent = mmin;
if (mcurrent < mmin) mcurrent = mmax;

if (mcurrent = 0) { text.txt = global.txt123; }
if (mcurrent > 0)
{
if (global.atstockpile[weapon[mcurrent, 2], 0] = global.airweapon[1, 0]) { text.txt = global.txt116; }
if (global.atstockpile[weapon[mcurrent, 2], 0] = global.airweapon[2, 0]) { text.txt = global.txt117; }
if (global.atstockpile[weapon[mcurrent, 2], 0] = global.airweapon[3, 0]) { text.txt = global.txt118; }
if (global.atstockpile[weapon[mcurrent, 2], 0] = global.airweapon[4, 0]) { text.txt = global.txt119; }
if (global.atstockpile[weapon[mcurrent, 2], 0] = global.airweapon[5, 0]) { text.txt = global.txt120; }
if (global.atstockpile[weapon[mcurrent, 2], 0] = global.airweapon[6, 0]) { text.txt = global.txt122; }
if (global.atstockpile[weapon[mcurrent, 2], 0] = global.airweapon[7, 0]) { text.txt = global.txt121; }
if (global.atstockpile[weapon[mcurrent, 2], 0] = global.airweapon[13, 0]) { text.txt = global.txt441; }
if (global.atstockpile[weapon[mcurrent, 2], 0] = global.airweapon[14, 0]) { text.txt = global.txt442; }
}

}

