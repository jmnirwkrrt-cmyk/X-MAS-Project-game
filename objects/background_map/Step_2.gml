
if (skip_runs > 0) { skip_runs--; exit; }

/// @description Общее
/// [FORMAT] Весь код приведён к единому виду.
/// [FIX] Явные правки нейросети помечены комментариями [FIX].

instance_destroy(button_large_b_research);
instance_destroy(button_large_b_construct);
instance_destroy(button_large_b_exit);
instance_destroy(button_large_b_buy);
instance_destroy(button_large_memory);
instance_destroy(button_large_intercapply);

// ============================================================
// ОБЩЕЕ ПЕРЕКЛЮЧЕНИЕ ФОНА / НИЖНИХ КНОПОК
// ============================================================

if (type == 0) // [FIX] было type=0
{
    image_index = 0;
    but1 = instance_create(29, 828, button_large_b_research);
    but2 = instance_create(886, 828, button_large_b_exit);
}

if (type == 1 || type == 3) // [FIX] было type=1 or type=3
{
    image_index = 1;
    but1 = instance_create(29, 828, button_large_b_buy);
    but2 = instance_create(886, 828, button_large_b_exit);
}

if (type == 4) // [FIX] было type=4
{
    image_index = 4;

    if (instance_exists(background_line))
    {
        instance_destroy(background_line);
    }

    instance_create(0, 0, background_line_2o);

    but1 = instance_create(29, 828, button_large_b_construct);
    but2 = instance_create(886, 828, button_large_b_exit);
}

if (type == 2) // [FIX] было type=2
{
    image_index = 6;

    if (instance_exists(background_line))
    {
        instance_destroy(background_line);
    }

    instance_create(0, 0, background_line2);

    but1 = instance_create(886, 839, button_large_b_exit);
    but2 = instance_create(886, 839, button_large_b_exit);
}

// ============================================================
// ПРОИЗВОДСТВО
// ============================================================

if (type == 4) // [FIX] было type=4
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);
    instance_destroy(button_arrow_2);

    var i;
    cost = 0;

    for (i = 1; i <= global.constructitem[0, 0]; i++)
    {
        if (global.constructitem[i, 1] < 1) continue;
        cost += global.constructitem[i, 4] * global.constructitem[i, 1];
    }

    costtext = instance_create(50, 5, text_obj_white_28);
    costtext.txt = cost;
    costtext.txt = string_insert(global.txt85, costtext.txt, 0);
    costtext.w = 250;

    moneytext = instance_create(570, 5, text_obj_white_28);
    moneytext.txt = global.money;
    moneytext.txt = string_insert(global.txt84, moneytext.txt, 0);
    moneytext.w = 250;

    worktext = instance_create(310, 5, text_obj_white_28);
    worktext.txt = global.workshopplace;
    worktext.txt = string_insert(global.txt107, worktext.txt, 0);
    worktext.w = 250;

    worktext2 = instance_create(830, 5, text_obj_white_28);
    worktext2.txt = global.txt400 + string(global.engineers);
    worktext2.w = 250;

    var yt = 150;

    splav = 0;
    energo = 0;
    energyscrap = 0;
	motobugs = 0;
	metalsons = 0;
	egg_pawns = 0;
	cyberdiscs = 0;
	turrets = 0;

    for (i = 1; i <= global.atstockpile[0, 0]; i++)
    {
        if (global.atstockpile[i, 1] < 1) continue;

        if (global.atstockpile[i, 0] == 25) splav += global.atstockpile[i, 1]; // [FIX]
        if (global.atstockpile[i, 0] == 17) energo += global.atstockpile[i, 1]; // [FIX]
        if (global.atstockpile[i, 0] == 22) energyscrap += global.atstockpile[i, 1]; // [FIX]
		if (global.atstockpile[i, 0] == 18) motobugs += global.atstockpile[i, 1]; // [FIX]
		if (global.atstockpile[i, 0] == 19) metalsons += global.atstockpile[i, 1]; // [FIX]
		if (global.atstockpile[i, 0] == 20) egg_pawns += global.atstockpile[i, 1]; // [FIX]
		if (global.atstockpile[i, 0] == 21) cyberdiscs += global.atstockpile[i, 1]; // [FIX]
		if (global.atstockpile[i, 0] == 23) turrets += global.atstockpile[i, 1]; // [FIX]
    }

    for (i = 1; i <= global.constructitem[0, 0]; i++)
    {
        if (global.constructitem[i, 1] < 1)
        {
            global.engineers += global.constructitem[i, 8];
            global.workshopplace += global.constructitem[i, 8];
            global.constructitem[i, 8] = 0;
            continue;
        }

        txt = instance_create(100, yt, text_obj_white_28);
        txt.txt = global.items[global.constructitem[i, 0], 0];
        txt.w = 600;

        txt1 = instance_create(650, yt, text_obj_white_28);
        txt1.w = 250;

        if (global.money < global.constructitem[i, 4])
        {
            txt1.txt = global.txt100;
        }
        else if (
            (global.items[global.constructitem[i, 0], 2] > 0 && global.stock < global.items[global.constructitem[i, 0], 2]) ||
            (global.items[global.constructitem[i, 0], 2] == -1 && (global.maxciv - global.currentciv) < 1) || // [FIX]
            (global.items[global.constructitem[i, 0], 2] == -2 && global.maxplanes < 1) // [FIX]
        )
        {
            txt1.txt = global.txt101;
        }
        else if (global.constructitem[i, 5] > splav || (global.constructitem[i, 6] > energo && global.constructitem[i, 7] > energyscrap))
        {
            txt1.txt = global.txt99;
        }
        else
        {
            txt1.txt = global.txt98;
        }

        butt1 = instance_create(900, yt - 15, button_arrow_2);
        butt1.buy_index = i;

        butt2 = instance_create(1000, yt - 15, button_arrow_2);
        butt2.buy_index = i;
        butt2.image_xscale = -1;

        butt3 = instance_create(900, yt + 15, button_arrow_2);
        butt3.buy_index = i;
        butt3.tech_index = i;

        butt4 = instance_create(1000, yt + 15, button_arrow_2);
        butt4.buy_index = i;
        butt4.tech_index = i;
        butt4.image_xscale = -1;

        txt2 = instance_create(950, yt - 25, text_obj_white_28);
        txt2.txt = global.constructitem[i, 8];

        txt4 = instance_create(950, yt, text_obj_white_28);
        txt4.txt = global.constructitem[i, 1];

        txt3 = instance_create(1050, yt, text_obj_white_28);
        txt3.txt = global.constructitem[i, 2] / 3600 / (global.constructitem[i, 8] * global.engineerpower);
        txt3.txt = string_insert(global.txt103, txt3.txt, 0);

        yt += 150;
    }
}

