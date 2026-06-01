// ------------------------------------------------------------
// Назначение оружия снеговику
// indx      = индекс бойца
// mcurrent  = выбранная строка оружия
// weapon[,] = массив ссылок на строки склада/меню
// ------------------------------------------------------------

var unit_index = indx;
var i;
var d;

// Звук / анимация кнопки
sound_play(button_sound);
sound_volume(button_sound, global.soundvolume);
image_index = 0;


// ------------------------------------------------------------
// 1) Снять текущее оружие и вернуть его на склад
// ------------------------------------------------------------
if (global.team[unit_index, 3] != "")
{
    // --- AK ---
    if (global.team[unit_index, 3] == "ak")
    {
        // вернуть сам автомат (item 1)
        d = 0;
        for (i = 1; i <= global.atstockpile[0, 0]; i++)
        {
            if (global.atstockpile[i, 0] == 1)
            {
                d = i;
                break;
            }
        }

        if (d > 0)
        {
            global.atstockpile[d, 1]++;
        }
        else
        {
            global.atstockpile[0, 0]++;
            global.atstockpile[global.atstockpile[0, 0], 0] = 1;
            global.atstockpile[global.atstockpile[0, 0], 1] = 1;
            global.atstockpile[global.atstockpile[0, 0], 2] = 0;
        }

        // вернуть магазин/боезапас AK (item 4)
        d = 0;
        for (i = 1; i <= global.atstockpile[0, 0]; i++)
        {
            if (global.atstockpile[i, 0] == 4)
            {
                d = i;
                break;
            }
        }

        if (d > 0)
        {
            global.atstockpile[d, 1]++;
        }
        else
        {
            global.atstockpile[0, 0]++;
            global.atstockpile[global.atstockpile[0, 0], 0] = 4;
            global.atstockpile[global.atstockpile[0, 0], 1] = 1;
            global.atstockpile[global.atstockpile[0, 0], 2] = 0;
        }
    }

    // --- Rifle ---
    if (global.team[unit_index, 3] == "rifle")
    {
        // вернуть саму винтовку (item 3)
        d = 0;
        for (i = 1; i <= global.atstockpile[0, 0]; i++)
        {
            if (global.atstockpile[i, 0] == 3)
            {
                d = i;
                break;
            }
        }

        if (d > 0)
        {
            global.atstockpile[d, 1]++;
        }
        else
        {
            global.atstockpile[0, 0]++;
            global.atstockpile[global.atstockpile[0, 0], 0] = 3;
            global.atstockpile[global.atstockpile[0, 0], 1] = 1;
            global.atstockpile[global.atstockpile[0, 0], 2] = 0;
        }

        // вернуть боезапас винтовки (item 5)
        d = 0;
        for (i = 1; i <= global.atstockpile[0, 0]; i++)
        {
            if (global.atstockpile[i, 0] == 5)
            {
                d = i;
                break;
            }
        }

        if (d > 0)
        {
            global.atstockpile[d, 1]++;
        }
        else
        {
            global.atstockpile[0, 0]++;
            global.atstockpile[global.atstockpile[0, 0], 0] = 5;
            global.atstockpile[global.atstockpile[0, 0], 1] = 1;
            global.atstockpile[global.atstockpile[0, 0], 2] = 0;
        }
    }

    // --- Laser ---
    if (global.team[unit_index, 3] == "laser")
    {
        d = 0;
        for (i = 1; i <= global.atstockpile[0, 0]; i++)
        {
            if (global.atstockpile[i, 0] == 16)
            {
                d = i;
                break;
            }
        }

        if (d > 0)
        {
            global.atstockpile[d, 1]++;
        }
        else
        {
            global.atstockpile[0, 0]++;
            global.atstockpile[global.atstockpile[0, 0], 0] = 16;
            global.atstockpile[global.atstockpile[0, 0], 1] = 1;
            global.atstockpile[global.atstockpile[0, 0], 2] = 0;
        }
    }

    // очистить слот оружия у бойца
    global.team[unit_index, 3] = "";
}


// ------------------------------------------------------------
// 2) Выдать новое оружие
// ------------------------------------------------------------
if (mcurrent != 0)
{
    var weapon_row = weapon[mcurrent, 0];

    // защита от кривого индекса строки склада
    if (weapon_row > 0 && weapon_row <= global.atstockpile[0, 0])
    {
        var weapon_item = global.atstockpile[weapon_row, 0];

        // --- AK (item 1), требует боезапас item 4 ---
        if (weapon_item == 1)
        {
            d = 0;
            for (i = 1; i <= global.atstockpile[0, 0]; i++)
            {
                if (global.atstockpile[i, 1] < 1) continue;
                if (global.atstockpile[i, 0] == 4)
                {
                    d = i;
                    break;
                }
            }

            if (d > 0 && global.atstockpile[weapon_row, 1] > 0)
            {
                global.atstockpile[d, 1]--;
                global.atstockpile[weapon_row, 1]--;
                global.team[unit_index, 3] = "ak";
            }
            else
            {
                var mes = instance_create(1200 / 2, 900 / 2, ask_message);
                mes.event = 14;
            }
        }

        // --- Rifle (item 3), требует боезапас item 5 ---
        if (weapon_item == 3)
        {
            d = 0;
            for (i = 1; i <= global.atstockpile[0, 0]; i++)
            {
                if (global.atstockpile[i, 1] < 1) continue;
                if (global.atstockpile[i, 0] == 5)
                {
                    d = i;
                    break;
                }
            }

            if (d > 0 && global.atstockpile[weapon_row, 1] > 0)
            {
                global.atstockpile[d, 1]--;
                global.atstockpile[weapon_row, 1]--;
                global.team[unit_index, 3] = "rifle";
            }
            else
            {
                var mes = instance_create(1200 / 2, 900 / 2, ask_message);
                mes.event = 14;
            }
        }

        // --- Laser (item 16), без отдельного БК ---
        if (weapon_item == 16)
        {
            if (global.atstockpile[weapon_row, 1] > 0)
            {
                global.atstockpile[weapon_row, 1]--;
                global.team[unit_index, 3] = "laser";
            }
        }
    }
}

instance_destroy(self);