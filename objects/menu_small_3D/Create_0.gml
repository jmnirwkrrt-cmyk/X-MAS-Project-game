depth = -999999;
index = -1;

but = array_create(6);

but[0] = { txt: global.txt7, spr: button_large_s/*button_large_continue_3D*/, x: 0, y: 0, xs: 1, ys: 1, image_index: 0 };
but[1] = { txt: global.txt8, spr: button_large_s/*button_large_evac_3D*/,     x: 0, y: 0, xs: 1, ys: 1, image_index: 0 };
but[2] = { txt: global.txt6, spr: button_large_s/*button_large_exit_3D*/,     x: 0, y: 0, xs: 1, ys: 1, image_index: 0 };
but[3] = { txt: "", spr: button_redarrow_s/*button_arrow_red_3D*/,      x: 0, y: 0, xs: 1, ys: 1, image_index: 0 };
but[4] = { txt: "", spr: button_arrow_s/*button_arrow_3D*/,          x: 0, y: 0, xs: 1, ys: 1, image_index: 0 };
but[5] = { txt: "", spr: button_arrow_s/*button_arrow_3D*/,          x: 0, y: 0, xs: -1, ys: 1, image_index: 0  };

text1_w = 244;
text2_w = 2000;
text3_w = 200;

text1_txt = "";
text2_txt = global.txt5;
text3_txt = "";
if (oArena3D.battle_type == 1) // Уничтожить всех
{
	text3_txt = global.txt302;
}
else
if (oArena3D.battle_type == 2) // Выживать в течении
{
	text3_txt = global.txt303;
}
else
if (oArena3D.battle_type == 3) // Найти изумруд и эвакуироваться
{
	text3_txt = global.txt304;
}
else
if (oArena3D.battle_type == 4) // Захват базы
{
	text3_txt = global.txt302;
}
else
if (oArena3D.battle_type == 5) // Оборона базы
{
	text3_txt = global.txt303;
}


outline = true;
outline_color = c_black;
outline_thickness = 1;

type = 1; // 1 - обычное меню, 2 - конец боя



function is_our_squad(trooper_index)
{
	if (global.XMAS_squad_onfight == 0)
	{
		if (global.team[trooper_index, 0] == global.XMAS_squad_onfight) return true;
		for (var i = 1; i <= global.planes[0,0]; i++)
		{
			if (global.team[trooper_index, 0] != i) continue;
			if (global.planes[i, 14] == 0) return true;
			else return false;
		}
	}
	else
	if (global.team[trooper_index, 0] == global.XMAS_squad_onfight) return true;
	
	
	return false;
}