// ============================================================
// СТАТИСТИКА БАЗЫ
// ============================================================

if (type == 2) // [FIX]
{
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_12);
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_red_28_left);
    instance_destroy(draw_bar);

    txt1 = instance_create(100, 32, text_obj_white_28); // свободное место на складах
    txt1.txt = global.txt90;

    bar1 = instance_create(700, 40, draw_bar);
    tx1 = instance_create(700, 10, text_obj_red_12);
    tx1.txt = global.stock;
    tx2 = instance_create(1100, 10, text_obj_red_12);
    bar1.minx = global.stock;

    maxstock = 0;
    maxciv = 0;
    maxplanes = 0;

    for (var i = 0; i < 37; i++)
    {
        if (global.basebuilding[i, 0] == "barracks") maxciv += global.onebarrack; // [FIX]
        if (global.basebuilding[i, 0] == "stockpile") maxstock += global.onestock; // [FIX]
        if (global.basebuilding[i, 0] == "hangar") maxplanes += 2; // [FIX]
    }

    tx2.txt = maxstock;
    bar1.maxx = maxstock;

    txt2 = instance_create(100, 32 + 70, text_obj_white_28); // свободное место в ангарах
    txt2.txt = global.txt91;

    bar2 = instance_create(700, 20 + 80, draw_bar);
    bar2.minx = global.maxplanes;
    bar2.maxx = maxplanes;

    tx3 = instance_create(700, 10 + 70, text_obj_red_12);
    tx3.txt = bar2.minx;

    tx4 = instance_create(1100, 10 + 70, text_obj_red_12);
    tx4.txt = bar2.maxx;

    txt3 = instance_create(100, 32 + 150, text_obj_white_28); // свободное место в казармах
    txt3.txt = global.txt92;

    bar3 = instance_create(700, 20 + 160, draw_bar);
    bar3.minx = global.maxciv - global.currentciv;
    bar3.maxx = maxciv;

    tx5 = instance_create(700, 10 + 150, text_obj_red_12);
    tx5.txt = bar3.minx;

    tx6 = instance_create(1100, 10 + 150, text_obj_red_12);
    tx6.txt = bar3.maxx;

    txt4 = instance_create(100, 32 + 230, text_obj_white_28); // расходы на обслуживание
    txt4.txt = global.txt93;

    bar4 = instance_create(700, 20 + 240, draw_bar);
    bar4.minx = global.service_paid;
    bar4.maxx = global.money_weekly_gain;

    tx5 = instance_create(700, 10 + 230, text_obj_red_12);
    tx5.txt = global.service_paid;

    tx6 = instance_create(1100, 10 + 230, text_obj_red_12);
    tx6.txt = bar4.maxx;
	
	txt5 = instance_create(100, 32 + 310, text_obj_white_28); // ожидаемый доход
    txt5.txt = global.txt416 + string(global.money_weekly_gain);
	
	txt6 = instance_create(100, 32 + 380, text_obj_white_28); // очков противника за прошлый месяц и сейчас
    txt6.txt = global.txt417;
	
	bar5 = instance_create(700, 20 + 385, draw_bar); 
    bar5.minx = global.enemy_score;
    bar5.maxx = global.score_to_max_size;

    tx7 = instance_create(700, 10 + 380, text_obj_red_12);
    tx7.txt = global.enemy_score;

    tx8 = instance_create(1100, 10 + 380, text_obj_red_12);
    tx8.txt = bar5.maxx;
	
	txt7 = instance_create(100, 32 + 450, text_obj_white_28); // наших очков
    txt7.txt = global.txt418;
	
	bar6 = instance_create(700, 20 + 465, draw_bar);
    bar6.minx = global.xmas_score;
    bar6.maxx = global.xmas_score_month;

    tx9 = instance_create(700, 10 + 450, text_obj_red_12);
    tx9.txt = global.xmas_score;

    tx10 = instance_create(1100, 10 + 450, text_obj_red_12);
    tx10.txt = bar6.maxx;
}

// ============================================================
// ПРОДАЖА / СНАРЯЖЕНИЕ
// ============================================================

if (type == 3 && !instance_exists(ask_question_b) && !instance_exists(ask_message)) // [FIX]
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_red_28_left);
    instance_destroy(button_arrow_2);

    var i;
    cost = 0;

    for (i = 1; i <= global.atstockpile[0, 0]; i++)
    {
        if (global.atstockpile[i, 1] < 1) continue;
        cost += global.items[global.atstockpile[i, 0], 1] * global.atstockpile[i, 2];
    }

    costtext = instance_create(50, 5, text_obj_red_28_left);
    costtext.txt = cost;
    costtext.txt = string_insert(global.txt85, costtext.txt, 0);
    costtext.w = 400;

    moneytext = instance_create(900, 5, text_obj_red_28_left);
    moneytext.txt = global.money;
    moneytext.txt = string_insert(global.txt84, moneytext.txt, 0);
    moneytext.w = 400;

    var yt = 70;

    for (i = 1; i <= global.atstockpile[0, 0]; i++)
    {
        if (global.atstockpile[i, 0] < 1 || global.atstockpile[i, 1] < 1) continue;

        txt = instance_create(100, yt, text_obj_red_28_left);
        txt.txt = global.items[global.atstockpile[i, 0], 0];
        txt.w = 800;

        butt1 = instance_create(900, yt + 22, button_arrow_2);
        butt1.buy_index = i;

        butt2 = instance_create(1000, yt + 22, button_arrow_2);
        butt2.buy_index = i;
        butt2.image_xscale = -1;

        txt2 = instance_create(950, yt, text_obj_red_28);
        txt2.txt = global.atstockpile[i, 2];

        yt += 30;
    }

    if (global.scientist > 0)
    {
        txt11 = instance_create(100, yt, text_obj_red_28_left);
        txt11.txt = global.txt55;
        txt11.w = 800;

        butt11 = instance_create(900, yt + 22, button_arrow_2);
        butt11.buy_index = -2;

        butt12 = instance_create(1000, yt + 22, button_arrow_2);
        butt12.buy_index = -2;
        butt12.image_xscale = -1;

        txt12 = instance_create(950, yt, text_obj_red_28);
        txt12.txt = amounts;

        yt += 30;
    }

    if (global.engineers > 0)
    {
        txt13 = instance_create(100, yt, text_obj_red_28_left);
        txt13.txt = global.txt56;
        txt13.w = 800;

        butt13 = instance_create(900, yt + 22, button_arrow_2);
        butt13.buy_index = -3;

        butt14 = instance_create(1000, yt + 22, button_arrow_2);
        butt14.buy_index = -3;
        butt14.image_xscale = -1;

        txt14 = instance_create(950, yt, text_obj_red_28);
        txt14.txt = amounte;

        yt += 30;
    }
}

