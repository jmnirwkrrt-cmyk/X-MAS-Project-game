if (mcurrent > 0)
{
var i;
mest = global.planedata[global.planes[plane[mcurrent, 0], 0], 12];
for (i = 0; i <= global.team[0, 0]; i++ ) { if (global.team[i, 0] = plane[mcurrent, 0]) mest--; }
}


if (mcurrent = 0) global.team[indx, 0] = 0;
else if (mest > 0) global.team[indx, 0] = plane[mcurrent, 0];
else { mes = instance_create(1200 / 2, 900 / 2, ask_message); mes.event = 12; }

instance_destroy(self);

