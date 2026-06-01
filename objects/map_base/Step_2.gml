////////////////////////// где можно строить, где - нет

	yp = 0;
	xp = 0;
	for (i = 1; i < 37; i++)
	{
		if (xp > 750) { xp = 0; yp += 150; }
		instance_position(xp, yp, module_obj).can_build_small = false; // ибо иначе после сноса открывается ящик пандоры
		instance_position(xp, yp, module_obj).can_build_big = false;
		xp += 150;
	}
	
	yp = 0;
	xp = 0;
	for (i = 1; i < 37; i++)
	{
		if (xp > 750) { xp = 0; yp += 150; }
		if (global.basebuilding[instance_position(xp, yp, module_obj).index, 0] == "empty") { xp += 150; continue; }
		if (xp < 750) instance_position(xp + 150, yp, module_obj).can_build_small = true;
		if (xp >= 150) instance_position(xp - 150, yp, module_obj).can_build_small = true;
		if (yp < 750) instance_position(xp, yp + 150, module_obj).can_build_small = true;
		if (yp >= 150) instance_position(xp, yp - 150, module_obj).can_build_small = true;
		xp += 150;
	}
	
	yp = 0;
	xp = 0;
	for (i = 1; i < 37; i++)
	{
		if (xp > 750) { xp = 0; yp += 150; }
		if (global.basebuilding[instance_position(xp, yp, module_obj).index, 0] == "empty") { xp += 150; continue; }
		instance_position(xp, yp, module_obj).can_build_small = false;
		instance_position(xp, yp, module_obj).can_build_big = false;
		 xp += 150;
	}

	yp = 0;
	xp = 0;
	for (i = 1; i < 37; i++)
	{
		if (xp > 750) { xp = 0; yp += 150; }
		if (global.basebuilding[instance_position(xp, yp, module_obj).index, 0] != "empty") { xp += 150; continue; }
		instance_position(xp, yp, module_obj).can_build_big = false;
		all_empty = true;
		if (not (xp < 750 && instance_position(xp + 150, yp, module_obj).module == "empty")) all_empty = false;
		else
		if (not (xp < 750 && yp >= 150 && instance_position(xp + 150, yp - 150, module_obj).module == "empty")) all_empty = false;
		else
		if (not (yp >= 150 && instance_position(xp, yp - 150, module_obj).module == "empty")) all_empty = false;
		
		if (all_empty)
		{
		if (instance_position(xp, yp, module_obj).can_build_small) instance_position(xp, yp, module_obj).can_build_big = true;
		else
		if ((xp < 750 && instance_position(xp + 150, yp, module_obj).can_build_small)) instance_position(xp, yp, module_obj).can_build_big = true;
		else
		if ((xp < 750 && yp >= 150 && instance_position(xp + 150, yp - 150, module_obj).can_build_small)) instance_position(xp, yp, module_obj).can_build_big = true;
		else
		if ((yp >= 150 && instance_position(xp, yp - 150, module_obj).can_build_small)) instance_position(xp, yp, module_obj).can_build_big = true;
		}
		xp += 150;
	}
	
	yp = 0;
	xp = 0;
	for (i = 1; i < 37; i++)
	{
		if (xp > 750) { xp = 0; yp += 150; }
		if (global.basebuilding[instance_position(xp, yp, module_obj).index, 0] == "empty") { xp += 150; continue; }
		instance_position(xp, yp, module_obj).can_build_small = false;
		instance_position(xp, yp, module_obj).can_build_big = false;
		 xp += 150;
	}

//////////////////////////

////////////////////////// что можно сносить, а что нет