// ============================================================
// ПОКУПКА
// ============================================================

if (type == 1 && !instance_exists(ask_question_b) && !instance_exists(ask_message)) // [FIX]
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_red_28_left);
    instance_destroy(button_arrow_2);

    var i;
    cost = 0;

    for (i = 1; i <= global.buyable[0, 0]; i++)
    {
        cost += global.items[global.buyable[i, 0], 1] * global.buyable[i, 1];
    }

    costtext = instance_create(100, 5, text_obj_red_28_left);
    costtext.txt = cost;
    costtext.txt = string_insert(global.txt85, costtext.txt, 0);
    costtext.w = 400;

    moneytext = instance_create(800, 5, text_obj_red_28_left);
    moneytext.txt = global.money;
    moneytext.txt = string_insert(global.txt84, moneytext.txt, 0);
    moneytext.w = 400;

    worktext = instance_create(450, 5, text_obj_red_28_left);
    stockneed = 0;

    for (i = 1; i <= global.buyable[0, 0]; i++)
    {
        if (global.items[global.buyable[i, 0], 2] > 0)
        {
            stockneed += global.items[global.buyable[i, 0], 2] * global.buyable[i, 1];
        }
    }

    worktext.txt = stockneed;
    worktext.txt = string_insert(global.txt114, worktext.txt, 0);
    worktext.w = 400;

    var yt = 70;

    for (i = 1; i <= global.buyable[0, 0]; i++)
    {
        sel = instance_create(0, yt, select_inmenu);
        if (instance_exists(sel)) sel.sprite_index = select_inmenu_black_S;

        txt = instance_create(100, yt, text_obj_red_28_left);
        txt.txt = global.items[global.buyable[i, 0], 0];
        txt.w = 800;

        butt1 = instance_create(900, yt + 22, button_arrow_2);
        butt1.buy_index = i;

        butt2 = instance_create(1000, yt + 22, button_arrow_2);
        butt2.buy_index = i;
        butt2.image_xscale = -1;

        txt2 = instance_create(950, yt, text_obj_red_28);
        txt2.txt = global.buyable[i, 1];

        yt += 30;
    }
}

// ============================================================
// ИССЛЕДОВАНИЯ
// ============================================================

if (!instance_exists(ask_techselect) && type == 0)
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_red_28_left);
    instance_destroy(button_arrow_2);

    var i;

    worktext = instance_create(100, 5, text_obj_red_28_left);
    worktext.txt = global.laboratoryplace;
    worktext.txt = string_insert(global.txt113, worktext.txt, 0);
    worktext.w = 500;

    worktext2 = instance_create(100 + 550, 5, text_obj_red_28_left);
    worktext2.txt = global.txt399 + string(global.scientist);
    worktext2.w = 500;

    var yt = 70;

    for (i = 1; i <= global.technologies[0, 0]; i++)
    {
        if (global.technologies[i, 4] > 0)
        {
            txt = instance_create(50, yt, text_obj_red_28_left);
            txt.txt = global.technologies[i, 0];
            txt.w = 700;

            butt1 = instance_create(750, yt + 22, button_arrow_2);
            butt1.tech_index = i;

            butt2 = instance_create(850, yt + 22, button_arrow_2);
            butt2.tech_index = i;
            butt2.image_xscale = -1;

            txt2 = instance_create(800, yt, text_obj_red_28);
            txt2.txt = global.technologies[i, 4];
            txt2.tindex = i;

            txt3 = instance_create(900, yt, text_obj_red_28_left);
            if (global.technologies[i, 3] > 86400 * 13) txt3.txt = global.txt401;
            else if (global.technologies[i, 3] > 86400 * 9) txt3.txt = global.txt402;
            else if (global.technologies[i, 3] > 86400 * 4) txt3.txt = global.txt403;
            else if (global.technologies[i, 3] > 86400 * 1) txt3.txt = global.txt404;
            else if (global.technologies[i, 3] > 0) txt3.txt = global.txt405;
            txt3.w = 320;

            yt += 60;
        }
    }
}

/// Самолёты и пехота

// ============================================================
// САМОЛЁТЫ
// ============================================================

if (type == 5) // [FIX]
{
    image_index = 2;
    but1 = instance_create(886, 828, button_large_b_exit);
    but2 = instance_create(886, 828, button_large_b_exit);
}

