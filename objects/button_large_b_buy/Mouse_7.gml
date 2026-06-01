button_sound_effect();
image_index = 0;

// ------------------------------------------------------------
// ПОДТВЕРЖДЕНИЕ ДЛЯ ОКНА ПОКУПКИ / ЗАКАЗА (type == 1)
// ПРАВКА: убрана проверка денег в этой кнопке.
// Если нужна проверка денег, лучше делать её в коде подтверждения ask_question_b,
// а не здесь, чтобы кнопка не ломала продажу / возврат / пересчёт очереди.
// ------------------------------------------------------------
if (!instance_exists(ask_parent))
{
	if (background_map.type == 1 && background_map.cost > 0)
	{
		var stock = 0;
		var civstock = 0;
		var planestock = 0;

		for (var i = 1; i <= global.buyable[0, 0]; i++)
		{
			var item_index = global.buyable[i, 0];
			var amount = global.buyable[i, 1];
			var item_size = global.items[item_index, 2];

			if (item_size > 0)
			{
				stock += item_size * amount;
			}
			else if (item_size == -1)
			{
				civstock += amount;
			}
			else if (item_size == -2)
			{
				planestock += amount;
			}
		}

		if (stock < global.stock + 1
		&&  civstock < global.maxciv - global.currentciv + 1
		&&  planestock < global.maxplanes + 1
		&& background_map.cost <= global.money
		)
		{
			instance_create(1200 / 2, 900 / 2, ask_question_b);
		}
		else
		if (background_map.cost > global.money)
		{
			var mess = instance_create(1200 / 2, 900 / 2, ask_message);
			mess.event = 11;
		}
		else
		{
			var mess = instance_create(1200 / 2, 900 / 2, ask_message);
			mess.event = 8;
		}
	}
}

// ------------------------------------------------------------
// ПОДТВЕРЖДЕНИЕ ДЛЯ ОКНА СКЛАДА / ПРОДАЖИ / ПЕРЕМЕЩЕНИЯ (type == 3)
// ------------------------------------------------------------
if (!instance_exists(ask_question_b) && !instance_exists(ask_message))
{
	if (background_map.type == 3
	&& (background_map.cost > 0 || background_map.amounts > 0 || background_map.amounte > 0))
	{
		var stock = 0;
		var civstock = 0;
		var planestock = 0;

		for (var i = 1; i <= global.atstockpile[0, 0]; i++)
		{
			var item_index = global.atstockpile[i, 0];
			var amount = global.atstockpile[i, 2];
			var item_size = global.items[item_index, 2];

			if (item_size > 0)
			{
				stock += item_size * amount;
			}
			else if (item_size == -1)
			{
				civstock += amount;
			}
			else if (item_size == -2)
			{
				planestock += amount;
			}
		}

		instance_create(1200 / 2, 900 / 2, ask_question_b);
	}
}