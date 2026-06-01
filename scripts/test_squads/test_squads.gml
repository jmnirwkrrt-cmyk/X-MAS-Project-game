function test_squads() {
	global.XMAS_escort_onfight = 5;
	global.SANTA_escort_onfight = 1;
	global.EGG_escort_onfight = 1;
	global.XMAS_squad_onfight = 5;
	global.EGG_squad_onfight = 1;
	global.SANTA_squad_onfight = 1;
	global.ground_battle_type = 3;

	global.planes[0, 0] = 0; // число самолётов
	global.planes[1, 0] = 1; // индекс в planedata, Ветер
	global.planes[1, 1] = global.planedata[global.planes[1, 0], 5]; // топливо
	global.planes[1, 2] = global.planedata[global.planes[1, 0], 1]; // хп
	global.planes[1, 3] = 0; // скорость
	global.planes[1, 4] = global.planedata[global.planes[1, 0], 12]; // место для десанта
	global.planes[1, 5] = global.planedata[global.planes[1, 0], 13]; // место для груза
	global.planes[1, 6] = 4; // оружие 1
	global.planes[1, 7] = global.airweapon[4, 2]; // БК оружия 1
	global.planes[1, 8] = 3; // оружие 2
	global.planes[1, 9] = global.airweapon[3, 2]; // БК оружия 2
	global.planes[1, 10] = global.planedata[global.planes[1, 0], 4]; // оружие 3
	global.planes[1, 11] = 0; // БК оружия 3
	global.planes[1, 12] = 0; // Статус (0 - готов, 1 - ремонт, 2 - перезарядка, 3 - дозаправка)
	global.planes[1, 13] = 0; // Текущее время обслуживания
	global.planes[1, 14] = 5; // номер эскадрильи, 0 = на базе
	global.planes[1, 15] = global.planedata[global.planes[1, 0], 0]; // название
	global.planes[1, 16] = 0; // гранат на борту
	global.planes[1, 17] = 0; // аптечек на борту
	global.planes[0, 0]++;
	global.planes[2, 0] = 3; // индекс в planedata, Х-Торнадо // 3
	global.planes[2, 1] = global.planedata[global.planes[2, 0], 5]; // топливо
	global.planes[2, 2] = global.planedata[global.planes[2, 0], 1]; // хп
	global.planes[2, 3] = 0; // скорость
	global.planes[2, 4] = global.planedata[global.planes[2, 0], 12]; // место для десанта
	global.planes[2, 5] = global.planedata[global.planes[2, 0], 13]; // место для груза
	global.planes[2, 6] = 1; // оружие 1
	global.planes[2, 7] = global.airweapon[1, 2]; // БК оружия 1
	global.planes[2, 8] = 2; // оружие 2
	global.planes[2, 9] = global.airweapon[2, 2]; // БК оружия 2
	global.planes[2, 10] = global.planedata[global.planes[2, 0], 4]; // оружие 3
	global.planes[2, 11] = 0; // БК оружия 3
	global.planes[2, 12] = 0; // Статус (0 - готов, 1 - ремонт, 2 - перезарядка, 3 - дозаправка, 4 - установка оружия)
	global.planes[2, 13] = 0; // Текущее время обслуживания
	global.planes[2, 14] = 5; // номер эскадрильи, 0 = на базе
	global.planes[2, 15] = global.planedata[global.planes[2, 0], 0]; // название
	global.planes[2, 16] = 0; // гранат на борту
	global.planes[2, 17] = 0; // аптечек на борту
	global.planes[0, 0]++;
	global.planes[3, 0] = 4; // индекс в planedata, Альбатрос // 4
	global.planes[3, 1] = global.planedata[global.planes[3, 0], 5]; // топливо
	global.planes[3, 2] = global.planedata[global.planes[3, 0], 1]; // хп
	global.planes[3, 3] = 0; // скорость
	global.planes[3, 4] = global.planedata[global.planes[3, 0], 12]; // место для десанта
	global.planes[3, 5] = global.planedata[global.planes[3, 0], 13]; // место для груза
	global.planes[3, 6] = 1; // оружие 1
	global.planes[3, 7] = global.airweapon[1, 2]; // БК оружия 1
	global.planes[3, 8] = 3; // оружие 2
	global.planes[3, 9] = global.airweapon[3, 2]; // БК оружия 2
	global.planes[3, 10] = global.planedata[global.planes[3, 0], 4]; // оружие 3
	global.planes[3, 11] = 0; // БК оружия 3
	global.planes[3, 12] = 0; // Статус (0 - готов, 1 - ремонт, 2 - перезарядка, 3 - дозаправка, 4 - установка оружия)
	global.planes[3, 13] = 0; // Текущее время обслуживания
	global.planes[3, 14] = 5; // номер эскадрильи, 0 = на базе
	global.planes[3, 15] = global.planedata[global.planes[3, 0], 0]; // название
	global.planes[3, 16] = 0; // гранат на борту
	global.planes[3, 17] = 0; // аптечек на борту
	global.planes[0, 0]++;
	global.planes[4, 0] = 2; // индекс в planedata, Пингвин
	global.planes[4, 1] = global.planedata[global.planes[4, 0], 5]; // топливо
	global.planes[4, 2] = global.planedata[global.planes[4, 0], 1]; // хп
	global.planes[4, 3] = 0; // скорость
	global.planes[4, 4] = global.planedata[global.planes[4, 0], 12]; // место для десанта
	global.planes[4, 5] = global.planedata[global.planes[4, 0], 13]; // место для груза
	global.planes[4, 6] = 4; // оружие 1
	global.planes[4, 7] = global.airweapon[4, 2]; // БК оружия 1
	global.planes[4, 8] = 3; // оружие 2
	global.planes[4, 9] = global.airweapon[3, 2]; // БК оружия 2
	global.planes[4, 10] = global.planedata[global.planes[4, 0], 4]; // оружие 3
	global.planes[4, 11] = 0; // БК оружия 3
	global.planes[4, 12] = 0; // Статус (0 - готов, 1 - ремонт, 2 - перезарядка, 3 - дозаправка)
	global.planes[4, 13] = 0; // Текущее время обслуживания
	global.planes[4, 14] = 5; // номер эскадрильи, 0 = на базе
	global.planes[4, 15] = global.planedata[global.planes[4, 0], 0]; // название
	global.planes[4, 16] = 0; // гранат на борту
	global.planes[4, 17] = 0; // аптечек на борту
	global.planes[0, 0]++;
	global.planes[5, 0] = 7; // индекс в planedata, Скаут
	global.planes[5, 1] = global.planedata[global.planes[5, 0], 5]; // топливо
	global.planes[5, 2] = global.planedata[global.planes[5, 0], 1]; // хп
	global.planes[5, 3] = 0; // скорость
	global.planes[5, 4] = global.planedata[global.planes[5, 0], 12]; // место для десанта
	global.planes[5, 5] = global.planedata[global.planes[5, 0], 13]; // место для груза
	global.planes[5, 6] = -1; // оружие 1
	global.planes[5, 7] = 0; // БК оружия 1
	global.planes[5, 8] = -1; // оружие 2
	global.planes[5, 9] = 0; // БК оружия 2
	global.planes[5, 10] = global.planedata[global.planes[1, 0], 4]; // оружие 3
	global.planes[5, 11] = 0; // БК оружия 3
	global.planes[5, 12] = 0; // Статус (0 - готов, 1 - ремонт, 2 - перезарядка, 3 - дозаправка)
	global.planes[5, 13] = 0; // Текущее время обслуживания
	global.planes[5, 14] = 5; // номер эскадрильи, 0 = на базе
	global.planes[5, 15] = global.planedata[global.planes[5, 0], 0]; // название
	global.planes[5, 16] = 5; // гранат на борту
	global.planes[5, 17] = 5; // аптечек на борту
	global.planes[0, 0]++;
	global.planes[6, 0] = 5; // индекс в planedata, Фотон
	global.planes[6, 1] = global.planedata[global.planes[6, 0], 5]; // топливо
	global.planes[6, 2] = global.planedata[global.planes[6, 0], 1]; // хп
	global.planes[6, 3] = 0; // скорость
	global.planes[6, 4] = global.planedata[global.planes[6, 0], 12]; // место для десанта
	global.planes[6, 5] = global.planedata[global.planes[6, 0], 13]; // место для груза
	global.planes[6, 6] = 14; // оружие 1
	global.planes[6, 7] = global.airweapon[14, 2]; // БК оружия 1
	global.planes[6, 8] = -1; // оружие 2
	global.planes[6, 9] = 0; // БК оружия 2
	global.planes[6, 10] = global.planedata[global.planes[6, 0], 4]; // оружие 3
	global.planes[6, 11] = 0; // БК оружия 3
	global.planes[6, 12] = 0; // Статус (0 - готов, 1 - ремонт, 2 - перезарядка, 3 - дозаправка)
	global.planes[6, 13] = 0; // Текущее время обслуживания
	global.planes[6, 14] = 5; // номер эскадрильи, 0 = на базе
	global.planes[6, 15] = global.planedata[global.planes[6, 0], 0]; // название
	global.planes[6, 16] = 0; // гранат на борту
	global.planes[6, 17] = 0; // аптечек на борту
	global.planes[0, 0]++;

	global.santaplanes[0, 0] = 0; // число самолётов
	global.santaplanes[1, 0] = 1; // индекс в planedata, Ветер
	global.santaplanes[1, 1] = global.planedata[global.santaplanes[1, 0], 1]; // хп
	global.santaplanes[1, 2] = 0; // скорость
	global.santaplanes[1, 3] = global.planedata[global.santaplanes[1, 0], 12]; // место для десанта
	global.santaplanes[1, 4] = global.planedata[global.santaplanes[1, 0], 13]; // место для груза
	global.santaplanes[1, 5] = 8; // оружие 1
	global.santaplanes[1, 6] = global.airweapon[8, 2]; // БК оружия 1
	global.santaplanes[1, 7] = global.planedata[global.santaplanes[1, 0], 3]; // оружие 2
	global.santaplanes[1, 8] = 0; // БК оружия 2
	global.santaplanes[1, 9] = global.planedata[global.santaplanes[1, 0], 4]; // оружие 3
	global.santaplanes[1, 10] = 0; // БК оружия 3
	global.santaplanes[1, 11] = 0; // Статус (0 - перемещение, 1 - патруль, 2 - перехват, 3 - бомбардировка)
	global.santaplanes[1, 12] = 1; // номер эскадрильи, 0 = на базе
	global.santaplanes[1, 13] = global.planedata[global.santaplanes[1, 0], 0]; // название
	global.santaplanes[0, 0]++;

	global.eggplanes[0, 0] = 0; // число самолётов
	global.eggplanes[1, 0] = 1; // индекс в eggplanedata, разведчик Е-104
	global.eggplanes[1, 1] = global.eggplanedata[global.eggplanes[1, 0], 1]; // хп
	global.eggplanes[1, 2] = 0; // скорость
	global.eggplanes[1, 3] = global.eggplanedata[global.eggplanes[1, 0], 12]; // место для десанта
	global.eggplanes[1, 4] = global.eggplanedata[global.eggplanes[1, 0], 13]; // место для груза
	global.eggplanes[1, 5] = 8; // оружие 1
	global.eggplanes[1, 6] = global.airweapon[8, 2]; // БК оружия 1
	global.eggplanes[1, 7] = global.eggplanedata[global.eggplanes[1, 0], 3]; // оружие 2
	global.eggplanes[1, 8] = 0; // БК оружия 2
	global.eggplanes[1, 9] = global.eggplanedata[global.eggplanes[1, 0], 4]; // оружие 3
	global.eggplanes[1, 10] = 0; // БК оружия 3
	global.eggplanes[1, 11] = 0; // Статус (0 - перемещение, 1 - патруль, 2 - перехват, 3 - бомбардировка)
	global.eggplanes[1, 12] = 1; // номер эскадрильи, 0 = на базе
	global.eggplanes[1, 13] = global.eggplanedata[global.eggplanes[1, 0], 0]; // название
	global.eggplanes[0, 0]++;
	global.eggplanes[2, 0] = 2; // индекс в eggplanedata, истребитель Е-140
	global.eggplanes[2, 1] = global.eggplanedata[global.eggplanes[2, 0], 1]; // хп
	global.eggplanes[2, 2] = 0; // скорость
	global.eggplanes[2, 3] = global.eggplanedata[global.eggplanes[2, 0], 12]; // место для десанта
	global.eggplanes[2, 4] = global.eggplanedata[global.eggplanes[2, 0], 13]; // место для груза
	global.eggplanes[2, 5] = 11; // оружие 1
	global.eggplanes[2, 6] = global.airweapon[11, 2]; // БК оружия 1
	global.eggplanes[2, 7] = 10; // оружие 2
	global.eggplanes[2, 8] = global.airweapon[10, 2]; // БК оружия 2
	global.eggplanes[2, 9] = global.eggplanedata[global.eggplanes[2, 0], 4]; // оружие 3
	global.eggplanes[2, 10] = 0; // БК оружия 3
	global.eggplanes[2, 11] = 0; // Статус (0 - перемещение, 1 - патруль, 2 - перехват, 3 - бомбардировка)
	global.eggplanes[2, 12] = 1; // номер эскадрильи, 0 = на базе
	global.eggplanes[2, 13] = global.eggplanedata[global.eggplanes[2, 0], 0]; // название
	global.eggplanes[0, 0]++;
	global.eggplanes[3, 0] = 4; // индекс в eggplanedata, бомбардировщик
	global.eggplanes[3, 1] = global.eggplanedata[global.eggplanes[3, 0], 1]; // хп
	global.eggplanes[3, 2] = 0; // скорость
	global.eggplanes[3, 3] = global.eggplanedata[global.eggplanes[3, 0], 12]; // место для десанта
	global.eggplanes[3, 4] = global.eggplanedata[global.eggplanes[3, 0], 13]; // место для груза
	global.eggplanes[3, 5] = -1; // оружие 1
	global.eggplanes[3, 6] = global.airweapon[11, 2]; // БК оружия 1
	global.eggplanes[3, 7] = -1; // оружие 2
	global.eggplanes[3, 8] = global.airweapon[10, 2]; // БК оружия 2
	global.eggplanes[3, 9] = -1; // оружие 3
	global.eggplanes[3, 10] = 0; // БК оружия 3
	global.eggplanes[3, 11] = 0; // Статус (0 - перемещение, 1 - патруль, 2 - перехват, 3 - бомбардировка)
	global.eggplanes[3, 12] = 1; // номер эскадрильи, 0 = на базе
	global.eggplanes[3, 13] = global.eggplanedata[global.eggplanes[3, 0], 0]; // название
	global.eggplanes[0, 0]++;
	global.eggplanes[4, 0] = 3; // индекс в eggplanedata, перехватчик
	global.eggplanes[4, 1] = global.eggplanedata[global.eggplanes[4, 0], 1]; // хп
	global.eggplanes[4, 2] = 0; // скорость
	global.eggplanes[4, 3] = global.eggplanedata[global.eggplanes[4, 0], 12]; // место для десанта
	global.eggplanes[4, 4] = global.eggplanedata[global.eggplanes[4, 0], 13]; // место для груза
	global.eggplanes[4, 5] = 9; // оружие 1
	global.eggplanes[4, 6] = global.airweapon[9, 2]; // БК оружия 1
	global.eggplanes[4, 7] = -1; // оружие 2
	global.eggplanes[4, 8] = 0; // БК оружия 2
	global.eggplanes[4, 9] = -1; // оружие 3
	global.eggplanes[4, 10] = 0; // БК оружия 3
	global.eggplanes[4, 11] = 0; // Статус (0 - перемещение, 1 - патруль, 2 - перехват, 3 - бомбардировка)
	global.eggplanes[4, 12] = 1; // номер эскадрильи, 0 = на базе
	global.eggplanes[4, 13] = global.eggplanedata[global.eggplanes[4, 0], 0]; // название
	global.eggplanes[0, 0]++;
	global.eggplanes[5, 0] = 6; // индекс в eggplanedata, транспорт
	global.eggplanes[5, 1] = global.eggplanedata[global.eggplanes[5, 0], 1]; // хп
	global.eggplanes[5, 2] = 0; // скорость
	global.eggplanes[5, 3] = global.eggplanedata[global.eggplanes[5, 0], 12]; // место для десанта
	global.eggplanes[5, 4] = global.eggplanedata[global.eggplanes[5, 0], 13]; // место для груза
	global.eggplanes[5, 5] = -1; // оружие 1
	global.eggplanes[5, 6] = global.airweapon[11, 2]; // БК оружия 1
	global.eggplanes[5, 7] = -1; // оружие 2
	global.eggplanes[5, 8] = 0; // БК оружия 2
	global.eggplanes[5, 9] = -1; // оружие 3
	global.eggplanes[5, 10] = 0; // БК оружия 3
	global.eggplanes[5, 11] = 0; // Статус (0 - перемещение, 1 - патруль, 2 - перехват, 3 - бомбардировка)
	global.eggplanes[5, 12] = 1; // номер эскадрильи, 0 = на базе
	global.eggplanes[5, 13] = global.eggplanedata[global.eggplanes[5, 0], 0]; // название
	global.eggplanes[0, 0]++;
	global.eggplanes[6, 0] = 5; // индекс в eggplanedata, штурмовик
	global.eggplanes[6, 1] = global.eggplanedata[global.eggplanes[6, 0], 1]; // хп
	global.eggplanes[6, 2] = 0; // скорость
	global.eggplanes[6, 3] = global.eggplanedata[global.eggplanes[6, 0], 12]; // место для десанта
	global.eggplanes[6, 4] = global.eggplanedata[global.eggplanes[6, 0], 13]; // место для груза
	global.eggplanes[6, 5] = 11; // оружие 1
	global.eggplanes[6, 6] = global.airweapon[11, 2]; // БК оружия 1
	global.eggplanes[6, 7] = -1; // оружие 2
	global.eggplanes[6, 8] = 0; // БК оружия 2
	global.eggplanes[6, 9] = -1; // оружие 3
	global.eggplanes[6, 10] = 0; // БК оружия 3
	global.eggplanes[6, 11] = 0; // Статус (0 - перемещение, 1 - патруль, 2 - перехват, 3 - бомбардировка)
	global.eggplanes[6, 12] = 1; // номер эскадрильи, 0 = на базе
	global.eggplanes[6, 13] = global.eggplanedata[global.eggplanes[6, 0], 0]; // название
	global.eggplanes[0, 0]++;

	///////////////////////////

	global.team[0, 0] = 0; // количество
	global.team[1, 0] = 5; // индекс транспортника
	global.team[1, 1] = global.txt141; // имя
	global.team[1, 2] = "sonic"; // тип
	global.team[1, 3] = ""; // оружие
	global.team[1, 4] = global.sonicsmaxhp; // хп
	global.team[1, 5] = global.sonicsmaxhp; // макс. хп
	global.team[1, 6] = 0; // опыт
	global.team[0, 0]++;
	global.team[2, 0] = 5;
	global.team[2, 1] = global.txt142;
	global.team[2, 2] = "tails";
	global.team[2, 3] = "";
	global.team[2, 4] = global.tailsmaxhp;
	global.team[2, 5] = global.tailsmaxhp;
	global.team[2, 6] = 0;
	global.team[0, 0]++;
	global.team[3, 0] = 5;
	global.team[3, 1] = global.txt143;
	global.team[3, 2] = "amy";
	global.team[3, 3] = "";
	global.team[3, 4] = global.amymaxhp;
	global.team[3, 5] = global.amymaxhp;
	global.team[3, 6] = 0;
	global.team[0, 0]++;
	global.team[4, 0] = 5;
	global.team[4, 1] = global.txt144;
	global.team[4, 2] = "rouge";
	global.team[4, 3] = "";
	global.team[4, 4] = global.rougemaxhp;
	global.team[4, 5] = global.rougemaxhp;
	global.team[4, 6] = 0;
	global.team[0, 0]++;
	global.team[5, 0] = 5;
	global.team[5, 1] = "Ветер Вьюгов";
	global.team[5, 2] = "snowman";
	global.team[5, 3] = "ak";
	global.team[5, 4] = global.snowmanmaxhp;
	global.team[5, 5] = global.snowmanmaxhp;
	global.team[5, 6] = 0;
	global.team[0, 0]++;
	global.team[6, 0] = 5;
	global.team[6, 1] = "Вьюгов Ветер";
	global.team[6, 2] = "snowman";
	global.team[6, 3] = "";
	global.team[6, 4] = global.snowmanmaxhp;
	global.team[6, 5] = global.snowmanmaxhp;
	global.team[6, 6] = 0;
	global.team[0, 0]++;
	global.team[7, 0] = 5;
	global.team[7, 1] = "Снег Морозов";
	global.team[7, 2] = "snowman";
	global.team[7, 3] = "laser";
	global.team[7, 4] = global.snowmanmaxhp;
	global.team[7, 5] = global.snowmanmaxhp;
	global.team[7, 6] = 0;
	global.team[0, 0]++;
	global.team[8, 0] = 5;
	global.team[8, 1] = global.txt145;
	global.team[8, 2] = "silver";
	global.team[8, 3] = "";
	global.team[8, 4] = global.silvermaxhp;
	global.team[8, 5] = global.silvermaxhp;
	global.team[8, 6] = 0;
	global.team[0, 0]++;
	global.team[9, 0] = 5;
	global.team[9, 1] = global.txt146;
	global.team[9, 2] = "shadow";
	global.team[9, 3] = "";
	global.team[9, 4] = global.shadowmaxhp;
	global.team[9, 5] = global.shadowmaxhp;
	global.team[9, 6] = 0;
	global.team[0, 0]++;
	global.team[10, 0] = 5;
	global.team[10, 1] = global.txt147;
	global.team[10, 2] = "knuckles";
	global.team[10, 3] = "";
	global.team[10, 4] = global.knucklesmaxhp;
	global.team[10, 5] = global.knucklesmaxhp;
	global.team[10, 6] = 0;
	global.team[0, 0]++;

	global.eggteam[0, 0] = 0; // количество в массиве
	global.eggteam[1, 0] = 1; // индекс транспортника
	global.eggteam[1, 1] = 2; // численность
	global.eggteam[1, 2] = "metalson"; // тип
	global.eggteam[0, 0]++;
	global.eggteam[2, 0] = 1; // индекс транспортника
	global.eggteam[2, 1] = 2; // численность
	global.eggteam[2, 2] = "pawn"; // тип
	global.eggteam[0, 0]++;

	global.santateam[0, 0] = 0; // количество в массиве
	global.santateam[1, 0] = 1; // индекс транспортника
	global.santateam[1, 1] = 1; // численность
	global.santateam[0, 0]++;

}