if (type == 5 && !instance_exists(ask_plane) && !instance_exists(ask_parent)) // [FIX]
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);
    instance_destroy(button_arrow_2);
    instance_destroy(button_large_b_planetth);
    instance_destroy(button_arrow_2I);

    var i;

    butx1 = instance_create(1000, 25, button_arrow_2I);
    butx2 = instance_create(1050, 25, button_arrow_2I);
    butx2.image_xscale = -1;

    worktext = instance_create(50, 5, text_obj_red_28_left);
    worktext.txt = global.maxplanes;
    worktext.txt = string_insert(global.txt91, worktext.txt, 0);
    worktext.w = 700;

    var yt = 70;
    var ax = 0;

    for (i = list; i <= global.planes[0, 0] && i <= list + maxonlist + ax; i++)
    {
        if (global.planes[i, 2] < 1 || global.planes[i, 14] != 0) // [FORMAT]
        {
            ax++;
            continue;
        }

        sel = instance_create(0, yt, select_inmenu);
        if (instance_exists(sel)) sel.sprite_index = select_inmenu_black_S;

        txt = instance_create(70, yt, text_obj_red_28_left);
        txt.txt = global.planes[i, 15];
        txt.w = 525;

        txt1 = instance_create(550, yt, text_obj_red_28_left);
        txt1.w = 350;

        if (global.planes[i, 12] == 0) txt1.txt = global.txt129; // [FIX]
        else if (global.planes[i, 12] == 1) txt1.txt = global.txt127; // [FIX]
        else if (global.planes[i, 12] == 2) txt1.txt = global.txt128; // [FIX]
        else if (global.planes[i, 12] == 3) txt1.txt = global.txt126; // [FIX]
        else if (global.planes[i, 12] == 4) txt1.txt = global.txt133; // [FIX]

        but1 = instance_create(750, yt - 10, button_large_b_planetth);
        but1.text.txt = global.txt134;
        but1.indx = i;

        txt3 = instance_create(1070, yt, text_obj_red_28_left);
        txt3.txt = global.planes[i, 13] / 3600;
        txt3.txt = string_insert(global.txt103, txt3.txt, 0);

        yt += 60;
    }
}

// ============================================================
// ПЕХОТА
// ============================================================

if (type == 6) // [FIX]
{
    image_index = 3;
    but1 = instance_create(29, 828, button_large_memory);
    but2 = instance_create(886, 828, button_large_b_exit);
}

if (type == 6 && !instance_exists(ask_inf) && !instance_exists(ask_parent)) // [FIX]
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);
    instance_destroy(button_arrow_2I);
    instance_destroy(button_large_b_infdesc);

    var i;

    worktext = instance_create(50, 5, text_obj_white_28);
    worktext.txt = global.maxciv - global.currentciv;
    worktext.txt = string_insert(global.txt151, worktext.txt, 0);
    worktext.w = 700;

    var yt = 70;

    butx1 = instance_create(1000, 25, button_arrow_2I);
    butx2 = instance_create(1050, 25, button_arrow_2I);
    butx2.image_xscale = -1;

    var ax = 0;

    for (i = list; i <= global.team[0, 0] && i <= list + maxonlist + ax; i++)
    {
        if (global.team[i, 4] <= 0)
        {
            ax++;
            continue;
        }

        sel = instance_create(0, yt, select_inmenu);
        if (instance_exists(sel)) sel.sprite_index = select_inmenu_black_S;

        txt = instance_create(70, yt, text_obj_white_28);
        txt.txt = global.team[i, 1];
        txt.w = 525;

        txt1 = instance_create(550, yt, text_obj_white_28);
        txt1.w = 350;

        if (global.team[i, 4] >= global.team[i, 5] && global.team[i, 0] == 0) txt1.txt = global.txt129;
        else if (global.team[i, 4] >= global.team[i, 5] && global.team[i, 0] != 0) txt1.txt = global.txt149;
        else txt1.txt = global.txt148;
		if (i == 8 && global.team[i, 4] < global.team[i, 5] && global.silver_apples) txt1.txt = global.txt446;

        but1 = instance_create(850, yt - 10, button_large_b_infdesc);
        but1.text.txt = global.txt134;
        but1.indx = i;

        yt += 60;
    }
}

// ============================================================
// МЕМОРИАЛ
// ============================================================

if (type == 7) // [FIX]
{
    image_index = 7;
    but1 = instance_create(29, 828, button_large_memory);
    but2 = instance_create(886, 828, button_large_b_exit);
}

if (type == 7 && !instance_exists(ask_inf) && !instance_exists(ask_parent)) // [FIX]
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);
    instance_destroy(button_arrow_2I);
    instance_destroy(button_large_b_infdesc);
    instance_destroy(select_inmenu);

    var i;

    worktext = instance_create(1200 / 2, 5, text_obj_white_28_c);
    worktext.txt = global.txt150;
    worktext.w = 700;

    var yt = 70;

    butx1 = instance_create(1000, 25, button_arrow_2I);
    butx2 = instance_create(1050, 25, button_arrow_2I);
    butx2.image_xscale = -1;

    var ax = 0;

    for (i = list; i <= global.team[0, 0] && i <= list + maxonlist + ax; i++)
    {
        if (global.team[i, 4] > 0)
        {
            ax++;
            continue;
        }

        sel = instance_create(0, yt, select_inmenu);
        if (instance_exists(sel)) sel.sprite_index = select_inmenu_black_S;

        txt = instance_create(70, yt, text_obj_white_28);
        txt.txt = global.team[i, 1];
        txt.w = 525;

        yt += 60;
    }
}

// ============================================================
// ПЕРЕХВАТЧИКИ / ЭСКАДРИЛЬИ
// ============================================================

if (type == 8) // [FIX]
{
    image_index = 8;
    but1 = instance_create(29, 828, button_large_intercapply);
    but2 = instance_create(886, 828, button_large_b_exit);
}

