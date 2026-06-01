/// =========================
/// ОТПУСТИТЬ ПКМ
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
	// снять до 10 гранат с самолёта и вернуть на склад
	var move_amount = min(10, global.planes[indx_plane, 16]);

	if (move_amount > 0)
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
		
		global.planes[indx_plane, 16] -= move_amount;
		global.atstockpile[gindex, 1] += move_amount;
	}
}
else if (image_xscale == -1 && indx_type == 1)
{
	// загрузить до 10 гранат на самолёт
	if (gindex > 0 && grenades > 0)
	{
		var move_amount = min(10, grenades);
		if (instance_exists(ask_plane) && ask_plane.plane_capacity >= ask_plane.grenade_medkit_size)
		{
			global.planes[indx_plane, 16] += move_amount;
			global.atstockpile[gindex, 1] -= move_amount;
		}
	}
}

// =========================
// АПТЕЧКИ
// =========================
if (image_xscale == 1 && indx_type == 2)
{
	// снять до 10 аптечек с самолёта и вернуть на склад
	var move_amount = min(10, global.planes[indx_plane, 17]);

	if (move_amount > 0)
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

		global.planes[indx_plane, 17] -= move_amount;
		global.atstockpile[medindex, 1] += move_amount;
	}
}
else if (image_xscale == -1 && indx_type == 2)
{
	// загрузить до 10 аптечек на самолёт
	if (medindex > 0 && medkits > 0)
	{
		var move_amount = min(10, medkits);
		if (instance_exists(ask_plane) && ask_plane.plane_capacity >= ask_plane.grenade_medkit_size)
		{
			global.planes[indx_plane, 17] += move_amount;
			global.atstockpile[medindex, 1] -= move_amount;
		}
	}
}