if (image_xscale = 1 and image_yscale = 1 and !ready)
{
but1 = instance_create(x - 288, y + 42, button_large_q_yes)
but2 = instance_create(x + 17, y + 42, button_large_q_no)
text = instance_create(x, y - 25, text_obj_red);
text.w = 500;
text.txt = global.txt82;
ready = true;
}


if (image_xscale = 1 and image_yscale = 1 and but2.no) { instance_destroy(self); }
else
if (image_xscale = 1 and image_yscale = 1 and but1.yes and background_map.type = 1)
{
var i;
global.money -= background_map.cost;
for (i = 1; i <= global.buyable[0, 0]; i++)
{
global.itemsonway[global.itemsonway[0, 0] + 1, 0] = global.buyable[i, 0];
global.itemsonway[global.itemsonway[0, 0] + 1, 1] = global.buyable[i, 1];
global.itemsonway[global.itemsonway[0, 0] + 1, 2] = 43200;
global.itemsonway[0, 0]++;
}
stock = 0;
 civstock = 0;
 planestock = 0;
 for (i = 1; i <= global.buyable[0, 0]; i++)
 {
 if (global.items[global.buyable[i, 0], 1] > 0)
 stock += global.items[global.buyable[i, 0], 1] * global.buyable[i, 1];
 else
 if (global.items[global.buyable[i, 0], 1] = -1) civstock += global.buyable[i, 1];
 else
 if (global.items[global.buyable[i, 0], 1] = -2) planestock += global.buyable[i, 1];
 }
global.stock -= stock;
global.currentciv += civstock;
global.maxplanes -= planestock;
mess = instance_create(1200 / 2, 900 / 2, ask_message); mess.event = 7;
instance_destroy(self);
for (i = 1; i <= global.atstockpile[0, 0]; i++)
{
global.buyable[i, 1] = 0; 
}
}
else
if (image_xscale = 1 and image_yscale = 1 and but1.yes and background_map.type = 3)
{
var i;
global.money += background_map.cost;
stock = 0;
 civstock = 0;
 planestock = 0;
 for (i = 1; i <= global.atstockpile[0, 0]; i++)
 {
 if (global.items[global.atstockpile[i, 0], 2] > 0)
 stock += global.items[global.atstockpile[i, 0], 2] * global.atstockpile[i, 2];
 else
 if (global.items[global.atstockpile[i, 0], 2] = -1) civstock += global.atstockpile[i, 2];
 else
 if (global.items[global.atstockpile[i, 0], 2] = -2) planestock += global.atstockpile[i, 2];
 }

for (i = 1; i <= global.atstockpile[0, 0]; i++)
{
if (global.atstockpile[i, 2] > 0) { global.atstockpile[i, 1] -= global.atstockpile[i, 2]; global.atstockpile[i, 2] = 0; }
}

global.stock += stock;
global.currentciv -= civstock;
global.maxplanes += planestock;

instance_destroy(self);

if (global.scientist > 0)
{
global.scientist -= background_map.amounts;
background_map.amounts = 0;
}
if (global.engineers > 0)
{
global.engineers -= background_map.amounte;
background_map.amounte = 0;
}

}