if (type == 8 && !instance_exists(ask_parent)) // [FIX]
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);

    var i;

    worktext = instance_create(1200 / 2, 5, text_obj_white_28_c);
    worktext.txt = global.txt176;
    worktext.w = 700;

    var yt = 70;

    butx1 = instance_create(1000, 25, button_arrow_2I);
    butx2 = instance_create(1050, 25, button_arrow_2I);
    butx2.image_xscale = -1;

    var ax = 0;

    for (i = list; i <= global.planes[0, 0] && i <= list + maxonlist + ax; i++)
    {
        if (global.planes[i, 2] < 1)
        {
            ax++;
            continue;
        }

        sel = instance_create(10, yt, select_inmenu);
        if (instance_exists(sel)) sel.indx = i;

        yt += 60;
    }

    yt = 70;
    ax = 0;

    for (i = list; i <= global.planes[0, 0] && i <= list + maxonlist + ax; i++)
    {
        if (global.planes[i, 2] < 1)
        {
            ax++;
            continue;
        }

        sel = instance_create(0, yt, select_inmenu);
        if (instance_exists(sel)) sel.sprite_index = select_inmenu_black_S;

        txt = instance_create(70, yt, text_obj_red_28_left);
        txt.txt = global.planes[i, 15];
        txt.w = 825;

        txt1 = instance_create(850, yt, text_obj_red_28_left);
        txt1.w = 350;

        if (global.planes[i, 14] < 1)
        {
            if (global.planes[i, 12] == 0) txt1.txt = global.txt129; // [FIX]
            else if (global.planes[i, 12] == -1) txt1.txt = global.txt11; // [FIX]
            else if (global.planes[i, 12] == 1) txt1.txt = global.txt127; // [FIX]
            else if (global.planes[i, 12] == 2) txt1.txt = global.txt128; // [FIX]
            else if (global.planes[i, 12] == 3) txt1.txt = global.txt126; // [FIX]
            else if (global.planes[i, 12] == 4) txt1.txt = global.txt133; // [FIX]
        }
        else
        {
            txt1.txt = global.txt411 + string(global.planes[i, 14]);
        }

        txt3 = instance_create(1070, yt, text_obj_red_28_left);
        txt3.txt = global.planes[i, 13] / 3600;
        txt3.txt = string_insert(global.txt103, txt3.txt, 0);

        yt += 60;
    }
}

/// Еженедельный отчёт

// ============================================================
// ЕЖЕНЕДЕЛЬНЫЙ ОТЧЁТ
// ============================================================

if (type == 9)
{
    image_index = 1;
    but1 = instance_create(1200 / 2 - 281 / 2, 828, button_large_b_exit);
}

if (type == 9 && !instance_exists(ask_parent))
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);

    instance_create(0, 0, background_line);

    var lost_cities_count = global.lost_cities_count;
    var funds = global.money;

    var headline = instance_create(1200 / 2, 5, text_obj_white_28_c);
    headline.txt = global.txt308;
    headline.w = 1000;

    var score_us = instance_create(70, 70, text_obj_white_28);
    score_us.txt = global.txt310 + string(global.xmas_score);
    score_us.w = 1000;

    var score_enemy = instance_create(70, 140, text_obj_white_28);
    score_enemy.txt = global.txt309 + string(global.enemy_score);
    score_enemy.w = 1000;

    var funds_has_been = instance_create(70, 210, text_obj_white_28);
    funds_has_been.txt = global.txt311 + string(funds);
    funds_has_been.w = 1000;

    var funds_got = instance_create(70, 280, text_obj_white_28);
    funds_got.txt = global.txt312 + string(global.money_weekly_gain);
    funds_got.w = 1000;

    var funds_to_service = instance_create(70, 350, text_obj_white_28);
    funds_to_service.txt = global.txt313 + string(global.service_paid);
    funds_to_service.w = 1000;

    var lost_cities = instance_create(70, 420, text_obj_white_28);
    lost_cities.txt = global.txt314 + string(lost_cities_count) + global.txt315;
    lost_cities.w = 1000;

    var desc = instance_create(70, 490, text_obj_white_28);
    if (global.xmas_score > global.enemy_score * 1.5)
    {
        desc.txt = global.txt318;
    }
    else
    {
        if (global.xmas_score >= global.enemy_score) desc.txt = global.txt316;
        else desc.txt = global.txt317;
    }
    desc.w = 1000;
}

/// Почта

// ============================================================
// ПОЧТА
// ============================================================

if (type == 10)
{
    image_index = 26;
    but1 = instance_create(1200 / 2 - 281 / 2, 828, button_large_b_exit);
}

if (type == 10 && !instance_exists(ask_parent))
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);
    instance_destroy(button_arrow_2I);

    worktext = instance_create(1200 / 2, 5, text_obj_white_28_c);
    worktext.txt = global.txt323;
    worktext.w = 700;

    var yt = 70;
    var i;

    butx1 = instance_create(1000, 25, button_arrow_2I);
    butx2 = instance_create(1050, 25, button_arrow_2I);
    butx2.image_xscale = -1;

    instance_destroy(button_large_b_mail);

    var ax = 0;

    if (opened_mail == 0)
    {
        var ordered_mails = array_create(0);
        var max_mail_order = -1;

        // 1) найти максимальный order среди доступных писем
        for (i = 1; i <= global.mail[0]; i++)
        {
            if (!global.mail[i].available) continue;

            if (global.mail[i].order_number > max_mail_order)
            {
                max_mail_order = global.mail[i].order_number;
            }
        }

        // 2) всем доступным письмам без order выдать order в конец очереди
        for (i = 1; i <= global.mail[0]; i++)
        {
            if (!global.mail[i].available) continue;
            if (global.mail[i].order_number != -1) continue;

            max_mail_order++;
            global.mail[i].order_number = max_mail_order;
        }

        // 3) собрать доступные письма
        for (i = 1; i <= global.mail[0]; i++)
        {
            if (!global.mail[i].available) continue;
            array_push(ordered_mails, i);
        }

        // 4) сортировка по order_number, при равенстве — по индексу письма
        for (var a = 1; a < array_length(ordered_mails); a++)
        {
            var key = ordered_mails[a];
            var key_order = global.mail[key].order_number;
            var b = a - 1;

            while (
                b >= 0
                && (
                    global.mail[ordered_mails[b]].order_number > key_order
                    || (
                        global.mail[ordered_mails[b]].order_number == key_order
                        && ordered_mails[b] > key
                    )
                )
            )
            {
                ordered_mails[b + 1] = ordered_mails[b];
                b--;
            }

            ordered_mails[b + 1] = key;
        }

        // 5) нормализовать order_number, чтобы дальше порядок не плыл
        for (i = 0; i < array_length(ordered_mails); i++)
        {
            global.mail[ordered_mails[i]].order_number = i;
        }

        but1.visible = true;
        but1.text.visible = true;

        for (i = list - 1; i < array_length(ordered_mails) && i <= list - 1 + maxonlist + ax; i++)
        {
            if (!instance_exists(instance_place(0, yt, select_inmenu)))
            {
                sel = instance_create(0, yt, select_inmenu);
                if (instance_exists(sel)) sel.sprite_index = select_inmenu_black_S;
            }

            var name = instance_create(70, yt, text_obj_red_28_left);
            name.txt = global.mail[ordered_mails[i]].header;
            name.w = 825;

            var button = instance_create(800, yt, button_large_b_mail);
            button.indx = ordered_mails[i];
            button.background = self;
            button.text.txt = global.txt319;

            yt += 60;
        }
    }
    else
    {
        var button = instance_create(1200 / 2 - 281 / 2, 828, button_large_b_mail);
        button.text.txt = global.txt319;
        button.indx = opened_mail;
        button.background = self;

        but1.visible = false;
        but1.text.visible = false;

        var name = instance_create(70, 70, text_obj_red_28_left);
        name.txt = global.txt322 + global.mail[opened_mail].header;
        name.w = 1000;

        var from = instance_create(70, 140, text_obj_red_28_left);
        from.txt = global.txt320 + global.mail[opened_mail].from;
        from.w = 1000;

        var to = instance_create(70, 210, text_obj_red_28_left);
        to.txt = global.txt321 + global.mail[opened_mail].to;
        to.w = 1000;

        var text = instance_create(70, 280, text_obj_red_28_left);
        text.txt = global.mail[opened_mail].text;
        text.w = 1000;
    }

    yt = 70;
    ax = 0;
}

