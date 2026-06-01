/// =========================
/// ОТПУСТИТЬ ЛКМ
/// =========================

var GRENADE_ITEM = 6;
var MEDKIT_ITEM  = 32;

var grenades = 0;
var gindex = 0;
var medkits = 0;
var medindex = 0;
var i;

// ищем гранаты на складе
for (i = 1; i <= global.atstockpile[0, 0]; i++)
{
	if (global.atstockpile[i, 0] == GRENADE_ITEM)
	{
		grenades = global.atstockpile[i, 1];
		gindex = i;
		break;
	}
}

// ищем аптечки на складе
for (i = 1; i <= global.atstockpile[0, 0]; i++)
{
	if (global.atstockpile[i, 0] == MEDKIT_ITEM)
	{
		medkits = global.atstockpile[i, 1];
		medindex = i;
		break;
	}
}

sound_play(button_sound);
sound_volume(button_sound, global.soundvolume);
image_index = 0;

// =========================
// ГРАНАТЫ
// =========================
if (image_xscale == 1 && indx_type == 1)
{
	// снять 1 гранату с самолёта и вернуть на склад
	if (global.planes[indx_plane, 16] > 0)
	{
		// если строки гранат на складе ещё нет — создаём
		if (gindex == 0)
		{
			global.atstockpile[0, 0]++;
			gindex = global.atstockpile[0, 0];
			global.atstockpile[gindex, 0] = GRENADE_ITEM;
			global.atstockpile[gindex, 1] = 0;
			global.atstockpile[gindex, 2] = 0;
		}
		
		global.planes[indx_plane, 16]--;
		global.atstockpile[gindex, 1]++;
	}
}
else if (image_xscale == -1 && indx_type == 1)
{
	// загрузить 1 гранату на самолёт
	if (gindex > 0 && grenades > 0)
	{
		if (instance_exists(ask_plane) && ask_plane.plane_capacity >= ask_plane.grenade_medkit_size)
		{
			global.planes[indx_plane, 16]++;
			global.atstockpile[gindex, 1]--;
		}
	}
}

// =========================
// АПТЕЧКИ
// =========================
if (image_xscale == 1 && indx_type == 2)
{
	// снять 1 аптечку с самолёта и вернуть на склад
	if (global.planes[indx_plane, 17] > 0)
	{
		// если строки аптечек на складе ещё нет — создаём
		if (medindex == 0)
		{
			global.atstockpile[0, 0]++;
			medindex = global.atstockpile[0, 0];
			global.atstockpile[medindex, 0] = MEDKIT_ITEM;
			global.atstockpile[medindex, 1] = 0;
			global.atstockpile[medindex, 2] = 0;
		}
		
		global.planes[indx_plane, 17]--;
		global.atstockpile[medindex, 1]++;
	}
}
else if (image_xscale == -1 && indx_type == 2)
{
	// загрузить 1 аптечку на самолёт
	if (medindex > 0 && medkits > 0)
	{
		if (instance_exists(ask_plane) && ask_plane.plane_capacity >= ask_plane.grenade_medkit_size)
		{
			global.planes[indx_plane, 17]++;
			global.atstockpile[medindex, 1]--;
		}
	}
}