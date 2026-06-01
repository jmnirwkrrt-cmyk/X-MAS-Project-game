function onmap_buildings() {
	global.onmapbuilding[0, 0] = 0;
	global.onmapbuilding[1, 0] = global.txt174; // название, база
	global.onmapbuilding[1, 1] = 0; // радиус радара
	global.onmapbuilding[1, 2] = 0; // время строительства
	global.onmapbuilding[1, 3] = 0; // радиус ПВО
	global.onmapbuilding[1, 4] = 0; // цена
	global.onmapbuilding[0, 0]++;
	global.onmapbuilding[2, 0] = global.txt167; // название, РЛС
	global.onmapbuilding[2, 1] = global.oneradar; // радиус радара
	global.onmapbuilding[2, 2] = 172800; // время строительства
	global.onmapbuilding[2, 3] = 0; // радиус ПВО
	global.onmapbuilding[2, 4] = 250000; // цена
	global.onmapbuilding[0, 0]++;
	global.onmapbuilding[3, 0] = global.txt168; // название, ЗРК
	global.onmapbuilding[3, 1] = 0; // радиус радара
	global.onmapbuilding[3, 2] = 129600; // время строительства
	global.onmapbuilding[3, 3] = global.samrange; // радиус ПВО
	global.onmapbuilding[3, 4] = 250000; // цена
	global.onmapbuilding[0, 0]++;
	global.onmapbuilding[4, 0] = global.txt169; // название, завод
	global.onmapbuilding[4, 1] = 0; // радиус радара
	global.onmapbuilding[4, 2] = 259200; // время строительства
	global.onmapbuilding[4, 3] = 0; // радиус ПВО
	global.onmapbuilding[4, 4] = 1000000; // цена

	global.escortplayer[0, 0] = 0;
	//global.escortplayer[1, 0] - число самолётов
	//global.escortplayer[1, 1] - макс. скорость
	//global.escortplayer[1, 2] - топливо (берётся мин. топливо среди самолей)
	//global.escortplayer[1, 3] - дальность радара (берётся макс. дальность)
	//global.escortplayer[1, 4] - номер самолёта 1 (остальные идут дальше)
	//global.escortplayer[0, 0]++
	global.escortfoe[0, 0] = 0;
	global.escortally[0, 0] = 0;



}