/// Начало наземного боя

// ============================================================
// НАЧАЛО НАЗЕМНОГО БОЯ
// ============================================================

if (type == 11)
{
    if (global.ground_battle_type == 1) image_index = 28;
    else if (global.ground_battle_type == 2) image_index = 29;
    else if (global.ground_battle_type == 3) image_index = 28;
    else if (global.ground_battle_type == 4) image_index = 27;
    else if (global.ground_battle_type == 5) image_index = 5;

    but1 = instance_create(1200 / 2 - 281 / 2, 828, button_large_b_exit);
}

if (type == 11 && !instance_exists(ask_parent))
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);

    instance_create(0, 0, background_line);

    var headline = instance_create(1200 / 2, 5, text_obj_white_28_c);
    headline.w = 1300;

    var desc = instance_create(70, 70, text_obj_white_28);
    desc.w = 1000;

    if (global.ground_battle_type == 1)
    {
        headline.txt = global.txt345;
        desc.txt = global.txt346;
    }
    else if (global.ground_battle_type == 2)
    {
        headline.txt = global.txt347;
        desc.txt = global.txt348;
    }
    else if (global.ground_battle_type == 3)
    {
        headline.txt = global.txt349;
        desc.txt = global.txt350;
    }
    else if (global.ground_battle_type == 4)
    {
        headline.txt = global.txt351;
        desc.txt = global.txt352;
    }
    else if (global.ground_battle_type == 5)
    {
        headline.txt = global.txt353;
        desc.txt = global.txt354;
    }
}

/// Итоги наземного боя

// ============================================================
// ИТОГИ НАЗЕМНОГО БОЯ
// ============================================================

if (type == 12)
{
    image_index = 25;
    but1 = instance_create(1200 / 2 - 281 / 2, 828, button_large_b_exit);
}

if (type == 12 && !instance_exists(ask_parent))
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);

    instance_create(0, 0, background_line);

    var headline = instance_create(1200 / 2, 5, text_obj_white_28_c);
    headline.w = 1300;

    var total_killed = instance_create(70, 70, text_obj_white_28);
    total_killed.w = 1000;

    var total_loss = instance_create(70, 140, text_obj_white_28);
    total_loss.w = 1000;

    var total_xp_gain = instance_create(70, 210, text_obj_white_28);
    total_xp_gain.w = 1000;

    var total_trophies = instance_create(70, 280, text_obj_white_28);
    total_trophies.w = 1000; // [FIX] было total_xp_gain.w

    var total_score = instance_create(70, 350, text_obj_white_28);
    total_score.w = 1000;

    var total_score_count = 0;

    var desc = instance_create(70, 500, text_obj_white_28);
    desc.w = 1000;

    total_killed.txt = global.txt355 + string(global.killed_total); // [FIX]
    total_loss.txt = global.txt356 + string(global.loss_total); // [FIX]
    total_xp_gain.txt = global.txt357 + string(global.xp_gain_total); // [FIX]
    total_score.txt = global.txt358 + string(global.xmas_score_for_success); // [FIX]
    total_trophies.txt = global.txt359 + string(global.trophies_total); // [FIX]

    if (global.win == 1)
    {
        if (global.ground_battle_type == 1)
        {
            headline.txt = global.txt361 + global.txt345;
            desc.txt = global.txt363;
        }
        else if (global.ground_battle_type == 2)
        {
            headline.txt = global.txt361 + global.txt347;
            desc.txt = global.txt363;
        }
        else if (global.ground_battle_type == 3)
        {
            headline.txt = global.txt361 + global.txt349;
            desc.txt = global.txt364;
        }
        else if (global.ground_battle_type == 4)
        {
            headline.txt = global.txt361 + global.txt366;
            desc.txt = global.txt363;
        }
        else if (global.ground_battle_type == 5)
        {
            headline.txt = global.txt361 + global.txt353;
            desc.txt = global.txt369;
        }
    }
    else
    {
        if (global.ground_battle_type == 1)
        {
            headline.txt = global.txt360 + global.txt345;
            desc.txt = global.txt362;
        }
        else if (global.ground_battle_type == 2)
        {
            headline.txt = global.txt360 + global.txt347;
            desc.txt = global.txt362;
        }
        else if (global.ground_battle_type == 3)
        {
            headline.txt = global.txt360 + global.txt349;
            desc.txt = global.txt365;
        }
        else if (global.ground_battle_type == 4)
        {
            headline.txt = global.txt360 + global.txt367;
            desc.txt = global.txt362;
        }
        else if (global.ground_battle_type == 5)
        {
            headline.txt = global.txt360 + global.txt353;
            desc.txt = global.txt368;
        }
    }
}

/// Окно бомбардировки базы

// ============================================================
// ОКНО БОМБАРДИРОВКИ БАЗЫ
// ============================================================

