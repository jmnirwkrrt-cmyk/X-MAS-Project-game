function ufopedia() {
	
	/// Нумерация страниц уфопедии
	// 01 - Автоматическая штурмовая винтовка
	// 02 - Крупнокалиберная винтовка со скользящим затвором
	// 03 - Лучевая винтовка
	// 04 - Медпакет
	// 05 - Граната
	// 06 - Бланк 1
	// 07 - Бланк 2
	// 08 - Бланк 3
	// 09 - Бланк 4
	// 10 - Авиапушка
	// 11 - РВВ-МД "Снегирь"
	// 12 - РВВ-СД "Скат"
	// 13 - РВВ-БД "Стрела"
	// 14 - ПКР "Лавина"
	// 15 - Авиабомба
	// 16 - Подвесной топливный бак
	// 17 - Улучшенная авиапушка
	// 18 - РВВ БД Р-03 "Зилот"
	// 19 - Бортовой детектор изумрудов
	// 20 - Бланк 5
	// 21 - Бланк 6
	// 22 - Бланк 7
	// 23 - Лифт
	// 24 - Казарма
	// 25 - Лаборатория
	// 26 - Мастерская
	// 27 - Склад
	// 28 - Ангар
	// 29 - РЛС
	// 30 - Лазарет
	// 31 - ЗРК
	// 32 - Штаб
	// 33 - Модульные постройки
	// 34 - Хаос-резонатор
	// 35 - Бланк 8
	// 36 - Бланк 9
	// 37 - Бланк 10
	// 38 - Бланк 11
	// 39 - Бланк 12
	// 40 - "Х-Торнадо"
	// 41 - XI-1 "Ветер"
	// 42 - XI-2 "Пингвин"
	// 43 - XI-3 "Альбатрос"
	// 44 - XI-4 "Фотон"
	// 45 - XI-5 МиГ-31AXE "Полярный лис"
	// 46 - XT-1 "Скаут"
	// 47 - XT-2 СВВП "Рейнджер"
	// 48 - XT-3 конвертоплан "Вихрь"
	// 49 - E-104 (Разведчик)
	// 50 - E-140 (Истребитель)
	// 51 - E-201 (Перехватчик)
	// 52 - E-100 (Бомбардировщик)
	// 53 - E-150 (Штурмовик)
	// 54 - E-500 (Транспорт)
	// 55 - "Непревзойдённый" (Материнский корабль)
	// 56 - Соник Ёж
	// 57 - Майлз "Тейлз" Прауэр
	// 58 - Эми Роуз
	// 59 - Руж Летучая Мышь
	// 60 - Сильвер Ёж
	// 61 - Шэдоу Ёж
	// 62 - Снегопризывник
	// 63 - Наклз Ехидна
	// 64 - Металлический звук
	// 65 - Мотожук
	// 66 - Пешка
	// 67 - НЛО
	// 68 - Турель
	// 69 - Излучатель
	// 70 - Суперсплав
	// 71 - Шифрование передач Эггмана
	// 72 - Робототехника Эггмана
	// 73 - Окончательное решение проблемы
	// 74 - Лучевое энергооружие
	// 75 - Улучшенные методы обнаружения
	// 76 - Бланк 13
	// 77 - Бланк 14
	// 78 - Основы: строительство базы
	// 79 - Основы: проект X-MAS
	// 80 - Основы: обслуживание и использование авиации
	// 81 - Основы: карта мира
	// 82 - Основы: строительство на поверхности
	// 83 - Основы: солдаты
	// 84 - Основы: наземный бой
	// 85 - Основы: взаимодействие с армией Деда Мороза
	// 86 - Основы: воздушный бой
	global.wiki[0, 0] = 0;
	global.wiki[0, 0]++;
	// снаряга
	global.wiki[1, 0] = global.wikit1;
	global.wiki[1, 1] = global.wikit2;
	global.wiki[1, 2] = true;
	global.wiki[1, 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[1, 4] = 1; // индекс картинки
	global.wiki[0, 0]++ // 2
	global.wiki[global.wiki[0, 0], 0] = global.wikit3;
	global.wiki[global.wiki[0, 0], 1] = global.wikit4;
	global.wiki[global.wiki[0, 0], 2] = true; // доступен или нет
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка, 4 - бронь
	global.wiki[global.wiki[0, 0], 4] = 5;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit5;
	global.wiki[global.wiki[0, 0], 1] = global.wikit6;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 12;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit9;
	global.wiki[global.wiki[0, 0], 1] = global.wikit10;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 3;
	global.wiki[0, 0]++ // 5
	global.wiki[global.wiki[0, 0], 0] = global.wikit11;
	global.wiki[global.wiki[0, 0], 1] = global.wikit12;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 6;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 6;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 6;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 6;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 6;
	global.wiki[0, 0]++  // 10
	
	
	
	// авиаоружие
	global.wiki[global.wiki[0, 0], 0] = global.wikit7; // авиапушка
	global.wiki[global.wiki[0, 0], 1] = global.wikit8;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 0;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit13;
	global.wiki[global.wiki[0, 0], 1] = global.wikit14;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 18;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit15;
	global.wiki[global.wiki[0, 0], 1] = global.wikit16;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 16;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit17;
	global.wiki[global.wiki[0, 0], 1] = global.wikit18;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 19;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit19;
	global.wiki[global.wiki[0, 0], 1] = global.wikit20;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 10;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit21;
	global.wiki[global.wiki[0, 0], 1] = global.wikit22;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 4;
	global.wiki[0, 0]++  // 15
	global.wiki[global.wiki[0, 0], 0] = global.wikit23;
	global.wiki[global.wiki[0, 0], 1] = global.wikit24;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 23;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit115; // Улучшенная авиапушка
	global.wiki[global.wiki[0, 0], 1] = global.wikit116;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 21;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit113; // Зилот
	global.wiki[global.wiki[0, 0], 1] = global.wikit114;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit111; // Детектор изумрудов
	global.wiki[global.wiki[0, 0], 1] = global.wikit112;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 32;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 4;
	global.wiki[0, 0]++   // 20
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 4;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 4;
	global.wiki[0, 0]++
	
	
	
	
	// строения
	global.wiki[global.wiki[0, 0], 0] = global.wikit25;
	global.wiki[global.wiki[0, 0], 1] = global.wikit26;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 13;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit27;
	global.wiki[global.wiki[0, 0], 1] = global.wikit28;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 8;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit29;
	global.wiki[global.wiki[0, 0], 1] = global.wikit30;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 9;
	global.wiki[0, 0]++   // 25
	global.wiki[global.wiki[0, 0], 0] = global.wikit31;
	global.wiki[global.wiki[0, 0], 1] = global.wikit32;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 14;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit33;
	global.wiki[global.wiki[0, 0], 1] = global.wikit34;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 17;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit35;
	global.wiki[global.wiki[0, 0], 1] = global.wikit36;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 2;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit37;
	global.wiki[global.wiki[0, 0], 1] = global.wikit38;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 15;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit39;
	global.wiki[global.wiki[0, 0], 1] = global.wikit40;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 11;
	global.wiki[0, 0]++   // 30
	global.wiki[global.wiki[0, 0], 0] = global.wikit41;
	global.wiki[global.wiki[0, 0], 1] = global.wikit42
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 7;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit105;
	global.wiki[global.wiki[0, 0], 1] = global.wikit106;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 20;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit109; // Модульные постройки
	global.wiki[global.wiki[0, 0], 1] = global.wikit110;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 30;
	global.wiki[0, 0]++ // 33
	global.wiki[global.wiki[0, 0], 0] = global.wikit125; // Хаос-резонатор
	global.wiki[global.wiki[0, 0], 1] = global.wikit126;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 25;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 20;
	global.wiki[0, 0]++ // 35
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 20;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 20;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 20;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit1; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit1;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 20;
	global.wiki[0, 0]++
	
	
	
	
	// самолеты
	global.wiki[global.wiki[0, 0], 0] = global.wikit43;
	global.wiki[global.wiki[0, 0], 1] = global.wikit44;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 20;
	global.wiki[0, 0]++ // 40
	global.wiki[global.wiki[0, 0], 0] = global.wikit45;
	global.wiki[global.wiki[0, 0], 1] = global.wikit46;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 11;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit47;
	global.wiki[global.wiki[0, 0], 1] = global.wikit48;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 16;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit49;
	global.wiki[global.wiki[0, 0], 1] = global.wikit50;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 9;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit51;
	global.wiki[global.wiki[0, 0], 1] = global.wikit52;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 23;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit53;
	global.wiki[global.wiki[0, 0], 1] = global.wikit54;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 14;
	global.wiki[0, 0]++ // 45
	global.wiki[global.wiki[0, 0], 0] = global.wikit55;
	global.wiki[global.wiki[0, 0], 1] = global.wikit56;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 19;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit57;
	global.wiki[global.wiki[0, 0], 1] = global.wikit58;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 18;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit59;
	global.wiki[global.wiki[0, 0], 1] = global.wikit60;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 12;
	global.wiki[0, 0]++
	
	
	// робо-самолеты
	global.wiki[global.wiki[0, 0], 0] = global.wikit61;
	global.wiki[global.wiki[0, 0], 1] = global.wikit62;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 17;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit63;
	global.wiki[global.wiki[0, 0], 1] = global.wikit64;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 13;
	global.wiki[0, 0]++ // 50
	global.wiki[global.wiki[0, 0], 0] = global.wikit65;
	global.wiki[global.wiki[0, 0], 1] = global.wikit66;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 15;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit67;
	global.wiki[global.wiki[0, 0], 1] = global.wikit68;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 10;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit69;
	global.wiki[global.wiki[0, 0], 1] = global.wikit70;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 24;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit71;
	global.wiki[global.wiki[0, 0], 1] = global.wikit72;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 21;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit73;
	global.wiki[global.wiki[0, 0], 1] = global.wikit74;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = -1;
	global.wiki[0, 0]++
	
	// солдаты
	global.wiki[global.wiki[0, 0], 0] = global.wikit75;
	global.wiki[global.wiki[0, 0], 1] = global.wikit76;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 8;
	global.wiki[0, 0]++ // 55
	global.wiki[global.wiki[0, 0], 0] = global.wikit77;
	global.wiki[global.wiki[0, 0], 1] = global.wikit78;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 9;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit79;
	global.wiki[global.wiki[0, 0], 1] = global.wikit80;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 11;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit81;
	global.wiki[global.wiki[0, 0], 1] = global.wikit82;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 5;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit83;
	global.wiki[global.wiki[0, 0], 1] = global.wikit84;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 6;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit85;
	global.wiki[global.wiki[0, 0], 1] = global.wikit86;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 10;
	global.wiki[0, 0]++ // 60
	global.wiki[global.wiki[0, 0], 0] = global.wikit87;
	global.wiki[global.wiki[0, 0], 1] = global.wikit88;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 7;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit89;
	global.wiki[global.wiki[0, 0], 1] = global.wikit90;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 2;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit91;
	global.wiki[global.wiki[0, 0], 1] = global.wikit92;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 0;
	global.wiki[0, 0]++
	
	
	// роботы
	global.wiki[global.wiki[0, 0], 0] = global.wikit103;
	global.wiki[global.wiki[0, 0], 1] = global.wikit104;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 1;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit93;
	global.wiki[global.wiki[0, 0], 1] = global.wikit94;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 4;
	global.wiki[0, 0]++ // 65
	global.wiki[global.wiki[0, 0], 0] = global.wikit95;
	global.wiki[global.wiki[0, 0], 1] = global.wikit96;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 3;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit97;
	global.wiki[global.wiki[0, 0], 1] = global.wikit98;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 2; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 12;
	global.wiki[0, 0]++
	
	
	// инопланетные технологии
	global.wiki[global.wiki[0, 0], 0] = global.wikit99; // Излучатель Эггмана
	global.wiki[global.wiki[0, 0], 1] = global.wikit100;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 33;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit101; // Суперсплав Эггмана
	global.wiki[global.wiki[0, 0], 1] = global.wikit102;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 24;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit107; // Шифрование передач Эггмана
	global.wiki[global.wiki[0, 0], 1] = global.wikit108;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 31;
	global.wiki[0, 0]++ // 70
	global.wiki[global.wiki[0, 0], 0] = global.wikit119; // Робототехника Эггмана
	global.wiki[global.wiki[0, 0], 1] = global.wikit120;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 34;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit121; // Окончательное решение вопроса
	global.wiki[global.wiki[0, 0], 1] = global.wikit122;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit123; // Лучевое энергооружие: принципы
	global.wiki[global.wiki[0, 0], 1] = global.wikit124;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit117; // Улучшенные способы обнаружения
	global.wiki[global.wiki[0, 0], 1] = global.wikit118;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit109; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit110;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = -1;
	global.wiki[0, 0]++ // 75
	global.wiki[global.wiki[0, 0], 0] = global.wikit109; // бланк
	global.wiki[global.wiki[0, 0], 1] = global.wikit110;
	global.wiki[global.wiki[0, 0], 2] = false;
	global.wiki[global.wiki[0, 0], 3] = 3; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = -1;
	global.wiki[0, 0]++
	
	
	// Основы игры
	global.wiki[global.wiki[0, 0], 0] = global.wikit141; // Строительство базы
	global.wiki[global.wiki[0, 0], 1] = global.wikit142;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++ // 77
	global.wiki[global.wiki[0, 0], 0] = global.wikit143; // Ведение проекта X-MAS, его структура
	global.wiki[global.wiki[0, 0], 1] = global.wikit144;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit145; // Обслуживание и использование авиации
	global.wiki[global.wiki[0, 0], 1] = global.wikit146;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit147; // Уничтожение воздушных целей
	global.wiki[global.wiki[0, 0], 1] = global.wikit148;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++ // 80
	global.wiki[global.wiki[0, 0], 0] = global.wikit149; // Строительство на поверхности
	global.wiki[global.wiki[0, 0], 1] = global.wikit150;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit151; // Вооружение и опыт солдат, снаряжение, лечение
	global.wiki[global.wiki[0, 0], 1] = global.wikit152;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit153; // Наземный бой
	global.wiki[global.wiki[0, 0], 1] = global.wikit154;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit155; // Взаимодействие с армией Деда Мороза
	global.wiki[global.wiki[0, 0], 1] = global.wikit156;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++
	global.wiki[global.wiki[0, 0], 0] = global.wikit157; // Воздушный бой
	global.wiki[global.wiki[0, 0], 1] = global.wikit158;
	global.wiki[global.wiki[0, 0], 2] = true;
	global.wiki[global.wiki[0, 0], 3] = 1; // тип, 1 - крупная картинка, 2 - средняя картинка, 3 - маленькая картинка
	global.wiki[global.wiki[0, 0], 4] = 22;
	global.wiki[0, 0]++ // 85


}
