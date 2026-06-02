// Снятие / установка вооружения самолёта
// Предполагается:
// mcurrent = 0  -> снять оружие
// mcurrent > 0  -> поставить weapon[mcurrent, 0] (индекс оружия в global.airweapon)

if (mcurrent == 0)
{
    text.txt = global.txt123;
}

// Перевод "номера слота" в индекс колонки самолёта
var slot_col = 0;
switch (indx)
{
    case 1: slot_col = 6; break;
    case 2: slot_col = 8; break;
    case 3: slot_col = 10; break;
    default:
        instance_destroy(self);
        exit;
}

var plane_indx = ask_plane.indx;
var old_weapon = global.planes[plane_indx, slot_col];
var old_ammo   = global.planes[plane_indx, slot_col + 1];
var new_weapon = 0;

if (mcurrent > 0)
{
    new_weapon = weapon[mcurrent, 0];
}

// Если выбрали то же самое оружие — ничего не делаем
if (mcurrent > 0 && new_weapon == old_weapon)
{
    instance_destroy(self);
    exit;
}

/// Вспомогательная функция: добавить предмет на склад
function __add_item_to_stock(_item_index, _amount)
{
    if (_item_index <= 0 || _amount <= 0) return;

    var row = 0;
    for (var j = 1; j <= global.atstockpile[0, 0]; j++)
    {
        if (global.atstockpile[j, 0] == _item_index)
        {
            row = j;
            break;
        }
    }

    if (row > 0)
    {
        global.atstockpile[row, 1] += _amount;
    }
    else
    {
        global.atstockpile[0, 0]++;
        row = global.atstockpile[0, 0];
        global.atstockpile[row, 0] = _item_index;
        global.atstockpile[row, 1] = _amount;
        global.atstockpile[row, 2] = 0;
    }
}

/// Вспомогательная функция: найти строку предмета на складе
function __find_stock_row(_item_index)
{
    for (var j = 1; j <= global.atstockpile[0, 0]; j++)
    {
        if (global.atstockpile[j, 0] == _item_index)
        {
            return j;
        }
    }
    return 0;
}

// =====================================================
// 1) Возвращаем старое оружие на склад (если оно складское)
// =====================================================
if (old_weapon > 0)
{
    var old_weapon_item = global.airweapon[old_weapon, 0];

    // По твоей логике складскими являются только эти пушки
    if (
        old_weapon_item == global.airweapon[1, 0]
        || old_weapon_item == global.airweapon[13, 0]
    )
    {
        __add_item_to_stock(old_weapon_item, 1);
    }
}

// =====================================================
// 2) Возвращаем старый БК на склад
// =====================================================
if (old_weapon > 0 && old_ammo > 0)
{
    var old_ammo_item = global.airweapon[old_weapon, 3];

    if (old_ammo_item > 0)
    {
        var ammo_to_return = old_ammo;

        // Старый спец-кейс: "плазморакеты" / legacy-предмет,
        // где на склад возвращается 1 единица предмета, а не весь счётчик БК
        if (global.airweapon[old_weapon, 0] == 10 || global.airweapon[old_weapon, 0] == 35)
        {
            ammo_to_return = 1;
        }

        __add_item_to_stock(old_ammo_item, ammo_to_return);
    }
}

// =====================================================
// 3) Ставим новое оружие / снимаем старое
// =====================================================
if (mcurrent == 0)
{
    // Просто снять оружие
    global.planes[plane_indx, slot_col] = 0;
    global.planes[plane_indx, slot_col + 1] = 0;

    if (global.planes[plane_indx, 12] == 4)
    {
        global.planes[plane_indx, 12] = 0;
        global.planes[plane_indx, 13] = 0;
    }
}
else
{
    // Установить новое оружие
    global.planes[plane_indx, slot_col] = new_weapon;
    global.planes[plane_indx, slot_col + 1] = 0;

    // Если новое оружие требует складской единицы самого оружия — списываем
    var new_weapon_item = global.airweapon[new_weapon, 0];
    if (
        new_weapon_item == global.airweapon[1, 0]
        || new_weapon_item == global.airweapon[13, 0]
    )
    {
        var new_weapon_row = __find_stock_row(new_weapon_item);
        if (new_weapon_row > 0 && global.atstockpile[new_weapon_row, 1] > 0)
        {
            global.atstockpile[new_weapon_row, 1]--;
        }
    }

    // Запускаем / продлеваем обслуживание смены вооружения
    if (global.planes[plane_indx, 12] == 4)
    {
        if (global.planes[plane_indx, 13] < global.airweapon[new_weapon, 4])
        {
            global.planes[plane_indx, 13] = global.airweapon[new_weapon, 4];
        }
    }
    else
    {
        global.planes[plane_indx, 12] = 4;
        global.planes[plane_indx, 13] = global.airweapon[new_weapon, 4];
    }
}

instance_destroy(self);