if (type == 13)
{
    image_index = 5;
    but1 = instance_create(1200 / 2 - 281 / 2, 828, button_large_b_exit);
}

if (type == 13 && !instance_exists(ask_parent))
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);

    worktext = instance_create(1200 / 2, 5, text_obj_white_28_c);
    worktext.txt = global.txt370;
    worktext.w = 2000;

    var yt = 75;
    var x_event_1 = 70;
    var x_event_2 = 470;
    var x_event_3 = 850;

    time_between_events--;
    if (time_between_events < 1)
    {
        events_opened++;
        time_between_events = time_between_events_max;
    }

    var current_event = events_opened;

    show_debug_message($"Открыто событий: {events_opened}");
    show_debug_message($"Длина истории ЗРК: {array_length(sam_history)}");
    show_debug_message($"Длина истории бомбардировщиков: {array_length(bomb_history)}");

    for (var i = 0; i < array_length(sam_history); i++)
    {
        if (current_event == 0) break;

        var text_1 = instance_create(x_event_1, yt, text_obj_white_28);
        text_1.txt = global.txt371 + string(sam_history[i].index) + global.txt372;
        text_1.w = 200;
        show_debug_message($"Текст 1 открыт проход {i}");

        current_event--;
        if (current_event == 0)
        {
            if (!sound_isplaying(SAM_launch))
            {
                sound_play(SAM_launch);
                sound_volume(SAM_launch, global.soundvolume);
            }
            break;
        }

        var text_2 = instance_create(x_event_2, yt, text_obj_white_28);
        text_2.txt = global.txt376 + $"{sam_history[i].dmg}";
        text_2.w = 400;
        show_debug_message($"Текст 2 открыт проход {i}");

        current_event--;
        if (current_event == 0)
        {
            if (!sound_isplaying(explode_in_air))
            {
                sound_play(explode_in_air); // [FIX] было sound_play(SAM_launch)
                sound_volume(explode_in_air, global.soundvolume); // [FIX]
            }
            break;
        }

        var text_3 = instance_create(x_event_3, yt, text_obj_white_28);
        if (!sam_history[i].kill) text_3.txt = global.txt373 + string(sam_history[i].bombers_remain);
        else text_3.txt = global.txt374 + string(sam_history[i].bombers_remain);

        text_3.w = 250;
        show_debug_message($"Текст 3 открыт проход {i}");

        yt += 140;

        if (sam_history[i].bombers_remain < 1)
        {
            var text_4 = instance_create(x_event_1, yt, text_obj_white_28);
            text_4.txt = global.txt377;
            text_4.w = 1000;
            show_debug_message($"Текст 4 открыт проход {i}");
            yt += 70;
            break;
        }
        else if (i == array_length(sam_history) - 1)
        {
            var text_4 = instance_create(x_event_1, yt, text_obj_white_28);
            text_4.txt = global.txt375;
            text_4.w = 1000;
            yt += 70;
            break;
        }
    }

    if (current_event > 0)
    {
        for (var i = 0; i < array_length(bomb_history); i++)
        {
            if (current_event == 0) break;

            var text_1 = instance_create(x_event_1, yt, text_obj_white_28);
            text_1.txt = global.txt378 + string(bomb_history[i].index + 1) + global.txt379;
            text_1.w = 400;
            show_debug_message($"Текст 1 открыт проход {i}");

            current_event--;
            if (current_event == 0)
            {
                if (bomb_history[i].hit_module != 0)
                {
                    if (!sound_isplaying(explode_on_base))
                    {
                        sound_play(explode_on_base);
                        sound_volume(explode_on_base, global.soundvolume);
                    }
                }
                break;
            }

            var text_2 = instance_create(x_event_2, yt, text_obj_white_28);
            if (bomb_history[i].hit_module != 0) text_2.txt = global.txt380 + $"{bomb_history[i].hit_module}. {global.txt381}";
            else text_2.txt = global.txt384;
            text_2.w = 400;
            show_debug_message($"Текст 2 открыт проход {i}");

            current_event--;
            if (current_event == 0)
            {
                if (bomb_history[i].hit_n1 != 0)
                {
                    if (!sound_isplaying(explode_on_base))
                    {
                        sound_play(explode_on_base);
                        sound_volume(explode_on_base, global.soundvolume);
                    }
                }
                break;
            }

            if (bomb_history[i].hit_n2 != 0 || bomb_history[i].hit_n3 != 0 || bomb_history[i].hit_n4 != 0)
            {
                var text_3 = instance_create(x_event_3, yt, text_obj_white_28);
                text_3.txt = global.txt382 + " ";

                if (bomb_history[i].hit_plane1 > 0 || bomb_history[i].hit_plane2 > 0)
                {
                    text_3.txt += global.txt383 + " ";
                }

                if (bomb_history[i].hit_plane1 < 0 || bomb_history[i].hit_plane2 < 0)
                {
                    text_3.txt += global.txt385;
                }

                text_3.w = 400;
                show_debug_message($"Текст 3 открыт проход {i}");
            }

            yt += 70;

            if (i == array_length(bomb_history) - 1)
            {
                var text_4 = instance_create(x_event_1, yt, text_obj_white_28);
                text_4.txt = global.txt386;
                text_4.w = 1000;
                show_debug_message($"Текст 4 открыт проход {i}");
                yt += 70;
                break;
            }
        }
    }
}

/// Окно осады

// ============================================================
// ОКНО ОСАДЫ
// ============================================================

if (type == 14)
{
    image_index = 5;
    but1 = instance_create(1200 / 2 - 281 / 2, 828, button_large_b_exit);
}

