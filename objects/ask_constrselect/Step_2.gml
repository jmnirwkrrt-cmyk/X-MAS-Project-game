if (image_xscale = 1 and image_yscale = 1)
{
	text1.txt = global.txt105;
	if (mcurrent > 0) text.txt = global.items[global.constructitem[mcurrent, 0], 0];
	else text.txt = "";
}



/// End Step

if (image_xscale == 1 && image_yscale == 1)
{
    // ---------- Прокрутка выбора (пропускаем недоступные) ----------
    var _dir = 0;
    if (mouse_wheel_down()) _dir = -1;
    else if (mouse_wheel_up()) _dir =  1;

    if (_dir != 0)
    {
        var _tries = (mmax - mmin + 1);
        repeat (_tries)
        {
            mcurrent += _dir;

            if (mcurrent > mmax) mcurrent = mmin;
            else if (mcurrent < mmin) mcurrent = mmax;

            // selectable: доступен && не занят && не отмечен
            if (mcurrent > 0 && global.constructitem[mcurrent, 9]
            &&  global.constructitem[mcurrent, 1] <= 0
            &&  global.constructitem[mcurrent, 8] <= 0)
            {
                break;
            }
        }
    }
	
	if (mcurrent > 0)
	{
		
		// ---------- Обновление верхних текстов ----------
		if (instance_exists(text1)) text1.txt = global.txt105;
		
		if (instance_exists(text))
		    text.txt = global.items[ global.constructitem[mcurrent, 0], 0 ];
		
		// ---------- Закрыть ----------
		if (mouse_check_button_released(mb_right))
		{
		    instance_destroy();
		    exit;
		}
		
		// ---------- ЛКМ: действие ----------
		if (mouse_check_button_released(mb_left))
		{
		    // твоя исходная проверка "можно кликать"
		    if (global.constructitem[mcurrent, 9] && global.constructitem[mcurrent, 8] < 1)
		    {
		        // денег нет
		        if (global.money < global.constructitem[mcurrent, 4])
		        {
		            mes = instance_create(1200 / 2, 900 / 2, ask_message);
		            mes.event = 11;
		            instance_destroy();
		            exit;
		        }
		
		        // ограничения по складу/населению/самолётам (ПОПРАВЛЕНО: == вместо =)
		        var _req = global.items[ global.constructitem[mcurrent, 0], 2 ];
		        if ((_req > 0 && global.stock < _req)
		        ||  (_req == -1 && (global.maxciv - global.currentciv) < 1)
		        ||  (_req == -2 && global.maxplanes < 1))
		        {
		            mes = instance_create(1200 / 2, 900 / 2, ask_message);
		            mes.event = 12;
		            instance_destroy();
		            exit;
		        }
				
		        // ресурсов не хватает (ПОПРАВЛЕНО: явные || и без "or/and" каши)
		        if (global.constructitem[mcurrent, 5] > background_map.splav
		        ||  global.constructitem[mcurrent, 6] > background_map.energo
		        ||  global.constructitem[mcurrent, 7] > background_map.energyscrap
				||  global.constructitem[mcurrent, 10] > background_map.motobugs
				||  global.constructitem[mcurrent, 11] > background_map.metalsons
				||  global.constructitem[mcurrent, 12] > background_map.egg_pawns
				||  global.constructitem[mcurrent, 13] > background_map.cyberdiscs
				||  global.constructitem[mcurrent, 14] > background_map.turrets)
		        {
		            mes = instance_create(1200 / 2, 900 / 2, ask_message);
		            mes.event = 10;
		            instance_destroy();
		            exit;
		        }
		
		        // всё ок — запускаем
		        global.constructitem[mcurrent, 8] = 1;
		        global.constructitem[mcurrent, 2] = global.constructitem[mcurrent, 3];
		        global.constructitem[mcurrent, 1] = 1;
		        global.engineers--;
		        global.workshopplace--;
		        instance_destroy();
		        exit;
		    }
		}
		
		// ---------- Характеристики (ПОПРАВЛЕНО: безопасно + без string_insert(…,0)) ----------
		var _cap = global.items[ global.constructitem[mcurrent, 0], 2 ];
		if (instance_exists(text3))
		    text3.txt = (_cap > 0) ? (global.txt108 + string(_cap)) : "";
		
		var _cost = global.constructitem[mcurrent, 4];
		if (instance_exists(text4))
		    text4.txt = (_cost > 0) ? (global.txt109 + string(_cost)) : "";
		
		var _r5 = global.constructitem[mcurrent, 5];
		if (instance_exists(text5))
		    text5.txt = (_r5 > 0) ? (global.txt110 + string(_r5)) : "";
		
		var _r6 = global.constructitem[mcurrent, 6];
		if (instance_exists(text6))
		    text6.txt = (_r6 > 0) ? (global.txt111 + string(_r6)) : "";
		
		var _r7 = global.constructitem[mcurrent, 7];
		if (instance_exists(text7))
		    text7.txt = (_r7 > 0) ? (global.txt112 + string(_r7)) : "";
			
		if (global.constructitem[mcurrent, 10] > 0)
		{
			var _r8 = global.constructitem[mcurrent, 10];
			if (instance_exists(text7))
			    text7.txt = (_r8 > 0) ? (global.txt420 + string(_r8)) : "";
		}
		else
		if (global.constructitem[mcurrent, 11] > 0)
		{
			var _r8 = global.constructitem[mcurrent, 11];
			if (instance_exists(text7))
			    text7.txt = (_r8 > 0) ? (global.txt421 + string(_r8)) : "";
		}
		else
		if (global.constructitem[mcurrent, 12] > 0)
		{
			var _r8 = global.constructitem[mcurrent, 12];
			if (instance_exists(text7))
			    text7.txt = (_r8 > 0) ? (global.txt422 + string(_r8)) : "";
		}
		else
		if (global.constructitem[mcurrent, 13] > 0)
		{
			var _r8 = global.constructitem[mcurrent, 13];
			if (instance_exists(text7))
			    text7.txt = (_r8 > 0) ? (global.txt423 + string(_r8)) : "";
		}
		else
		if (global.constructitem[mcurrent, 14] > 0)
		{
			var _r8 = global.constructitem[mcurrent, 14];
			if (instance_exists(text7))
			    text7.txt = (_r8 > 0) ? (global.txt419 + string(_r8)) : "";
		}
		
	}
	else
	{
		text.txt = "";
		text1.txt = global.txt105;
		text2.txt = "";
		text3.txt = "";
		text4.txt = "";
		text5.txt = "";
		text6.txt = "";
		text7.txt = "";
	}
}
