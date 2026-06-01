if (image_xscale = 1 and image_yscale = 1)
{
if (mcurrent > mmax) mcurrent = mmin;
if (mcurrent < mmin) mcurrent = mmax;
if (mcurrent = 2) text.txt = global.txt167;
if (mcurrent = 3) text.txt = global.txt168;
if (mcurrent = 4) text.txt = global.txt169;
text.txt = string_insert("$ ", text.txt, 0);
text.txt = string_insert(global.onmapbuilding[mcurrent, 4], text.txt, 0);
}



