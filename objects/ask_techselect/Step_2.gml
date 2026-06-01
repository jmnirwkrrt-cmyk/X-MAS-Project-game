if (image_xscale = 1 and image_yscale = 1 and mcurrent > 0)
{
	text.txt = global.technologies[mcurrent, 0];
}
if (image_xscale = 1 and image_yscale = 1 and mcurrent < 0)
{
	text.txt = "";
}

/// End Step (Technology Select)

if (image_xscale == 1 && image_yscale == 1)
{
    // --- 1) Прокрутка: найти следующий доступный пункт ---
    var _dir = 0;
    if (mouse_wheel_up())       _dir =  1;
    else if (mouse_wheel_down()) _dir = -1;

    if (_dir != 0)
    {
        var _tries = (mmax - mmin + 1);
        var _i = mcurrent;

        repeat (_tries) // repeat: фиксированное кол-во шагов, без риска вечного while :contentReference[oaicite:2]{index=2}
        {
            _i += _dir;

            // зацикливание
            if (_i > mmax) _i = mmin;
            else if (_i < mmin) _i = mmax;

            // selectable: доступна && не изучена && не в работе
            if (_i > 0 && global.technologies[_i, 2]
            && !global.technologies[_i, 1]
            &&  global.technologies[_i, 4] <= 0 )
            {
                mcurrent = _i;
                break;
            }
        }
    }

    // --- 2) Текст: показываем только если текущая валидная ---
    var _ok =
        (mcurrent > 0)
        && global.technologies[mcurrent, 2]
        && !global.technologies[mcurrent, 1]
        && (global.technologies[mcurrent, 4] <= 0);

    if (instance_exists(text))
        text.txt = _ok ? global.technologies[mcurrent, 0] : "";

    // --- 3) RMB: закрыть ---
    if (mouse_check_button_released(mb_right))
    {
        instance_destroy();
        exit;
    }

    // --- 4) LMB: запустить исследование ---
    if (mouse_check_button_released(mb_left) && _ok)
    {
        global.technologies[mcurrent, 4] = 1;
        global.scientist--;
        global.laboratoryplace--;
        instance_destroy();
        exit;
    }
}
else
{
    // если UI не активен — можно чистить текст
    if (instance_exists(text)) text.txt = "";
}