/*
	yp = 0;
	xp = 0;
	for (i = 1; i < 37; i++)
	{
		if (xp > 750) { xp = 0; yp += 150; }
		instance_position(xp, yp, module_obj).conn_count = 0;
		if (xp < 750) { if (instance_position(xp + 150, yp, module_obj).module != "empty") instance_position(xp, yp, module_obj).conn_count++; }
		if (xp >= 150) { if (instance_position(xp - 150, yp, module_obj).module != "empty") instance_position(xp, yp, module_obj).conn_count++; }
		if (yp < 750) { if (instance_position(xp, yp + 150, module_obj).module != "empty") instance_position(xp, yp, module_obj).conn_count++; }
		if (yp >= 150) { if (instance_position(xp, yp - 150, module_obj).module != "empty") instance_position(xp, yp, module_obj).conn_count++; }
		xp += 150;
	}
	
	yp = 0;
	xp = 0;
	for (i = 1; i < 37; i++)
	{
		if (xp > 750) { xp = 0; yp += 150; }
		instance_position(xp, yp, module_obj).has_oneconn_neighbor = false;
		if (instance_position(xp, yp, module_obj).module == "hangar_support")
		{
			if (xp < 750) { if (instance_position(xp + 150, yp, module_obj).module != "empty" && instance_position(xp, yp - 150, module_obj).module != "hangar" && instance_position(xp, yp - 150, module_obj).module != "hangar_support" &&  instance_position(xp + 150, yp, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
			if (xp >= 150) { if (instance_position(xp - 150, yp, module_obj).module != "empty" && instance_position(xp, yp - 150, module_obj).module != "hangar" && instance_position(xp, yp - 150, module_obj).module != "hangar_support" &&  instance_position(xp - 150, yp, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
			if (yp < 750) { if (instance_position(xp, yp + 150, module_obj).module != "empty" && instance_position(xp, yp - 150, module_obj).module != "hangar" && instance_position(xp, yp - 150, module_obj).module != "hangar_support" &&  instance_position(xp, yp + 150, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
			if (yp >= 150) { if (instance_position(xp, yp - 150, module_obj).module != "empty" && instance_position(xp, yp - 150, module_obj).module != "hangar" && instance_position(xp, yp - 150, module_obj).module != "hangar_support" &&  instance_position(xp, yp - 150, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
		}
		else
		if (instance_position(xp, yp, module_obj).module == "hangar")
		{
			if (xp < 750) { if (instance_position(xp + 150, yp, module_obj).module != "empty" && instance_position(xp, yp - 150, module_obj).module != "hangar_support" &&  instance_position(xp + 150, yp, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
			if (xp >= 150) { if (instance_position(xp - 150, yp, module_obj).module != "empty" && instance_position(xp, yp - 150, module_obj).module != "hangar_support" &&  instance_position(xp - 150, yp, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
			if (yp < 750) { if (instance_position(xp, yp + 150, module_obj).module != "empty" && instance_position(xp, yp - 150, module_obj).module != "hangar_support" &&  instance_position(xp, yp + 150, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
			if (yp >= 150) { if (instance_position(xp, yp - 150, module_obj).module != "empty" &&  instance_position(xp, yp - 150, module_obj).module != "hangar_support" &&  instance_position(xp, yp - 150, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
			
			if (instance_position(xp + 150, yp, module_obj).has_oneconn_neighbor || instance_position(xp, yp - 150, module_obj).has_oneconn_neighbor || instance_position(xp + 150, yp - 150, module_obj).has_oneconn_neighbor) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true;
		}
		else
		if (instance_position(xp, yp, module_obj).module != "empty")
		{
			if (xp < 750) { if (instance_position(xp + 150, yp, module_obj).module != "empty" && instance_position(xp + 150, yp, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
			if (xp >= 150) { if (instance_position(xp - 150, yp, module_obj).module != "empty" && instance_position(xp - 150, yp, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
			if (yp < 750) { if (instance_position(xp, yp + 150, module_obj).module != "empty" && instance_position(xp, yp + 150, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
			if (yp >= 150) { if (instance_position(xp, yp - 150, module_obj).module != "empty" &&  instance_position(xp, yp - 150, module_obj).conn_count < 2) instance_position(xp, yp, module_obj).has_oneconn_neighbor = true; }
		
		}
		xp += 150;
	}
*/
//////////////////////////



instance_destroy(draw_plane);

var i;
var hangar_count = 0;
var hangars = array_create(0);

// Собираем все готовые ангары
if (instance_exists(module_obj))
{
	for (i = 0; i < instance_number(module_obj); i++)
	{
		var modl = instance_find(module_obj, i);
		
		if (modl.module == "hangar" && modl.building_time < 1)
		{
			array_push(hangars, modl);
			hangar_count++;
		}
	}
}

// Раскладываем все живые самолёты подряд по ангарам:
// по 2 самолёта на ангар, без привязки к "парам" индексов
var hangar_index = 0;
var slot_in_hangar = 0;

for (i = 1; i <= global.planes[0, 0]; i++)
{
	if (hangar_index >= hangar_count) break;
	if (global.planes[i, 2] < 1) continue; // самолёт уничтожен
	
	var hangar = hangars[hangar_index];
	if (!instance_exists(hangar)) continue;
	
	var xoffset = 70 + slot_in_hangar * 150;
	
	var plane_draw = instance_create(hangar.x + xoffset, hangar.y + 30, draw_plane);
	plane_draw.indx = global.planes[i, 0];
	
	// Если самолёт не на базе, просто помечаем это флагом,
	// как и было у тебя раньше
	if (global.planes[i, 14] > 0)
	{
		plane_draw.is_on_base = false;
	}
	
	slot_in_hangar++;
	
	// Переходим к следующему ангару после двух самолётов
	if (slot_in_hangar >= 2)
	{
		slot_in_hangar = 0;
		hangar_index++;
	}
}

