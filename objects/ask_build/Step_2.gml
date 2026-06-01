if (image_xscale = 1 and image_yscale = 1)
{
if (mcurrent = 0) text.txt = global.txt27;
if (mcurrent = 1) text.txt = global.txt28;
if (mcurrent = 2) text.txt = global.txt29;
if (mcurrent = 3) mcurrent++;
if (mcurrent = 4) text.txt = global.txt31;
if (mcurrent = 5) text.txt = global.txt32;
if (mcurrent = 6) text.txt = global.txt33;
if (mcurrent = 7) text.txt = global.txt34;
if (mcurrent = 8) mcurrent++;
if (mcurrent = 9) text.txt = global.txt36;
text.txt = string_insert("$ ", text.txt, 0);
text.txt = string_insert(global.buildings[mcurrent, 3], text.txt, 0);
}


