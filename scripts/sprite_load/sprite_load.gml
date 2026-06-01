function sprite_load() {
	s = "ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭ/ЯЧСМИТЬБЮ,йцукенгшщзхъфывапролджэ\\ячсмитьбю.0123456789qwertyuiop[]asdfghjkl;'\\zxcvbnm,./QWERTYUIOP{}ASDFGHJKL:|ZXCVBNM<>?!@#$%^&*()-=_!№;%:?*()"
	// загрузка героев;
	hero_names[0] = "Капитан манишка";
	hero_names[1] = "Летучий мышеплюх";
	hero_names[2] = "Майор Фыр-Фыр";
	hero_names[3] = "Наклз ехидна";
	hero_names[4] = "Неслух звуковой ёж";
	hero_names[5] = "Рыжий пушистый лисохвост";
	hero_names[6] = "Снегопризывник (без оружия)";
	hero_names[7] = "Теневой ёж";
	//for (i = 0; i < 1; i++) //8
	//{
	path = "Солдаты\\";
	path += "Рыжий пушистый лисохвост";
	path += "\\Справа"
	path += "\\Бежит"
	sprite = file_find_first(path + "\\*.png", 0);
	global.tails_run_right = sprite_add(path + "\\" + string(sprite), 0, false, true, 0, 0)
	i1 = 0;
	for (sprite = file_find_next(); sprite != ""; sprite = file_find_next())
	{
	i1++;
	global.tails_run_right = sprite_add(path + "\\" + string(sprite), i1, false, true, 0, 0);
	}
	file_find_close();


	//}



}
