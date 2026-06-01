function planes_and_infantry() {
	global.planes[0, 0] = 0; // число самолётов
	global.planes[1, 0] = 7; // индекс в planedata, Скаут
	global.planes[1, 1] = global.planedata[global.planes[1, 0], 5]; // топливо
	global.planes[1, 2] = global.planedata[global.planes[1, 0], 1]; // хп
	global.planes[1, 3] = 0; // скорость
	global.planes[1, 4] = global.planedata[global.planes[1, 0], 12]; // место для десанта
	global.planes[1, 5] = global.planedata[global.planes[1, 0], 13]; // место для груза
	global.planes[1, 6] = global.planedata[global.planes[1, 0], 2]; // оружие 1
	global.planes[1, 7] = 0; // БК оружия 1
	global.planes[1, 8] = global.planedata[global.planes[1, 0], 3]; // оружие 2
	global.planes[1, 9] = 0; // БК оружия 2
	global.planes[1, 10] = global.planedata[global.planes[1, 0], 4]; // оружие 3
	global.planes[1, 11] = 0; // БК оружия 3
	global.planes[1, 12] = 0; // Статус (0 - готов, 1 - ремонт, 2 - перезарядка, 3 - дозаправка)
	global.planes[1, 13] = 0; // Текущее время обслуживания
	global.planes[1, 14] = 0; // номер эскадрильи, 0 = на базе
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
	global.planes[2, 14] = 0; // номер эскадрильи, 0 = на базе
	global.planes[2, 15] = global.planedata[global.planes[2, 0], 0]; // название
	global.planes[2, 16] = 0; // гранат на борту
	global.planes[2, 17] = 0; // аптечек на борту
	global.planes[0, 0]++;
	
	global.eggplanes[0, 0] = 0;
	global.santaplanes[0, 0] = 0;


	/*
	global.eggplanes[0, 0] = 0; // число самолётов
	global.eggplanes[1, 0] = 1; // индекс в planedata, разведчик Е-104
	global.eggplanes[1, 1] = global.eggplanedata[global.eggplanes[1, 0], 1]; // хп
	global.eggplanes[1, 2] = 0; // скорость
	global.eggplanes[1, 3] = global.eggplanedata[global.eggplanes[1, 0], 12]; // место для десанта
	global.eggplanes[1, 4] = global.eggplanedata[global.eggplanes[1, 0], 13]; // место для груза
	global.eggplanes[1, 5] = global.eggplanedata[global.eggplanes[1, 0], 2]; // оружие 1
	global.eggplanes[1, 6] = 0; // БК оружия 1
	global.eggplanes[1, 7] = global.eggplanedata[global.eggplanes[1, 0], 3]; // оружие 2
	global.eggplanes[1, 8] = 0; // БК оружия 2
	global.eggplanes[1, 9] = global.eggplanedata[global.eggplanes[1, 0], 4]; // оружие 3
	global.eggplanes[1, 10] = 0; // БК оружия 3
	global.eggplanes[1, 11] = 0; // Статус (0 - перемещение, 1 - патруль, 2 - перехват, 3 - бомбардировка)
	global.eggplanes[1, 12] = 0; // номер эскадрильи, 0 = на базе
	global.eggplanes[1, 13] = global.eggplanedata[global.eggplanes[1, 0], 0]; // название
	global.eggplanes[0, 0]++;

	global.eggteam[0, 0] = 0; // количество
	global.eggteam[1, 0] = 0; // индекс транспортника
	global.eggteam[1, 1] = global.txt141; // имя
	global.eggteam[1, 2] = "sonic"; // тип
	global.eggteam[1, 3] = ""; // оружие
	global.eggteam[1, 4] = global.sonicsmaxhp; // хп
	global.eggteam[1, 5] = global.sonicsmaxhp; // макс. хп
	global.eggteam[0, 0]++;
	*/



	global.team[0, 0] = 0; // количество
	global.team[1, 0] = 0; // индекс транспортника
	global.team[1, 1] = global.txt141; // имя
	global.team[1, 2] = "sonic"; // тип
	global.team[1, 3] = ""; // оружие
	global.team[1, 4] = global.sonicsmaxhp; // хп
	global.team[1, 5] = global.sonicsmaxhp; // макс. хп
	global.team[1, 6] = 0; // опыт
	global.team[1, 7] = false; // нужна ли перезарядка
	global.team[0, 0]++;
	global.team[2, 0] = 0;
	global.team[2, 1] = global.txt142;
	global.team[2, 2] = "tails";
	global.team[2, 3] = "";
	global.team[2, 4] = global.tailsmaxhp;
	global.team[2, 5] = global.tailsmaxhp;
	global.team[2, 6] = 0;
	global.team[2, 7] = false; // нужна ли перезарядка
	global.team[0, 0]++;
	global.team[3, 0] = 0;
	global.team[3, 1] = global.txt143;
	global.team[3, 2] = "amy";
	global.team[3, 3] = "";
	global.team[3, 4] = global.amymaxhp;
	global.team[3, 5] = global.amymaxhp;
	global.team[3, 6] = 0;
	global.team[3, 7] = false; // нужна ли перезарядка
	global.team[0, 0]++;
	global.team[4, 0] = 0;
	global.team[4, 1] = global.txt144;
	global.team[4, 2] = "rouge";
	global.team[4, 3] = "";
	global.team[4, 4] = global.rougemaxhp;
	global.team[4, 5] = global.rougemaxhp;
	global.team[4, 6] = 0;
	global.team[4, 7] = false; // нужна ли перезарядка
	global.team[0, 0]++;
	global.team[5, 0] = 0;
	global.team[5, 1] = "Ветер Вьюгов";
	global.team[5, 2] = "snowman";
	global.team[5, 3] = "";
	global.team[5, 4] = global.snowmanmaxhp;
	global.team[5, 5] = global.snowmanmaxhp;
	global.team[5, 6] = 20;
	global.team[5, 7] = false; // нужна ли перезарядка
	global.team[0, 0]++;
	global.team[6, 0] = 0;
	global.team[6, 1] = "Вьюгов Ветер";
	global.team[6, 2] = "snowman";
	global.team[6, 3] = "";
	global.team[6, 4] = global.snowmanmaxhp;
	global.team[6, 5] = global.snowmanmaxhp;
	global.team[6, 6] = 20;
	global.team[6, 7] = false; // нужна ли перезарядка
	global.team[0, 0]++;
	global.team[7, 0] = 0;
	global.team[7, 1] = "Снег Морозов";
	global.team[7, 2] = "snowman";
	global.team[7, 3] = "";
	global.team[7, 4] = global.snowmanmaxhp;
	global.team[7, 5] = global.snowmanmaxhp;
	global.team[7, 6] = 20;
	global.team[7, 7] = false; // нужна ли перезарядка
	global.team[0, 0]++;
	global.team[8, 0] = 0;
	global.team[8, 1] = global.txt145;
	global.team[8, 2] = "silver";
	global.team[8, 3] = "";
	global.team[8, 4] = global.silvermaxhp;
	global.team[8, 5] = global.silvermaxhp;
	global.team[8, 6] = 0;
	global.team[8, 7] = false; // нужна ли перезарядка
	global.team[0, 0]++;
	global.team[9, 0] = 0;
	global.team[9, 1] = global.txt146;
	global.team[9, 2] = "shadow";
	global.team[9, 3] = "";
	global.team[9, 4] = global.shadowmaxhp;
	global.team[9, 5] = global.shadowmaxhp;
	global.team[9, 6] = 0;
	global.team[9, 7] = false; // нужна ли перезарядка
	global.team[0, 0]++;
	global.team[10, 0] = 0;
	global.team[10, 1] = global.txt147;
	global.team[10, 2] = "knuckles";
	global.team[10, 3] = "";
	global.team[10, 4] = global.knucklesmaxhp;
	global.team[10, 5] = global.knucklesmaxhp;
	global.team[10, 6] = 0;
	global.team[10, 7] = false; // нужна ли перезарядка
	global.team[0, 0]++;
	
	 var dt = date_current_datetime(); // 1-ое апреля
	 if (date_get_month(dt) == 4 && date_get_day(dt) == 1)
	 {
		global.team[1, 2] = global.txt1419;
		global.team[2, 2] = global.txt1429;
		global.team[3, 2] = global.txt1439;
		global.team[4, 2] = global.txt1449;
		global.team[8, 2] = global.txt1459;
		global.team[9, 2] = global.txt1469;
		global.team[10, 2] = global.txt1479;
	 }


	global.name[0, 0] = 0; // кол-во
	global.name[1, 0] = "Ветер"; // имя
	global.name[1, 1] = " Вьюгов"; // фамилия
	global.name[0, 0]++;
	global.name[2, 0] = "Снег"; // имя
	global.name[2, 1] = " Морозов"; // фамилия
	global.name[0, 0]++;
	global.name[3, 0] = "Метель"; // имя
	global.name[3, 1] = " Лёдов"; // фамилия
	global.name[0, 0]++;
	global.name[4, 0] = "Лёд"; // имя
	global.name[4, 1] = " Ветрович"; // фамилия
	global.name[0, 0]++;
	global.name[5, 0] = "Вьюга"; // имя
	global.name[5, 1] = " Ветров"; // фамилия
	global.name[0, 0]++;
	global.name[6, 0] = "Гололёд"; // имя
	global.name[6, 1] = " Снежнов"; // фамилия
	global.name[0, 0]++;
	global.name[7, 0] = "Снеговик"; // имя
	global.name[7, 1] = " Гололёдов"; // фамилия
	global.name[0, 0]++;
	global.name[8, 0] = "Свист"; // имя
	global.name[8, 1] = " Метлов"; // фамилия
	global.name[0, 0]++;
	global.name[9, 0] = "Тайфун"; // имя
	global.name[9, 1] = " Белов"; // фамилия
	global.name[0, 0]++;
	global.name[10, 0] = "Синий"; // имя
	global.name[10, 1] = "Аврорович"; // фамилия
	global.name[0, 0]++;
	global.name[11, 0] = "Сиян"; // имя
	global.name[11, 1] = " Радугов"; // фамилия
	global.name[0, 0]++;
	global.name[12, 0] = "Озноб"; // имя
	global.name[12, 1] = " Охлаждавич"; // фамилия
	global.name[0, 0]++;
	global.name[13, 0] = "Холод"; // имя
	global.name[13, 1] = " Замёрзов"; // фамилия
	global.name[0, 0]++;
	global.name[14, 0] = "Вода"; // имя
	global.name[14, 1] = " Сосульник"; // фамилия
	global.name[0, 0]++;
	global.name[15, 0] = "Ведроголовик"; // имя
	global.name[15, 1] = " Морковкин"; // фамилия
	global.name[0, 0]++;
	global.name[16, 0] = "Пуговка"; // имя
	global.name[16, 1] = " Веткович"; // фамилия
	global.name[0, 0]++;
	global.name[17, 0] = "Леденец"; // имя
	global.name[17, 1] = " Подаркович"; // фамилия
	global.name[0, 0]++;
	global.name[18, 0] = "Подарков"; // имя
	global.name[18, 1] = " Леденцович"; // фамилия
	global.name[0, 0]++;
	global.name[19, 0] = "Ветков"; // имя
	global.name[19, 1] = " Пуговкин"; // фамилия
	global.name[0, 0]++;



}
