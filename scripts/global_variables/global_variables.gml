/// @desc Function Description
function global_variables() {
	// text_ru запускать перед global_variables
	
	////////////////////
	//// Сохранения ////
	////////////////////
	
	global.game_loading = false; // для загрузки сохранения при заходе на карту мира
	global.game_autoloading = false; // для загрузки автосохранения при заходе на карту мира
	global.save_number = 1; // сохраняется отдельно вместе с настройками звука и языка
	// чтобы не стирать старые сохранения
	global.game_version = "1.1"; // версия игры, используется для записи и загрузки сохранений
	global.game_over = false; // окончена ли игра
	global.autosave = true; // делать ли автосохранение каждый игровой день
	global.skip_intro = false;
	
	///////////////////
	////   Читы   ////
	//////////////////
	global.debug = false; // режим отладки (читы и т.д.)
	if (!global.debug) randomize(); // при режиме отладки нужны повторяющиеся баги, верно?
	// F10 - спавн противника на карте (по очкам)
	// Shift + F10 - спавн противника на карте (транспорт, террор)
	// Alt + F10 - спавн противника на карте (истребитель, доминирование)
	// F10 + Shift - спавн противника (террор)
	// F10 + CTRL - спавн противника (стройка)
	// F10 + backspace - спавн противника (бомбардировка)
	// CTRL + F10 - спавн транспорта на карте и его падение
	// F10 + Enter - спавн бомбардировщика (атака городов)
	// F9 - спавн союзника
	// F8 - тестовый наземный бой
	// F7 - час++
	// F6 - счетчик потерянных изумрудов++
	// F5 - добавить очков противнику
	// F4 - очки противника -= 1000
	// F3 - день++
	// F2 - деньги += 1.000.000
	// F1 - добавить фотон
	// F12 - заспавнить босса

	///////////////////
	////   Общее  ////
	//////////////////

	global.click = false; // чтобы двойных кликов при строительстве избежать
	global.stock = 0; // макс. число вещей на базе
	global.onestock = 30; // вместительность одного склада
	global.maxciv = 0; // макс. число жителей на базе
	global.onebarrack = 30; // вместительность одной казармы
	global.currentciv = 0; // текущее число жителей на базе
	global.maxplanes = 0; // макс. самолётов на базе
	global.scientist = 10; // кол-во учёных на базе, в его число не входят занятые учёные, поэтому для проверок использовать надо вместе со сбором с технологий занятых
	global.engineers = 10; // кол-во инженеров на базе, в его число не входят занятые инженеры
	global.selectedmodule = 0;
	global.isbuild = true;
	global.final_battle_starts = false;
	
	global.objects_ids = 0; // растущий номер присваиваемый каждому объекту который может стать чей-то целью, первый объект должен иметь номер 1
	
	global.intros = true; // Проигрывать видеоролики во время игры?
	global.first_intercept = false; // Был ли первый перехват (для проигрывания запуска торнадо)
	global.is_minigame_unlocked = false;
	
	global.money = 3000000;
	global.money_weekly_gain = 1500000;
	global.service_paid = 0;
	
	global.workshopplace = 0; // место в мастерских
	global.laboratoryplace = 0; // место в лабораториях
	global.workshopone = 15; // место в одной мастерской
	global.laboratoryone = 15; // место в одной лаборатории
	global.scientistpower = 1.0; // коэффициент исследования умножаемый на число учёных
	global.engineerpower = 1.0; // коэффициент производства умножаемый на число инженеров
	global.AAdamage = 75; // урон установок ПВО на карте (включая ПВО базы)
	global.fuelbonus = 2000; // бонус к топливу от ПТБ
	global.soundvolume = 0.35;
	global.musicvolume = 0.35;
	global.voicevolume = 0.35;
	global.timespeed = 1;
	
	global.HQ_AA_damage = 600; // Урон одного ЗРК на базе при попытке высадки или бомбардировки
	global.HQ_AA_deviation = 150; // Разброс урона одного ЗРК на базе
	// Следующие 5 переменных умножаются на коэфф. сложности!
	global.chance_to_damage_module = 80; // Шанс повредить модуль на базе 0 - 100%
	global.rebuilt_module_time = 86400; // Время на восстановление модуля после повреждения
	global.rebuilt_module_deviation = 86400 / 2; // Разброс времени на восстановление модуля после повреждения
	global.chance_to_hit_neighboor = 50; // Шанс повредить соседний модуль (на все модули выше\ниже левее\правее)
	global.chance_to_hit_plane = 50; // Шанс уничтожить самолет при повреждении ангара, а не просто повредить его 
	
	
	global.fight = false;
	global.autofight = false;
	global.win = 0; // 1 - победа, -1 - поражение
	global.fight_sequence = array_create(0);
	
	global.can_decrypt_transmission = false; // разблокируется технологиями, позволяет видеть задачи и цели эскадрильи
	global.can_search_emeralds = false; // разблокируется технологиями, позволяет видеть места падения изумрудов
	global.operatives_can_die = true; // могут ли умирать оперативники, настройка сложности
	
	/////////////////////
	//   Карта мира    //
	/////////////////////
	
	global.min_cities_count = 2; // Минимальное число городов меньше которого быть не должно
	global.lost_cities_count = 0;
	
	global.eggbase_stage_1_radar_range = 300; // Дальность радара аванпоста базы Эггмана
	global.eggbase_stage_2_radar_range = 500; // Дальность радара крепости базы Эггмана
	
	global.min_ai_escort_speed = 500; // Скорость при девиации эскадрилий ИИ не будет падать ниже этой
	global.escort_speed_deviation_value = 500; // Минимальный и максимальный разброс скорости эскадрилий ИИ (умножать на 2)
	
	global.terror_counts = 0; // Просто число терроров
	global.enemy_base_counts = 0; // Просто число баз роботов
	
	global.max_santa_escorts_per_day = 5; // Максимум эскадрилий Санты за день
	global.max_santa_escorts_add_per_score = 0.0005; // Множитель максимума эскадрильи санты в зависимости от числа очков
	global.santa_upgraded_planes = false; // Заменять ли "Ветер" на "Пингвин"
	global.max_santa_planes_at_terror = 3; // Максимум самолетов Санты противостоящих террору (внимание: используется множитель сложности!)
	
	global.bombing_power_to_get_one_kill_chance = 300;
	global.bombing_power_kill_chance = 60;
	
	global.baseonmap = noone; // ссылка на базу
	
	global.mapsize = 50000; // масштаб карты полюса
	
	global.timed_text_removal = 86400 / 2; // время до удаления текстового события на карте
	global.timed_terror_removal = 86400 / 2; // время до удаления события, включая террор
	global.timed_emerald_removal = 86400; // время до удаления события выпадения изумруда
	
	global.passed_emeralds_counts = 0; // Количество пропущенных событий выпадения изумруда
	global.emerald_lost_count_to_invasion = 2; // Если пропустить столько событий выпадения изумруда,
	// то на карте мира заспавнится эскадрилья возмездия с копией мат. корабля мгновенно уничтожающая города и которую нужно сбить (сбитие обнуляет таймер изумрудов)
	global.emerald_starts_even_if_no_tech = true; // Изумруды начинают спавниться даже если нету технологии для их обнаружения
	global.emerald_hour_spawn_chance = 1; // Шанс спавна изумруда каждый час
	global.emerald_spawn_starting_day = 2; // С какого дня изумруды начинают спавниться
	global.emerald_spawn_started = false; // Начался ли спавн изумрудов (т.к. счетчик дней обнуляется)
	global.total_emerald_counts = 0; // Сколько всего выпало изумрудов за всю игру
	global.max_emeralds_counts = 4; // Сколько всего изумрудов может выпасть вообще
	
	global.reveal_chance_building = 15; // вероятность обнаружить строение каждые n секунд
	global.reveal_chance_base = 2; // вероятность обнаружить базу каждые n секунд 
	global.reveal_chance_air = 15; // вероятность обнаружить воздушную цель каждые n секунд 
	
	global.accident_rate = 520; // n секунд до следущего возможного инцидента
	
	global.ground_scan_rate = 60; // n секунд для обнаружения наземных целей
	global.air_scan_rate = 60; // n секунд для обнаружения воздушных целей
	global.sam_hit_rate = 45; // n секунд для атаки воздушных целей ЗРК
	
	global.samrange = 50; // радиус ПВО базы или ЗРК
	global.samchance = 50; // шанс попасть под удар ЗРК в течении n секунд
	
	global.radarrange = 0; // радиус радара базы
	global.oneradar = 100; // радиус одного радара
	global.radar_chance = 30; // шанс одного радара обнаружить цель в течении n секунд (наземными РЛС)
	global.maxradar = 600; // максимальный радиус радара
	
	global.factories = 0; // количество заводов игрушек на карте
	global.factiories_incoming = 15; // сколько очков дает завод раз в n секунд
	global.factories_incoming_rate = 60; // n секунд до следующей партии очков
	
	global.base_exists = false; // существует ли база

	/////////////////////
	//Уровень сложности//
	/////////////////////

	global.current_diff_mn = 1; // изменяемый множитель
	global.light_diff_mn = 0.5; // множитель на который изменять при легкой сложности
	global.normal_diff_mn = 1;
	global.heavy_diff_mn = 1.5;
	global.wait_if_target = true; // не удалять террор, если чья-то цель
	global.terror_can_be_bombed = true; // можно ли победить террор бомбардировками
	
	global.max_foe_count_per_day = 5; // максимальное число появляющихся эскадрилий противника за день, умножается на множитель сложности и добавочный коэффициент за день
	global.add_foe_count_per_day = 0;
	global.add_foe_count_per_day_coeff = 0.02 // global.add_foe_count_per_day += global.max_foe_count_per_day * global.add_foe_count_per_day_coeff

	////////////////////////
	//Появление противника//
	////////////////////////

	global.spawn_foe_enemy_delay = 30; // n минут
	global.spawn_foe_ally_delay = 40; // n минут
	global.spawn_chance_factor = 1; // шанс на появление противника в течении n минут;
	global.spawn_chance_score_factor = 0.008; // множитель шанса в зависимости от числа очков
	global.spawn_chance_each_plane_factor = 25; // множитель шанса появления каждого самолета в эскадрилье кроме одного
	// сейчас используется немного другая система определения численности эскадрильи в зависимости от числа очков
	global.spawn_chance_each_plane_score_factor = 0.05; // множитель шанса в зависимости от числа очков

	////////
	//Очки//
	////////

	global.xmas_score = 0;
	global.xmas_score_month = 0;

	global.xmas_score_for_success = 50; // бонус за каждый успех
	global.xmas_score_for_research = 5; // бонус за каждую открытую технологию
	global.xmas_score_for_building = 5; // бонус за каждую постройку
	global.xmas_score_for_loss = -75; // штраф за каждое поражение
	global.xmas_score_for_enemy_actions = -250; // штраф за каждую пропущенную операцию врага
	global.xmas_score_score_mn = 8.2; // очки * множитель + начальная ставка выплат

	global.enemy_score = 1;
	global.enemy_score_month = 0;

	global.enemy_score_gain_daily = 50;
	global.enemy_score_gain_daily_deviation = 100;
	global.enemy_score_gain_success = 100; // доп. очки за успешно выполненную задачу
	
	global.foe_destroy_foe_bonus_score = -75; // Бонус противнику за потерю эскадрильи в бою
	global.foe_destroy_xmas_bonus_score = 75; // Бонус xmas за уничтожение эскадрильи врага

	// союзные очки для эскадрилий

	global.score_to_ally_max_size = 14000;
	global.ally_escort_max_size = 10;
	global.ally_escort_min_size = 1;
	
	global.ally_score_to_modernization = 4500; // модернизация до пингвинов при наличии технологии
	global.ally_score_for_factories = 0;
	
	global.ally_score_to_intercept_task = 500;
	global.ally_score_to_transport_task = 250;
	global.ally_score_to_recon_task = 0;

	// вражеские очки для начала появления определенных заданий

	global.score_to_recon_task = 0;
	global.score_to_intercept_task = 500;
	global.score_to_strike_task = 1000;
	global.score_to_bomb_sites_task = 1500;
	global.score_to_retalation_task = 1000;
	global.score_to_terror_task = 300;
	global.score_to_build_base_task = 2000
	
	// вражеские очки для определения размера эскадрильи
	
	global.score_to_max_size = 16000;
	global.enemy_escort_max_size = 10;
	global.enemy_escort_min_size = 1;

	// вражеские очки для начала спавна определенных противников, так же начало наземных операций зависит от появления первого наземного врага
	global.score_to_recon_ship = 0;
	global.score_to_fighter = 500;
	global.score_to_interceptor = 2500;
	global.score_to_bomber = 1000;
	global.score_to_cas = 1500;
	global.score_to_transport = 300;

	global.score_to_bugs = 0;
	global.score_to_metal = 1000;
	global.score_to_pawn = 2000;
	global.score_to_ufo = 3500;

	////////////////////////
	// Время и экономика //
	///////////////////////

	global.enddate = 2022; // год поражения
	global.startyear = 2021;
	global.startmonth = 11;
	global.startday = 1;
	global.paid_freq = 7; // число дней между выплатами (на следующий день выплата)
	global.paid_start_size = 2000000; // стартовые финансы

	global.module_monthly_cost_mn = 0.2; // множитель на стоимость содержания модуля в качестве стоимости обслуживания
	global.plane_monthly_cost_mn = 0.25; // множитель на стоимость содержания самолёта в качестве стоимости обслуживания
	global.engineer_monthly_paid = 15000; // стоимость содержания за одного инженера
	global.scientist_monthly_paid = 25000; // стоимость содержания за одного ученого
	global.soldier_monthly_paid = 7000 // стоимость содержания за одного солдата

	global.speed_1 = 1 * 2;
	global.speed_2 = 4 * 2;
	global.speed_3 = 8 * 2;
	global.speed_4 = 16 * 2;

	///////////////////
	// Воздушный бой //
	///////////////////

	global.spd_div = 200; // делитель табличной скорости (карта авиации)
	global.range_mn = 2; // множитель дальности авиационного оружия на карте
	global.expl_mn = 2; // множитель радиуса взрыва авиационного оружия на карте
	global.roll_cooldown = 80; // перерыв между маневрами
	global.return_range = 10000;
	global.max_life_time_mn = 1.5; // множитель расстояния макс. дистанции после которого ракета может лететь по инерции не самоликвидируясь
	global.messages_life_time = 1000;

	global.XMAS_escort_onfight = 0; // эскадрилья, вступившая в бой
	global.EGG_escort_onfight = 0;
	global.SANTA_escort_onfight = 0;
	global.XMAS_squad_onfight = 0; // отряд, вступивший в бой
	global.EGG_squad_onfight = 0;
	global.SANTA_squad_onfight = 0; 
	
	global.module_hp = 100; // здоровье модуля 
	global.hit_module_probality = 80; // вероятность повредить модуль, а не только обшивку

	//////////////////
	///Наземный бой///
	//////////////////
	
	global.xp_gain_total = 0; // суммарно заработано опыта (для брифинга)
	global.killed_total = 0; // суммарно убито (для брифинга)
	global.loss_total = 0; // суммарно потеряно (для брифинга)
	global.trophies_total = 0; // суммарно добыто трофеев
	global.bonus_score_for_no_losses = 100;
	
	global.santa_will_support_next_assault = true;
	
	global.xp_per_kill = 0.15; // Опыт за одно убийство
	global.evacuation_zone_radius = 100; // Как близко надо быть к самолету для эвакуации
	global.emerald_search_radius = 100; // На каком расстоянии изумруд становится виден
	global.emerald_stage_radius = 150; // Величина радиусов силы сигнала (х1 - сильный, х2 - умеренный и т.д.)
	
	global.robotic_elevators_per_difficult_level = 2; // n - легко, n*2 - средний, n*3 - тяжелый 
	global.robotic_elevators_per_difficult_deviation = 1; // возможное отклонение в количестве +-
	global.robotic_elevators_timer = 750; // сколько времени до создания противника
	global.robotic_turrets_per_difficult_level = 1; // n - легко, n*2 - средний, n*3 - тяжелый 
	global.robotic_turrets_per_difficult_deviation = 1; // возможное отклонение в количестве +-
	
	global.survive_timer = 60 * 60 * 4; //4 сколько времени длятся карты на выживание (не более часа!)
	
	global.ground_battle_type = 1; // 1 - обычный бой, 2 - выживание, 3 - изумруд, 4 - атака базы, 5 - защита базы
	global.raycast_shoot_height = 40 // Высота оружия относительно текущего пола, т.е. бонус к высоте при стрельбе
	global.range_to_hit = 10;

	global.minigundamage = 30;
	global.rifledamage = 30; // дополнительно 10 пробития
	global.akdamage = 25;
	global.laserpistoldamage = 25;
	global.laserrifledamage = 40;

	global.menu = 0;
	global.pause = 0;


	global.tailsmaxhp = 80;
	global.amymaxhp = 150;
	global.sonicsmaxhp = 100;
	global.knucklesmaxhp = 150;
	global.rougemaxhp = 100;
	global.shadowmaxhp = 100;
	global.silvermaxhp = 100;
	global.snowmanmaxhp = 90;
	
	/* 
	Карты для наземных боёв
	ground/wall_sprite - спрайт пола/стены + индекс
	name - название
	terrain - почва
	turrets - могут ли быть турели на карте
	elevators - могут ли быть роболифты на карте
	min/max_buildings - сколько случайных построек может быть на карте
	buildings_type - тип построек который может быть (0 - иглу, 1 - домик, 2 - бочка, 3 - камень)
	min/max_pillar_count - сколько столбов на карте
	snow_probality - вероятность снега от 0 до 100
	arena_size - размер арены
	map_type - для какого режима карта: 1 - уничтожить всех, 2 - выживать в течении,
    3 - найти изумруд и съебаться, 4 - уничтожить лифты для роботов и всех остальных, 5 - выживать в течении (защита базы)
	*/
	global.levels = array_create(5);
	global.levels[0] = { name: "snowy_plains", wall_sprite: spr_walls, wall_index: 3, ground_sprite: spr_floors, ground_index: 1, terrain: spr_grounds, terrain_index: 1, turrets: false, elevators: false, min_building: 0, max_buildings: 3, buildings_type: 3, map_type: 1, min_pillar_count: 0, max_pillar_count: 10, snow_probality: 30, arena_size: 400 }
	global.levels[1] = { name: "our_base", wall_sprite: spr_walls, wall_index: 0, ground_sprite: spr_floors, ground_index: 0, terrain: spr_grounds, terrain_index: 0, turrets: true, elevators: false, min_building: 0, max_buildings: 6, buildings_type: 2, map_type: 5, min_pillar_count: 5, max_pillar_count: 20, snow_probality: 0, arena_size: 350 }
	global.levels[2] = { name: "their_base", wall_sprite: spr_walls, wall_index: 2, ground_sprite: spr_floors, ground_index: 0, terrain: spr_grounds, terrain_index: 5, turrets: true, elevators: true, min_building: 0, max_buildings: 6, buildings_type: 2, map_type: 4, min_pillar_count: 5, max_pillar_count: 20, snow_probality: 0, arena_size: 400 }
	global.levels[3] = { name: "attacked_city", wall_sprite: spr_walls, wall_index: 1, ground_sprite: spr_floors, ground_index: 1, terrain: spr_grounds, terrain_index: 1, turrets: false, elevators: false, min_building: 1, max_buildings: 5, buildings_type: 2, map_type: 2, min_pillar_count: 2, max_pillar_count: 15, snow_probality: 30, arena_size: 400 }
	global.levels[4] = { name: "snowy_hills", wall_sprite: spr_walls, wall_index: 3, ground_sprite: spr_floors, ground_index: 1, terrain: spr_grounds, terrain_index: 2, turrets: false, elevators: false, min_building: 0, max_buildings: 3, buildings_type: 3, map_type: 1, min_pillar_count: 3, max_pillar_count: 15, snow_probality: 30, arena_size: 500 }
	global.levels[5] = { name: "snowy_storm", wall_sprite: spr_walls, wall_index: 3, ground_sprite: spr_floors, ground_index: 1, terrain: spr_grounds, terrain_index: 4, turrets: false, elevators: false, min_building: 0, max_buildings: 2, buildings_type: 0, map_type: 3, min_pillar_count: 4, max_pillar_count: 8, snow_probality: 80, arena_size: 500 }
	
	
	//////////// Автобой
	
	// настройки автобоя
	global.range_autobattle_initial = 6000; // автобой начинается с этой дистанции
	global.range_autobattle_step = 250; // автобой рассчитывается пошагово, здесь указывается длина шага в бою
	global.range_reverse_step = 600; // когда дальность ниже нуля дальность получает это значение
	global.cannons_shot_size = 15; // число снарядов выпущенных за шаг автоматическими пушками
	global.missiles_shot_size = 1; // число ракет выпущенных за шаг
	global.laser_shot_size = 3; // число лучей выпущенных за шаг
	global.autobattle_max_rounds = 4; // максимальное число раундов (снижения дальности до 0) после которых бой завершается (например, нет боеприпасов у участников)
	global.avoid_coeff = 0.5; // коэффициент шанса на уклонение, умножается на значение уклонения
	
	// значение уклонения, которое означает снижение урона по самолету от 0% до 100% плюс в два раза меньший шанс избежать попадания вовсе
	global.x_01_power_value = 20; // Ветер
	global.x_02_power_value = 25; // Пингвин
	global.x_t_power_value = 35; // Торнадо
	global.x_03_power_value = 30; // Альбатрос
	global.x_04_power_value = 60; // Фотон
	global.x_MiG_power_value = 15; // МиГ
	
	global.x_scout_power_value = 0; // Скаут
	global.x_ranger_power_value = 15; // Рейнджер
	global.x_vortex_power_value = 25; // Вихрь
	
	global.egg_recon_power_value = 10; // разведчик
	global.egg_fighter_power_value = 25; // истребитель
	global.egg_interceptor_power_value = 75; // перехватчик
	global.egg_bomber_power_value = 60; // бомбардировщик
	global.egg_cas_power_value = 20; // штурмовик
	global.egg_transport_power_value = 60; // транспорт
	
	// ценность/мощность оружия на дальности в автобое (1 снаряд)
	
	global.avia_cannon_close_value = 10; // авиапушка
	global.avia_cannon_medium_value = 0;
	global.avia_cannon_long_value = 0;
	global.avia_cannon_damage_value = 10;
	
	global.advanced_avia_cannon_close_value = 20; // ул. авиапушка
	global.advanced_avia_cannon_medium_value = 0;
	global.advanced_avia_cannon_long_value = 0;
	global.advanced_avia_cannon_damage_value = 20;
	
	global.snegir_rocket_close_value = 80; // снегирь
	global.snegir_rocket_medium_value = 20;
	global.snegir_rocket_long_value = 0;
	global.snegir_rocket_damage_value = 80;
	
	global.stingray_rocket_close_value = 50; // скат
	global.stingray_rocket_medium_value = 100;
	global.stingray_rocket_long_value = 10;
	global.stingray_rocket_damage_value = 150;
	
	global.arrow_rocket_close_value = 10; // стрела
	global.arrow_rocket_medium_value = 50;
	global.arrow_rocket_long_value = 110;
	global.arrow_rocket_damage_value = 350;
	
	global.zealot_rocket_close_value = 100; // зилот
	global.zealot_rocket_medium_value = 200;
	global.zealot_rocket_long_value = 400;
	global.zealot_rocket_damage_value = 400;
	
	global.avalance_rocket_close_value = 0; // лавина
	global.avalance_rocket_medium_value = 0;
	global.avalance_rocket_long_value = 200;
	global.avalance_rocket_damage_value = 600;
	
	global.plasma_cannon_close_value = 150; // плазмопушка (простая)
	global.plasma_cannon_medium_value = 20;
	global.plasma_cannon_long_value = 0;
	global.plasma_cannon_damage_value = 20;
	
	global.elite_plasma_cannon_close_value = 200; // плазмопушка (элитная)
	global.elite_plasma_cannon_medium_value = 50;
	global.elite_plasma_cannon_long_value = 0;
	global.elite_plasma_cannon_damage_value = 30;
	
	global.plasma_rocket_close_value = 50; // плазморакеты
	global.plasma_rocket_medium_value = 100;
	global.plasma_rocket_long_value = 30;
	global.plasma_rocket_damage_value = 200;
	
	global.plasma_laser_close_value = 200; // плазмопулемет
	global.plasma_laser_medium_value = 200;
	global.plasma_laser_long_value = 0;
	global.plasma_laser_damage_value = 70;
	
	///////////
	

	//////////////////
	/////Строение/////
	//////////////////

	// первый элемент - число солдат в массиве
	// номер отряда, имя, тип, оружие (если снегопризывник), кол-во хп
	global.team[0, 0] = 0;
	global.eggteam[0, 0] = 0;
	global.santateam[0, 0] = 0;
	global.santateam[0, 0] = 0;
	global.basebuilding[0, 0] = 0; // "укороченная" версия присвоения значения в виде обозначения последнего элемента, увы, не присваивает значение каждому элементу
	global.basebuilding[1, 0] = "empty";
	global.basebuilding[2, 0] = "empty";
	global.basebuilding[3, 0] = "empty";
	global.basebuilding[4, 0] = "empty";
	global.basebuilding[5, 0] = "empty";
	global.basebuilding[6, 0] = "empty";
	global.basebuilding[7, 0] = "empty";
	global.basebuilding[8, 0] = "empty";
	global.basebuilding[9, 0] = "empty";
	global.basebuilding[10, 0] = "empty";
	global.basebuilding[11, 0] = "empty";
	global.basebuilding[12, 0] = "empty";
	global.basebuilding[13, 0] = "empty";
	global.basebuilding[14, 0] = "empty";
	global.basebuilding[15, 0] = "empty";
	global.basebuilding[16, 0] = "empty";
	global.basebuilding[17, 0] = "empty";
	global.basebuilding[18, 0] = "empty";
	global.basebuilding[19, 0] = "empty";
	global.basebuilding[20, 0] = "empty";
	global.basebuilding[21, 0] = "empty";
	global.basebuilding[22, 0] = "empty";
	global.basebuilding[23, 0] = "empty";
	global.basebuilding[24, 0] = "empty";
	global.basebuilding[25, 0] = "empty";
	global.basebuilding[26, 0] = "empty";
	global.basebuilding[27, 0] = "empty";
	global.basebuilding[28, 0] = "empty";
	global.basebuilding[29, 0] = "empty";
	global.basebuilding[30, 0] = "empty";
	global.basebuilding[31, 0] = "empty";
	global.basebuilding[32, 0] = "empty";
	global.basebuilding[33, 0] = "empty";
	global.basebuilding[34, 0] = "empty";
	global.basebuilding[35, 0] = "empty";
	global.basebuilding[36, 0] = "empty";
	global.basebuilding[0, 1] = 0;
	global.basebuilding[1, 1] = 0;
	global.basebuilding[2, 1] = 0;
	global.basebuilding[3, 1] = 0;
	global.basebuilding[4, 1] = 0;
	global.basebuilding[5, 1] = 0;
	global.basebuilding[6, 1] = 0;
	global.basebuilding[7, 1] = 0;
	global.basebuilding[8, 1] = 0;
	global.basebuilding[9, 1] = 0;
	global.basebuilding[10, 1] = 0;
	global.basebuilding[11, 1] = 0;
	global.basebuilding[12, 1] = 0;
	global.basebuilding[13, 1] = 0;
	global.basebuilding[14, 1] = 0;
	global.basebuilding[15, 1] = 0;
	global.basebuilding[16, 1] = 0;
	global.basebuilding[17, 1] = 0;
	global.basebuilding[18, 1] = 0;
	global.basebuilding[19, 1] = 0;
	global.basebuilding[20, 1] = 0;
	global.basebuilding[21, 1] = 0;
	global.basebuilding[22, 1] = 0;
	global.basebuilding[23, 1] = 0;
	global.basebuilding[24, 1] = 0;
	global.basebuilding[25, 1] = 0;
	global.basebuilding[26, 1] = 0;
	global.basebuilding[27, 1] = 0;
	global.basebuilding[28, 1] = 0;
	global.basebuilding[29, 1] = 0;
	global.basebuilding[30, 1] = 0;
	global.basebuilding[31, 1] = 0;
	global.basebuilding[32, 1] = 0;
	global.basebuilding[33, 1] = 0;
	global.basebuilding[34, 1] = 0;
	global.basebuilding[35, 1] = 0;
	global.basebuilding[36, 1] = 0;

	global.buildings[0, 0] = "barracks"; // тип модуля
	global.buildings[0, 1] = "true"; // изучен или нет
	global.buildings[0, 2] = 86400 * 3; // время строительства
	global.buildings[0, 3] = 150000; // стоимость
	global.buildings[0, 4] = 1; // размер
	global.buildings[1, 0] = "clinic"; // тип модуля
	global.buildings[1, 1] = "true"; // изучен или нет
	global.buildings[1, 2] = 86400 * 5; // время строительства
	global.buildings[1, 3] = 250000; // стоимость
	global.buildings[1, 4] = 1; // размер
	global.buildings[2, 0] = "laboratory"; // тип модуля
	global.buildings[2, 1] = "true"; // изучен или нет
	global.buildings[2, 2] = 86400 * 5; // время строительства
	global.buildings[2, 3] = 350000; // стоимость
	global.buildings[2, 4] = 1; // размер
	global.buildings[3, 0] = "lift"; // тип модуля
	global.buildings[3, 1] = "true"; // изучен или нет
	global.buildings[3, 2] = 86400; // время строительства
	global.buildings[3, 3] = 0; // стоимость
	global.buildings[3, 4] = 1; // размер
	global.buildings[4, 0] = "factory"; // тип модуля
	global.buildings[4, 1] = "true"; // изучен или нет
	global.buildings[4, 2] = 86400 * 6; // время строительства
	global.buildings[4, 3] = 300000; // стоимость
	global.buildings[4, 4] = 1; // размер
	global.buildings[5, 0] = "anti_air"; // тип модуля
	global.buildings[5, 1] = "true"; // изучен или нет
	global.buildings[5, 2] = 86400 * 3; // время строительства
	global.buildings[5, 3] = 200000; // стоимость
	global.buildings[5, 4] = 1; // размер
	global.buildings[6, 0] = "radar"; // тип модуля
	global.buildings[6, 1] = "true"; // изучен или нет
	global.buildings[6, 2] = 86400 * 4; // время строительства
	global.buildings[6, 3] = 250000; // стоимость
	global.buildings[6, 4] = 1; // размер
	global.buildings[7, 0] = "stockpile"; // тип модуля
	global.buildings[7, 1] = "true"; // изучен или нет
	global.buildings[7, 2] = 86400 * 2; // время строительства
	global.buildings[7, 3] = 100000; // стоимость
	global.buildings[7, 4] = 1; // размер
	global.buildings[8, 0] = "headquarters"; // тип модуля
	global.buildings[8, 1] = "true"; // изучен или нет
	global.buildings[8, 2] = 86400; // время строительства
	global.buildings[8, 3] = 0; // стоимость
	global.buildings[8, 4] = 1; // размер
	global.buildings[9, 0] = "hangar"; // тип модуля
	global.buildings[9, 1] = "true"; // изучен или нет
	global.buildings[9, 2] = 86400 * 3; // время строительства
	global.buildings[9, 3] = 150000; // стоимость
	global.buildings[9, 4] = 2; // размер
	global.buildings[10, 0] = "chaos_generator"; // тип модуля
	global.buildings[10, 1] = "false"; // изучен или нет
	global.buildings[10, 2] = 86400 * 3; // время строительства
	global.buildings[10, 3] = 500000; // стоимость
	global.buildings[10, 4] = 1; // размер

	global.buyable[0, 0] = 0; // число
	global.buyable[1, 0] = 1; // индекс в items
	global.buyable[1, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[2, 0] = 2; // индекс в items
	global.buyable[2, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[3, 0] = 37; // индекс в items
	global.buyable[3, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[4, 0] = 3; // индекс в items
	global.buyable[4, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[5, 0] = 4; // индекс в items
	global.buyable[5, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[6, 0] = 5; // индекс в items
	global.buyable[6, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[7, 0] = 6; // индекс в items
	global.buyable[7, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[8, 0] = 7; // индекс в items
	global.buyable[8, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[9, 0] = 8; // индекс в items
	global.buyable[9, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[10, 0] = 9; // индекс в items
	global.buyable[10, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[11, 0] = 10; // индекс в items
	global.buyable[11, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[12, 0] = 11; // индекс в items
	global.buyable[12, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[13, 0] = 12; // индекс в items
	global.buyable[13, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[14, 0] = 13; // индекс в items
	global.buyable[14, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[15, 0] = 14; // индекс в items
	global.buyable[15, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[16, 0] = 15; // индекс в items
	global.buyable[16, 1] = 0; // количество
	global.buyable[0, 0]++;
	global.buyable[17, 0] = 33; // индекс в items
	global.buyable[17, 1] = 0; // количество
	global.buyable[0, 0]++;

	global.itemsonway[0, 0] = 0; // число вещей
	//global.itemsonway[1, 0] - индекс в items
	//global.itemsonway[1, 1] - количество
	//global.itemsonway[1, 2] - время до приезда

	// -1 = 1 место в казармах, -2 = 1 место в ангаре
	global.items[0, 0] = 0; // число
	global.items[1, 0] = global.txt48; // автомат
	global.items[1, 1] = 650; // цена
	global.items[1, 2] = 0.1; // объём
	global.items[0, 0]++;
	global.items[2, 0] = global.txt49; // перехватчик
	global.items[2, 1] = 420000; // цена
	global.items[2, 2] = -2; // объём
	global.items[0, 0]++;
	global.items[3, 0] = global.txt50; // винтовка
	global.items[3, 1] = 700; // цена
	global.items[3, 2] = 0.1; // объём
	global.items[0, 0]++;
	global.items[4, 0] = global.txt51; // бк для автомата
	global.items[4, 1] = 400; // цена
	global.items[4, 2] = 0.05; // объём
	global.items[0, 0]++;
	global.items[5, 0] = global.txt52; // бк для винтовки
	global.items[5, 1] = 400; // цена
	global.items[5, 2] = 0.05; // объём
	global.items[0, 0]++;
	global.items[6, 0] = global.txt53; // граната
	global.items[6, 1] = 200; // цена
	global.items[6, 2] = 0.05; // объём
	global.items[0, 0]++;
	global.items[7, 0] = global.txt54; // снегопризывник
	global.items[7, 1] = 12000; // цена
	global.items[7, 2] = -1; // объём
	global.items[0, 0]++;
	global.items[8, 0] = global.txt55; // ученый
	global.items[8, 1] = 20000; // цена
	global.items[8, 2] = -1; // объём
	global.items[0, 0]++;
	global.items[9, 0] = global.txt56; // инженер
	global.items[9, 1] = 20000; // цена
	global.items[9, 2] = -1; // объём
	global.items[0, 0]++;
	global.items[10, 0] = global.txt57; // авиапушка
	global.items[10, 1] = 8000; // цена
	global.items[10, 2] = 2.0; // объём
	global.items[0, 0]++;
	global.items[11, 0] = global.txt58; // бк для авиапушки
	global.items[11, 1] = 1200; // цена
	global.items[11, 2] = 1.0; // объём
	global.items[0, 0]++;
	global.items[12, 0] = global.txt59; // снегирь
	global.items[12, 1] = 4000; // цена
	global.items[12, 2] = 0.5; // объём
	global.items[0, 0]++;
	global.items[13, 0] = global.txt60; // скат
	global.items[13, 1] = 8000; // цена
	global.items[13, 2] = 1.0; // объём
	global.items[0, 0]++;
	global.items[14, 0] = global.txt61; // стрела
	global.items[14, 1] = 12000; // цена
	global.items[14, 2] = 1.5; // объём
	global.items[0, 0]++;
	global.items[15, 0] = global.txt62; // авиабомба
	global.items[15, 1] = 3000; // цена
	global.items[15, 2] = 2.0; // объём
	global.items[0, 0]++;
	global.items[16, 0] = global.txt63; // Лазерная винтовка
	global.items[16, 1] = 5000; // цена
	global.items[16, 2] = 0.5; // объём
	global.items[0, 0]++;
	global.items[17, 0] = global.txt64; // Энергетический излучатель
	global.items[17, 1] = 22000; // цена
	global.items[17, 2] = 2.0; // объём
	global.items[0, 0]++;
	global.items[18, 0] = global.txt65; // Обломки мотожука
	global.items[18, 1] = 1000; // цена
	global.items[18, 2] = 1.25; // объём
	global.items[0, 0]++;
	global.items[19, 0] = global.txt66; // Обломки метал-соника
	global.items[19, 1] = 1500; // цена
	global.items[19, 2] = 1.25; // объём
	global.items[0, 0]++;
	global.items[20, 0] = global.txt67; // Обломки пешки
	global.items[20, 1] = 2000; // цена
	global.items[20, 2] = 1.5; // объём
	global.items[0, 0]++;
	global.items[21, 0] = global.txt68; // Обломки кибердиска
	global.items[21, 1] = 3000; // цена
	global.items[21, 2] = 2.0; // объём
	global.items[0, 0]++;
	global.items[22, 0] = global.txt69; // Обломки излучателя
	global.items[22, 1] = 15000; // цена
	global.items[22, 2] = 2.5; // объём
	global.items[0, 0]++;
	global.items[23, 0] = global.txt70; // Обломки турели
	global.items[23, 1] = 14000; // цена
	global.items[23, 2] = 1.5; // объём
	global.items[0, 0]++;
	global.items[24, 0] = global.txt71; // Лавина
	global.items[24, 1] = 20000; // цена
	global.items[24, 2] = 2.0; // объём
	global.items[0, 0]++;
	global.items[25, 0] = global.txt72; // Суперсплав
	global.items[25, 1] = 3000; // цена
	global.items[25, 2] = 0.25; // объём
	global.items[0, 0]++;
	global.items[26, 0] = global.txt74; // Т-02 Пингвин
	global.items[26, 1] = 700000; // цена
	global.items[26, 2] = -2; // объём
	global.items[0, 0]++;
	global.items[27, 0] = global.txt76; // Т-03 Альбатрос
	global.items[27, 1] = 821000; // цена
	global.items[27, 2] = -2; // объём
	global.items[0, 0]++;
	global.items[28, 0] = global.txt77; // Т-04Х Фотон
	global.items[28, 1] = 1100000; // цена
	global.items[28, 2] = -2; // объём
	global.items[0, 0]++;
	global.items[29, 0] = global.txt78; // МиГ-31
	global.items[29, 1] = 1500000; // цена
	global.items[29, 2] = -2; // объём
	global.items[0, 0]++;
	global.items[30, 0] = global.txt79; // СВВП Рейнджер
	global.items[30, 1] = 700000; // цена
	global.items[30, 2] = -2; // объём
	global.items[0, 0]++;
	global.items[31, 0] = global.txt80; // Конвертоплан Вихрь
	global.items[31, 1] = 1000000; // цена
	global.items[31, 2] = -2; // объём
	global.items[0, 0]++;
	global.items[32, 0] = global.txt106; // Аптечка
	global.items[32, 1] = 800; // цена
	global.items[32, 2] = 0.1; // объём
	global.items[0, 0]++;
	global.items[33, 0] = global.txt115; // Подвесной топливный бак
	global.items[33, 1] = 2000; // цена
	global.items[33, 2] = 1.5; // объём
	global.items[0, 0]++;
	global.items[34, 0] = global.txt195; // Турель
	global.items[34, 1] = 6000; // цена
	global.items[34, 2] = 1.5; // объём
	global.items[0, 0]++;
	global.items[35, 0] = global.txt408; // улучшенная авиапушка
	global.items[35, 1] = 18000; // цена
	global.items[35, 2] = 2.0; // объём
	global.items[0, 0]++;
	global.items[36, 0] = global.txt407; // зилот
	global.items[36, 1] = 30000; // цена
	global.items[36, 2] = 1.8; // объём
	global.items[0, 0]++;
	global.items[37, 0] = global.txt73; // Скаут
	global.items[37, 1] = 350000; // цена
	global.items[37, 2] = -2; // объём
	global.items[0, 0]++;
	global.items[38, 0] = global.txt451; // Ящик с чили-догами
	global.items[38, 1] = 500000; // цена
	global.items[38, 2] = 2; // объём
	global.items[0, 0]++;


	global.constructitem[0, 0] = 0;
	global.constructitem[1, 0] = 16; // индекс в items, лазерная винтовка
	global.constructitem[1, 1] = 0; // количество
	global.constructitem[1, 2] = 0; // время до завершения
	global.constructitem[1, 3] = 86400; // время
	global.constructitem[1, 4] = 4000; // цена производства
	global.constructitem[1, 5] = 1; // надо сплавов
	global.constructitem[1, 6] = 1; // надо излучателей
	global.constructitem[1, 7] = 0; // надо обломков излучателей
	global.constructitem[1, 8] = 0; // выделено инженеров
	global.constructitem[1, 9] = false; // доступно или нет
	global.constructitem[1, 10] = 0; // надо обломков мотожуков
	global.constructitem[1, 11] = 0; // надо обломков металов
	global.constructitem[1, 12] = 0; // надо обломков пешек
	global.constructitem[1, 13] = 0; // надо обломков танков
	global.constructitem[1, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[2, 0] = 17; // индекс в items, энерг. излучатель
	global.constructitem[2, 1] = 0; // количество
	global.constructitem[2, 2] = 0; // время до завершения
	global.constructitem[2, 3] = 129600; // время
	global.constructitem[2, 4] = 18000; // цена производства
	global.constructitem[2, 5] = 2; // надо сплавов
	global.constructitem[2, 6] = 0; // надо излучателей
	global.constructitem[2, 7] = 1; // надо обломков излучателей
	global.constructitem[2, 8] = 0; // выделено инженеров
	global.constructitem[2, 9] = false; // доступно или нет
	global.constructitem[2, 10] = 0; // надо обломков мотожуков
	global.constructitem[2, 11] = 0; // надо обломков металов
	global.constructitem[2, 12] = 0; // надо обломков пешек
	global.constructitem[2, 13] = 0; // надо обломков танков
	global.constructitem[2, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[3, 0] = 24; // индекс в items, ПКР "Лавина"
	global.constructitem[3, 1] = 0; // количество
	global.constructitem[3, 2] = 0; // время до завершения
	global.constructitem[3, 3] = 97200; // время
	global.constructitem[3, 4] = 18000; // цена производства
	global.constructitem[3, 5] = 1; // надо сплавов
	global.constructitem[3, 6] = 1; // надо излучателей
	global.constructitem[3, 7] = 0; // надо обломков излучателей
	global.constructitem[3, 8] = 0; // выделено инженеров
	global.constructitem[3, 9] = false; // доступно или нет
	global.constructitem[3, 10] = 0; // надо обломков мотожуков
	global.constructitem[3, 11] = 0; // надо обломков металов
	global.constructitem[3, 12] = 0; // надо обломков пешек
	global.constructitem[3, 13] = 0; // надо обломков танков
	global.constructitem[3, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[4, 0] = 25; // индекс в items, суперсплавы (переработка пешек)
	global.constructitem[4, 1] = 0; // количество
	global.constructitem[4, 2] = 0; // время до завершения
	global.constructitem[4, 3] = 86400 / 2; // время
	global.constructitem[4, 4] = 2500; // цена производства
	global.constructitem[4, 5] = 0; // надо сплавов
	global.constructitem[4, 6] = 0; // надо излучателей
	global.constructitem[4, 7] = 0; // надо обломков излучателей
	global.constructitem[4, 8] = 0; // выделено инженеров
	global.constructitem[4, 9] = false; // доступно или нет
	global.constructitem[4, 10] = 0; // надо обломков мотожуков
	global.constructitem[4, 11] = 0; // надо обломков металов
	global.constructitem[4, 12] = 1; // надо обломков пешек
	global.constructitem[4, 13] = 0; // надо обломков танков
	global.constructitem[4, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[5, 0] = 26; // индекс в items, пингвин
	global.constructitem[5, 1] = 0; // количество
	global.constructitem[5, 2] = 0; // время до завершения
	global.constructitem[5, 3] = 86400 * 6; // время
	global.constructitem[5, 4] = 500000; // цена производства
	global.constructitem[5, 5] = 0; // надо сплавов
	global.constructitem[5, 6] = 0; // надо излучателей
	global.constructitem[5, 7] = 0; // надо обломков излучателей
	global.constructitem[5, 8] = 0; // выделено инженеров
	global.constructitem[5, 9] = false; // доступно или нет
	global.constructitem[5, 10] = 0; // надо обломков мотожуков
	global.constructitem[5, 11] = 0; // надо обломков металов
	global.constructitem[5, 12] = 0; // надо обломков пешек
	global.constructitem[5, 13] = 0; // надо обломков танков
	global.constructitem[5, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[6, 0] = 27; // индекс в items, альбатрос
	global.constructitem[6, 1] = 0; // количество
	global.constructitem[6, 2] = 0; // время до завершения
	global.constructitem[6, 3] = 86400 * 7; // время
	global.constructitem[6, 4] = 600000; // цена производства
	global.constructitem[6, 5] = 15; // надо сплавов
	global.constructitem[6, 6] = 0; // надо излучателей
	global.constructitem[6, 7] = 0; // надо обломков излучателей
	global.constructitem[6, 8] = 0; // выделено инженеров
	global.constructitem[6, 9] = false; // доступно или нет
	global.constructitem[6, 10] = 0; // надо обломков мотожуков
	global.constructitem[6, 11] = 0; // надо обломков металов
	global.constructitem[6, 12] = 0; // надо обломков пешек
	global.constructitem[6, 13] = 0; // надо обломков танков
	global.constructitem[6, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[7, 0] = 28; // индекс в items, Фотон
	global.constructitem[7, 1] = 0; // количество
	global.constructitem[7, 2] = 0; // время до завершения
	global.constructitem[7, 3] = 86400 * 8; // время
	global.constructitem[7, 4] = 700000; // цена производства
	global.constructitem[7, 5] = 25; // надо сплавов
	global.constructitem[7, 6] = 2; // надо излучателей
	global.constructitem[7, 7] = 0; // надо обломков излучателей
	global.constructitem[7, 8] = 0; // выделено инженеров
	global.constructitem[7, 9] = false; // доступно или нет
	global.constructitem[7, 10] = 0; // надо обломков мотожуков
	global.constructitem[7, 11] = 0; // надо обломков металов
	global.constructitem[7, 12] = 0; // надо обломков пешек
	global.constructitem[7, 13] = 0; // надо обломков танков
	global.constructitem[7, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[8, 0] = 29; // индекс в items, МиГ-31
	global.constructitem[8, 1] = 0; // количество
	global.constructitem[8, 2] = 0; // время до завершения
	global.constructitem[8, 3] = 86400 * 8; // время
	global.constructitem[8, 4] = 1000000; // цена производства
	global.constructitem[8, 5] = 5; // надо сплавов
	global.constructitem[8, 6] = 0; // надо излучателей
	global.constructitem[8, 7] = 0; // надо обломков излучателей
	global.constructitem[8, 8] = 0; // выделено инженеров
	global.constructitem[8, 9] = false; // доступно или нет
	global.constructitem[8, 10] = 0; // надо обломков мотожуков
	global.constructitem[8, 11] = 0; // надо обломков металов
	global.constructitem[8, 12] = 0; // надо обломков пешек
	global.constructitem[8, 13] = 0; // надо обломков танков
	global.constructitem[8, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[9, 0] = 30; // индекс в items, Рейнджер
	global.constructitem[9, 1] = 0; // количество
	global.constructitem[9, 2] = 0; // время до завершения
	global.constructitem[9, 3] = 86400 * 8; // время
	global.constructitem[9, 4] = 550000; // цена производства
	global.constructitem[9, 5] = 20; // надо сплавов
	global.constructitem[9, 6] = 0; // надо излучателей
	global.constructitem[9, 7] = 0; // надо обломков излучателей
	global.constructitem[9, 8] = 0; // выделено инженеров
	global.constructitem[9, 9] = false; // доступно или нет
	global.constructitem[9, 10] = 0; // надо обломков мотожуков
	global.constructitem[9, 11] = 0; // надо обломков металов
	global.constructitem[9, 12] = 0; // надо обломков пешек
	global.constructitem[9, 13] = 0; // надо обломков танков
	global.constructitem[9, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[10, 0] = 31; // индекс в items, Вихрь
	global.constructitem[10, 1] = 0; // количество
	global.constructitem[10, 2] = 0; // время до завершения
	global.constructitem[10, 3] = 86400 * 10; // время
	global.constructitem[10, 4] = 720000; // цена производства
	global.constructitem[10, 5] = 40; // надо сплавов
	global.constructitem[10, 6] = 0; // надо излучателей
	global.constructitem[10, 7] = 0; // надо обломков излучателей
	global.constructitem[10, 8] = 0; // выделено инженеров
	global.constructitem[10, 9] = false; // доступно или нет
	global.constructitem[10, 10] = 0; // надо обломков мотожуков
	global.constructitem[10, 11] = 0; // надо обломков металов
	global.constructitem[10, 12] = 0; // надо обломков пешек
	global.constructitem[10, 13] = 0; // надо обломков танков
	global.constructitem[10, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[11, 0] = 32; // индекс в items, Аптечка
	global.constructitem[11, 1] = 0; // количество
	global.constructitem[11, 2] = 0; // время до завершения
	global.constructitem[11, 3] = 12400; // время
	global.constructitem[11, 4] = 700; // цена производства
	global.constructitem[11, 5] = 0; // надо сплавов
	global.constructitem[11, 6] = 0; // надо излучателей
	global.constructitem[11, 7] = 0; // надо обломков излучателей
	global.constructitem[11, 8] = 0; // выделено инженеров
	global.constructitem[11, 9] = false; // доступно или нет
	global.constructitem[11, 10] = 0; // надо обломков мотожуков
	global.constructitem[11, 11] = 0; // надо обломков металов
	global.constructitem[11, 12] = 0; // надо обломков пешек
	global.constructitem[11, 13] = 0; // надо обломков танков
	global.constructitem[11, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[12, 0] = 35; // индекс в items, Улучшенная авиапушка
	global.constructitem[12, 1] = 0; // количество
	global.constructitem[12, 2] = 0; // время до завершения
	global.constructitem[12, 3] = 52400; // время
	global.constructitem[12, 4] = 5000; // цена производства
	global.constructitem[12, 5] = 4; // надо сплавов
	global.constructitem[12, 6] = 0; // надо излучателей
	global.constructitem[12, 7] = 0; // надо обломков излучателей
	global.constructitem[12, 8] = 0; // выделено инженеров
	global.constructitem[12, 9] = false; // доступно или нет
	global.constructitem[12, 10] = 0; // надо обломков мотожуков
	global.constructitem[12, 11] = 0; // надо обломков металов
	global.constructitem[12, 12] = 0; // надо обломков пешек
	global.constructitem[12, 13] = 0; // надо обломков танков
	global.constructitem[12, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[13, 0] = 36; // индекс в items, Зилот
	global.constructitem[13, 1] = 0; // количество
	global.constructitem[13, 2] = 0; // время до завершения
	global.constructitem[13, 3] = 57200; // время
	global.constructitem[13, 4] = 10000; // цена производства
	global.constructitem[13, 5] = 0; // надо сплавов
	global.constructitem[13, 6] = 0; // надо излучателей
	global.constructitem[13, 7] = 0; // надо обломков излучателей
	global.constructitem[13, 8] = 0; // выделено инженеров
	global.constructitem[13, 9] = false; // доступно или нет
	global.constructitem[13, 10] = 0; // надо обломков мотожуков
	global.constructitem[13, 11] = 0; // надо обломков металов
	global.constructitem[13, 12] = 0; // надо обломков пешек
	global.constructitem[13, 13] = 0; // надо обломков танков
	global.constructitem[13, 14] = 0; // надо обломков турелей
	global.constructitem[0, 0]++;
	global.constructitem[14, 0] = 34; // индекс в items, Турель
	global.constructitem[14, 1] = 0; // количество
	global.constructitem[14, 2] = 0; // время до завершения
	global.constructitem[14, 3] = 57200; // время
	global.constructitem[14, 4] = 10000; // цена производства
	global.constructitem[14, 5] = 1; // надо сплавов
	global.constructitem[14, 6] = 1; // надо излучателей
	global.constructitem[14, 7] = 0; // надо обломков излучателей
	global.constructitem[14, 8] = 0; // выделено инженеров
	global.constructitem[14, 9] = false; // доступно или нет
	global.constructitem[14, 10] = 0; // надо обломков мотожуков
	global.constructitem[14, 11] = 0; // надо обломков металов
	global.constructitem[14, 12] = 0; // надо обломков пешек
	global.constructitem[14, 13] = 0; // надо обломков танков
	global.constructitem[14, 14] = 1; // надо обломков турелей
	global.constructitem[0, 0]++;

	global.atstockpile[0, 0] = 0 // кол-во
	global.atstockpile[1, 0] = 1; // индекс в items
	global.atstockpile[1, 1] = 1; // кол-во на складе
	global.atstockpile[1, 2] = 0; // кол-во на продажу
	global.atstockpile[0, 0]++;
	global.atstockpile[2, 0] = 3; // индекс в items
	global.atstockpile[2, 1] = 2; // кол-во на складе
	global.atstockpile[2, 2] = 0; // кол-во на продажу
	global.atstockpile[0, 0]++;
	global.atstockpile[3, 0] = 4; // индекс в items
	global.atstockpile[3, 1] = 3; // кол-во на складе
	global.atstockpile[3, 2] = 0; // кол-во на продажу
	global.atstockpile[0, 0]++;
	global.atstockpile[4, 0] = 5; // индекс в items
	global.atstockpile[4, 1] = 3; // кол-во на складе
	global.atstockpile[4, 2] = 0; // кол-во на продажу
	global.atstockpile[0, 0]++;

	global.startbuilding[0] = 8;
	global.startbuilding[1] = "lift";
	global.startbuilding[2] = "barracks";
	global.startbuilding[3] = "laboratory";
	global.startbuilding[4] = "factory";
	global.startbuilding[5] = "headquarters";
	global.startbuilding[6] = "stockpile";
	global.startbuilding[7] = "hangar";
	global.startbuilding[8] = "radar";
	
	



}


