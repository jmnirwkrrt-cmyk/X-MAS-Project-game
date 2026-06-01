/// Main Menu: Create

but = array_create(10);

image_xscale = 0;
image_yscale = 0.05;

x = room_width / 2;
y = room_height / 2;

var ads = 25;

but[0] = { menu_type: 1, txt: global.txt324, spr: button_large_s1/*начать игру*/,			x: -300 - ads, y: -55, xs: 1, ys: 1, image_index: 0 };
but[1] = { menu_type: 3, txt: global.txt325, spr: button_large_s1/*новая игра*/,			x: -300 - ads, y: -55, xs: 1, ys: 1, image_index: 0 };
but[2] = { menu_type: 3, txt: global.txt326, spr: button_large_s1/*продолжить игру*/,		x: ads, y: -55, xs: 1, ys: 1, image_index: 0 };
but[3] = { menu_type: 1, txt: global.txt327, spr: button_large_s1/*настройки*/,				x: ads, y: -55, xs: 1, ys: 1, image_index: 0 };
but[4] = { menu_type: 1, txt: global.txt328, spr: button_large_s1/*выход*/,					x: -300 - ads, y: ads, xs: 1, ys: 1, image_index: 0 };
but[5] = { menu_type: 3, txt: global.txt329, spr: button_large_s1/*назад (из начать игру)*/,x: ads, y: 55 + ads, xs: 1, ys: 1, image_index: 0  };
but[6] = { menu_type: 1, txt: global.txt330, spr: button_large_s1/*тестовый воздушный бой*/,x: -300 - ads, y: 55 * 1 + ads * 2, xs: 1, ys: 1, image_index: 0  };
but[7] = { menu_type: 1, txt: global.txt331, spr: button_large_s1/*тестовый наземный бой*/, x: ads, y: 55 * 1 + ads * 2, xs: 1, ys: 1, image_index: 0  };
but[8] = { menu_type: 2, txt: global.txt329, spr: button_large_s1/*назад (из настроек*/,	x: -300 - ads, y: -55, xs: 1, ys: 1, image_index: 0  };
but[9] = { menu_type: 2, txt: global.txt334,  spr: button_large_s1/*сложность*/,			x: ads, y: -55, xs: 1, ys: 1, image_index: 0  };
but[10] = { menu_type: 2, txt: global.txt337, spr: Stripple_S/*ползунок громкость звука*/,				x: 0, y: 65 * 1 + ads * 2, xs: 1, ys: 1, image_index: 0  };
but[11] = { menu_type: 2, txt: global.txt338, spr: Stripple_S/*ползунок громкость музыки*/,			x: 0, y: 65 * 2 + ads * 3, xs: 1, ys: 1, image_index: 0  };
but[12] = { menu_type: 2, txt: "", spr: Stripple_button_S/*кнопка ползунка звука*/,			x: 0, y: 65 * 1 + ads * 2, xs: 1, ys: 1, image_index: 0  };
but[13] = { menu_type: 2, txt: "", spr: Stripple_button_S/*кнопка ползунка музыки*/,		x: 0, y: 65 * 2 + ads * 3, xs: 1, ys: 1, image_index: 0  };
but[14] = { menu_type: 0, txt: "", spr: button_arrow_s/*button_arrow_3D*/,					x: 0, y: 0, xs: 1, ys: 1, image_index: 0  };
but[15] = { menu_type: 2, txt: global.txt340, spr: Checkbox_S/*чекбокс видеоролики*/,				x: 250, y: -100, xs: 1, ys: 1, image_index: 0  };
but[16] = { menu_type: 2, txt: global.txt339, spr: Checkbox_S/*чекбокс умирающие оперативники*/,	x: -250 - ads, y: -100, xs: 1, ys: 1, image_index: 0  };
but[17] = { menu_type: 2, txt: global.txt430, spr: Checkbox_S/*чекбокс удаление мест террора*/,		x: 0 - ads, y: -100, xs: 1, ys: 1, image_index: 0  };
but[18] = { menu_type: 2, txt: global.txt433, spr: Checkbox_S/*чекбокс автосохранения*/,			x: 0 - ads, y: 40, xs: 1, ys: 1, image_index: 0  };
but[19] = { menu_type: 1, txt: global.txt434, spr: button_large_s1/*миниигра*/,					x: ads, y: ads, xs: 1, ys: 1, image_index: 0 };




but[0].x = x + but[0].x; but[0].y = y + but[0].y;
but[1].x = x + but[1].x; but[1].y = y + but[1].y;
but[2].x = x + but[2].x; but[2].y = y + but[2].y;
but[3].x = x + but[3].x; but[3].y = y + but[3].y;
but[4].x = x + but[4].x; but[4].y = y + but[4].y;
but[5].x = x + but[5].x; but[5].y = y + but[5].y;
but[6].x = x + but[6].x; but[6].y = y + but[6].y;
but[7].x = x + but[7].x; but[7].y = y + but[7].y;
but[8].x = x + but[8].x; but[8].y = y + but[8].y;
but[9].x = x + but[9].x; but[9].y = y + but[9].y;
but[10].x = x + but[10].x; but[10].y = y + but[10].y;
but[11].x = x + but[11].x; but[11].y = y + but[11].y;
but[12].x = x + but[12].x; but[12].y = y + but[12].y;
but[13].x = x + but[13].x; but[13].y = y + but[13].y;
but[14].x = x + but[14].x; but[14].y = y + but[14].y;
but[15].x = x + but[15].x; but[15].y = y + but[15].y;
but[16].x = x + but[16].x; but[16].y = y + but[16].y;
but[17].x = x + but[17].x; but[17].y = y + but[17].y;
but[18].x = x + but[18].x; but[18].y = y + but[18].y;
but[19].x = x + but[19].x; but[19].y = y + but[19].y;

text1_w = 800;
text2_w = 800;
text3_w = 200;

text1_txt = global.txt332;
text2_txt = global.txt333 + string(global.game_version);
text3_txt = "";


outline = true;
outline_color = c_black;
outline_thickness = 1;

menu_type = 1; 
/*
1 - Главное меню
2 - Настройки
3 - Начало игры

*/



if (file_exists("xmas_settings.ini"))
{
	ini_open("xmas_settings.ini");
	ini_write_string("save", "skip_intro", "0");
	ini_close();
}