if (mcurrent = 0) { text.txt = global.txt123; }
if (indx = 1) indx = 6;
if (indx = 2) indx = 8;
if (indx = 3) indx = 10;
if (mcurrent = 0 or weapon[mcurrent, 2] != global.airweapon[global.planes[ask_plane.indx, indx], 0]) 
{ 
	if (global.airweapon[global.planes[ask_plane.indx, indx], 0] = global.airweapon[1, 0] || global.airweapon[global.planes[ask_plane.indx, indx], 0] = global.airweapon[13, 0]) 
	{
		d = 0;
		for (i = 0; i <= global.atstockpile[0, 0]; i++)
		{
			if (global.airweapon[global.planes[ask_plane.indx, indx], 0] = global.atstockpile[i, 0]) { d = i; break; }
		}
		if (d > 0) global.atstockpile[d, 1]++;
		if (d < 1) { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = global.airweapon[global.planes[ask_plane.indx, indx], 0]; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = 1; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
	}
	
	if (global.planes[ask_plane.indx, indx + 1] > 0)
	{
		
		if (global.airweapon[global.planes[ask_plane.indx, indx], 0] = 10 and global.planes[ask_plane.indx, indx + 1] > 0) global.planes[ask_plane.indx, indx + 1] = 1;
		d = 0;
		for (i = 0; i <= global.atstockpile[0, 0]; i++)
		{
			if (global.airweapon[global.planes[ask_plane.indx, indx], 3] = global.atstockpile[i, 0]) { d = i; break; }
		}
		if (d > 0) global.atstockpile[d, 1]++;
		if (d < 1) { global.atstockpile[global.atstockpile[0, 0] + 1, 0] = global.airweapon[global.planes[ask_plane.indx, indx], 3]; global.atstockpile[global.atstockpile[0, 0] + 1, 1] = global.planes[ask_plane.indx, indx + 1]; global.atstockpile[global.atstockpile[0, 0] + 1, 2] = 0; global.atstockpile[0, 0]++; }
	}
	
	if (mcurrent = 0)
	{
		global.planes[ask_plane.indx, indx] = 0;
		global.planes[ask_plane.indx, indx + 1] = 0; 
		if (global.planes[ask_plane.indx, 12] = 4)
		{
			global.planes[ask_plane.indx, 12] = 0;
			global.planes[ask_plane.indx, 13] = 0;
		}
	}
	else
	{
		global.planes[ask_plane.indx, indx] = weapon[mcurrent, 0];
		global.planes[ask_plane.indx, indx + 1] = 0; 
		if (global.planes[ask_plane.indx, 12] = 4) 
		{
			if (global.planes[ask_plane.indx, 13] < global.airweapon[weapon[mcurrent, 0], 4]) global.planes[ask_plane.indx, 13] = global.airweapon[weapon[mcurrent, 0], 4];
		}
		else 
		{
			global.planes[ask_plane.indx, 12] = 4;
			global.planes[ask_plane.indx, 13] = global.airweapon[weapon[mcurrent, 0], 4];
		}
	}
	if (mcurrent > 0 and weapon[mcurrent, 0] = 1) global.atstockpile[weapon[mcurrent, 2], 1]--; 
}

instance_destroy(self);