if (type == 14 && !instance_exists(ask_parent))
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);

    worktext = instance_create(1200 / 2, 5, text_obj_white_28_c);
    worktext.txt = global.txt392;
    worktext.w = 2000;

    var yt = 70;
	
    var x_event_1 = 70;
    var x_event_2 = 470;
    var x_event_3 = 870;

    time_between_events--;
    if (time_between_events < 1)
    {
        events_opened++;
        time_between_events = time_between_events_max;
    }
	
	if (array_length(sam_history) < 1)
    {
        instance_destroy(self);
		exit;
    }

    var current_event = events_opened;

    for (var i = 0; i < array_length(sam_history); i++)
    {
        if (current_event == 0) break;

        var text_1 = instance_create(x_event_1, yt, text_obj_white_28);
        text_1.txt = global.txt371 + string(sam_history[i].index) + global.txt372;
		text_1.w = 200;

        current_event--;
        if (current_event == 0 && !audio_is_playing(SAM_launch))
        {
            sound_play(SAM_launch);
            sound_volume(SAM_launch, global.soundvolume);
            break;
        }

        var text_2 = instance_create(x_event_2, yt, text_obj_white_28);
        text_2.txt = global.txt376 + $"{sam_history[i].dmg}.";

        current_event--;
        if (current_event == 0 && !audio_is_playing(explode_in_air))
        {
            sound_play(explode_in_air); // [FIX] было sound_play(SAM_launch)
            sound_volume(explode_in_air, global.soundvolume); // [FIX]
            break;
        }

        var text_3 = instance_create(x_event_3, yt, text_obj_white_28); // [FIX] было instance_create(yt, x_event_3, ...)
        if (!sam_history[i].kill) text_3.txt = global.txt390 + string(sam_history[i].bombers_remain);
        else text_3.txt = global.txt391 + string(sam_history[i].bombers_remain);
		text_3.w = 300;

        yt += 70;

        if (sam_history[i].bombers_remain < 1)
        {
			yt += 70;
            var text_4 = instance_create(x_event_1, yt, text_obj_white_28);
            text_4.txt = global.txt389;
            break;
        }
        else if (i == array_length(sam_history) - 1)
        {
			yt += 70;
            var text_4 = instance_create(x_event_1, yt, text_obj_white_28);
            text_4.txt = global.txt393;
            break;
        }
    }
}

/// Уфопедия

// ============================================================
// УФОПЕДИЯ
// ============================================================

if (type == 101)
{
    image_index = 2;
    but1 = instance_create(886, 828, button_large_b_exit);
    but2 = instance_create(886, 828, button_large_b_exit);
}

if (type == 101)
{
    instance_destroy(wikiimage_small);
    instance_destroy(wikiimage_medium);
    instance_destroy(background_line);
    instance_destroy(background_line2);
    instance_destroy(background_line3);
    instance_destroy(background_line4);
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_red_28_left);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_wiki);
    instance_destroy(button_arrow_2W);

    var i;

    nametext = instance_create(52, 103, text_obj_red_28_left);
    nametext.txt = global.wiki[wikipage, 0];
    nametext.w = 500;

    widetext = instance_create(52, 283, text_obj_red_wiki);
    widetext.txt = global.wiki[wikipage, 1];
    widetext.w = 1080;

    if (global.wiki[wikipage, 3] == 1) // крупная
    {
        instance_create(0, 0, background_line);
        image_index = global.wiki[wikipage, 4];
		widetext.max_width = 800;
		widetext.y -= 40;
    }

    if (global.wiki[wikipage, 3] == 2) // средняя
    {
        instance_create(0, 0, background_line3);
        image_index = 22;
        imag = instance_create(730, 60, wikiimage_medium);
        imag.image_index = global.wiki[wikipage, 4];
        widetext.w = 660;
		widetext.max_width = 380;
    }

    if (global.wiki[wikipage, 3] == 3) // малая
    {
        instance_create(0, 0, background_line4);
        image_index = 22;
        imag = instance_create(608, 63, wikiimage_small);
        imag.image_index = global.wiki[wikipage, 4];
		widetext.max_width = 700;
    }

    butx1 = instance_create(25, 25, button_arrow_2W);
    butx2 = instance_create(335, 25, button_arrow_2W);
    butx2.image_xscale = -1;

    worktext = instance_create(50, 5, text_obj_red_28_left);
    worktext.txt = global.txt197;
    worktext.w = 700;
}




/// Окно поражения или победы

// ============================================================
// ПОРАЖЕНИЕ ИЛИ ПОБЕДА
// ============================================================

if (type == 15 || type == 16)
{
    image_index = 1;
    but1 = instance_create(1200 / 2 - 281 / 2, 828, button_large_b_exit);
}

if ((type == 15 || type == 16) && !instance_exists(ask_parent))
{
    instance_destroy(text_obj_red_28);
    instance_destroy(text_obj_white_28_c);
    instance_destroy(text_obj_white_28);
    instance_destroy(text_obj_red_28_left);

    instance_create(0, 0, background_line);

    var lost_cities_count = 0;
    var funds = global.money;

    var headline = instance_create(1200 / 2, 5, text_obj_white_28_c);
    headline.txt = global.txt412;
    headline.w = 1000;

    var score_us = instance_create(70, 70, text_obj_white_28);
    score_us.txt = global.txt310 + string(global.xmas_score);
    score_us.w = 1000;

    var score_enemy = instance_create(70, 140, text_obj_white_28);
    score_enemy.txt = global.txt309 + string(global.enemy_score);
    score_enemy.w = 1000;

    var lost_cities = instance_create(70, 210, text_obj_white_28);
    lost_cities.txt = global.txt314 + string(lost_cities_count) + global.txt315;
    lost_cities.w = 1000;

    var desc = instance_create(70, 300, text_obj_white_28);
    desc.txt = global.txt413;
    desc.w = 1000;
	
	if (type == 16)
	{
		headline.txt = global.txt414;
		desc.txt = global.txt415;
	}
}

/// Окно отключения электроэнергии

// ============================================================
// ТЕЙЛЗ ВЫКЛЮЧИЛ СВЕТ
// ============================================================

if (type == 17)
{
	image_index = 35;
	if (instance_exists(background_line))
    {
        instance_destroy(background_line);
    }
	if (cost == 0)
	{
		cost = 1;
		sound_stop_all();
		sound_play(energy_off);
		sound_volume(energy_off, global.voicevolume);
		timer = 300;
	}
	else
	if (cost == 1)
	{
		timer--;
		if (timer < 1)
		{
			sound_play(computer_enable_sound);
			sound_volume(computer_enable_sound, global.voicevolume);
			cost = 2;	
		}
	}
	else
	if (cost == 2)
	{
		if (!sound_isplaying(computer_enable_sound)) instance_destroy(self);
	}
	
}