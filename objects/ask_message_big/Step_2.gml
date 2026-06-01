if (event == 1) { image_index = 0; }
if (event == 2) { image_index = 0; }
if (event == 3) { image_index = 0; }
if (event == 4) { image_index = 0; }
if (event == 5) { image_index = 0; }
if (event == 6) { image_index = 1; }
if (event == 7) { image_index = 2; }
if (event == 8) { image_index = 1; }
if (event == 9) { image_index = 2; }
if (event > 9) { image_index = 3; }
if (event == 14) { image_index = 2; }
if (event == 15) { image_index = 2; }


if (image_xscale = 1 and image_yscale = 1 and !ready)
{
	if (event < 10)
	{
		but1 = instance_create(x - 140, y + 90, button_large_q_ok);
		but2 = instance_create(x - 140, y + 90, button_large_intercept);
		but2.indx = plane_indx;
		if (instance_exists(target)) 
		{
			but2.target_x = target_x;
			but2.target_y = target_y;
			but2.target = target;
		}
		but2.type = 2;
		but2.mess = self;
	}
	else
	{
		if (!instance_exists(but1) || !instance_exists(but2))
		{
			but1 = instance_create(x - 280, y + 90, button_large_q_ok);
			but2 = instance_create(x, y + 90, button_large_intercept);
		}
		if (but1.ok) instance_destroy(self);
		but2.indx = ufo_number;
		if (instance_exists(target)) 
		{
			but2.target_x = target_x;
			but2.target_y = target_y;
			but2.target = target;
		}
		but2.type = 2;
		but2.mess = self;	
	}
	text1 = instance_create(x, y - 150, text_obj_red);
	text2 = instance_create(x, y - 100, text_obj_red);
	text3 = instance_create(x, y - 75, text_obj_red);
	text4 = instance_create(x, y - 50, text_obj_red);
	text5 = instance_create(x, y - 25, text_obj_red);
	text6 = instance_create(x, y, text_obj_red);
	if (event == 1)
	{
		but1.x -= 140;
		but2.x += 140;	
	}
	text1.w = 800;
	text2.w = 800;
	text3.w = 800;
	text4.w = 800;
	text5.w = 800;
	text6.w = 800;
	ready = true;
}
if (ready)
{
	if (event == 1 && ufo_number > 0) 
	{ 
		var obj;
		for (var i = 0; i < instance_number(onmap_enemy); i++)
		{
			obj = instance_find(onmap_enemy, i);
			if (obj.indx == ufo_number) break;
		}
		if (!instance_exists(obj)) { instance_destroy(self); exit; }
		but2.indx = ufo_number;
		if (!instance_exists(target)) { instance_destroy(self); exit; }
		but2.target_x = obj.x;
		but2.target_y = obj.y;
		but2.target = obj;
		text1.txt = global.txt237 + global.txt181 + string(ufo_number); 
		text2.txt = global.txt236 + string(obj.height); 
		text3.txt = global.txt238 + string(obj.speed_deviation); //+ string(global.escortfoe[ufo_number, 1]); 
		var ufo_count = global.escortfoe[ufo_number, 0];
		for (var i = 4; i - 4 < global.escortfoe[ufo_number, 0]; i++)
		{
			if (global.eggplanes[global.escortfoe[ufo_number, i], 1] < 1) ufo_count--;
		}
		text4.txt = global.txt240 + string(ufo_count); 
		if (!global.can_decrypt_transmission) text5.txt = global.txt241; 
		if (global.can_decrypt_transmission || global.debug) 
		{
			text5.txt = global.txt241; 
			if (obj.type == 1) text5.txt = global.txt242; 
			if (obj.type == 2) text5.txt = global.txt243; 
			if (obj.type == 3) text5.txt = global.txt244; 
			if (obj.type == 4) text5.txt = global.txt245; 
			if (obj.type == 5) text5.txt = global.txt246; 
			if (obj.type == 6) text5.txt = global.txt247; 
			if (obj.type == 7) text5.txt = global.txt247; 
			if (obj.type == 8) text5.txt = global.txt248; 
		}
		if (true)
		{
			text6.txt = global.txt262
			var max_size = 1;
			for (var i = 4; i - 4 < global.escortfoe[ufo_number, 0]; i++)
			{
				if (max_size < 2 && (global.eggplanes[global.escortfoe[ufo_number, i], 0] == 3)) max_size = 2;
				if (max_size < 3 && (global.eggplanes[global.escortfoe[ufo_number, i], 0] == 4)) max_size = 3;
				if (max_size < 4 && (global.eggplanes[global.escortfoe[ufo_number, i], 0] == 6)) max_size = 4;
				if (max_size < 4 && (global.eggplanes[global.escortfoe[ufo_number, i], 0] == 7)) max_size = 5;
			}
			if (max_size == 1) text6.txt += global.txt267;
			if (max_size == 2) text6.txt += global.txt266;
			if (max_size == 3) text6.txt += global.txt265;
			if (max_size == 4) text6.txt += global.txt264;
			if (max_size == 5) text6.txt += global.txt263;
		}
		image_index = 0; 
	}
	if (event == 8 && ufo_number > 0) 
	{ 
		instance_destroy(but2);
		but1.x = x - 180;
		var obj;
		for (var i = 0; i < instance_number(onmap_ally); i++)
		{
			obj = instance_find(onmap_ally, i);
			if (obj.indx == ufo_number) break;
		}
		if (!instance_exists(obj)) { instance_destroy(self); exit; }
		text1.txt = global.txt237 + global.txt258 + string(ufo_number); 
		text2.txt = global.txt236 + string(obj.height); 
		text3.txt = global.txt238 + string(global.escortally[ufo_number, 1]); 
		text4.txt = global.txt240 + string(global.escortally[ufo_number, 0]); 
		if (true) 
		{
			text5.txt = global.txt241; 
			if (obj.type == 1) text5.txt = global.txt242; 
			if (obj.type == 2) text5.txt = global.txt243; 
			if (obj.type == 3) text5.txt = global.txt440; 
			if (obj.type == 4) text5.txt = global.txt245; 
			if (obj.type == 5) text5.txt = global.txt246; 
			if (obj.type == 6) text5.txt = global.txt247; 
			if (obj.type == 7) text5.txt = global.txt248; 
			if (obj.type == 8) text5.txt = global.txt249; 
		}
		if (true)
		{
			text6.txt = global.txt262
			var max_size = 1;
			for (var i = 4; i < global.escortally[ufo_number, 0]; i++)
			{
				if (max_size < 1 && (global.santaplanes[global.escortally[ufo_number, i], 0] == 1)) max_size = 1;
				if (max_size < 1 && (global.santaplanes[global.escortally[ufo_number, i], 0] == 2)) max_size = 1;
				if (max_size < 3 && (global.santaplanes[global.escortally[ufo_number, i], 0] == 7)) max_size = 3;
			}
			if (max_size == 1) text6.txt += global.txt267;
			if (max_size == 2) text6.txt += global.txt266;
			if (max_size == 3) text6.txt += global.txt265;
			if (max_size == 4) text6.txt += global.txt264;
			if (max_size == 5) text6.txt += global.txt263;
		}
		image_index = 1; 
	}
	if (event == 9)
	{
		image_index = 2
		
	}
	if (instance_exists(target) && event > 9)
	{
		if (event == 10) // террор
		{
			image_index = 3;
			text1.txt = global.txt181 + string(ufo_number) + global.txt296 + target.name;
			if (instance_exists(target.target)) text1.txt = global.txt181 + string(ufo_number) + global.txt296 + target.target.name;
			text3.txt = global.txt429 + string(target.time / 60 / 60);
		
		}
		if (event == 11) // штурм-террор объекта
		{
			image_index = 3;
			text1.txt = global.txt181 + string(ufo_number) + global.txt297 + target.name;
			if (instance_exists(target.target)) text1.txt = global.txt181 + string(ufo_number) + global.txt297 + target.target.name;
			text3.txt = global.txt429 + string(target.time / 60 / 60);
		}
		if (event == 12) // воздушный бой (бомбардировка)
		{
			image_index = 3;
			text1.txt = global.txt181 + string(ufo_number) + global.txt298 + target.name;
			if (instance_exists(target.target)) text1.txt = global.txt181 + string(ufo_number) + global.txt298 + target.target.name;
			text3.txt = global.txt429 + string(target.time / 60 / 60);
		}
		if (event == 13) // воздушный бой (перехват транспорта)
		{
			image_index = 3;
			text1.txt = global.txt299 + string(ufo_number) + global.txt449 + target.name;
			if (instance_exists(target.target)) text1.txt = global.txt299 + string(ufo_number) + global.txt449 + target.target.name;
			text3.txt = global.txt429 + string(target.time / 60 / 60);
		
		}
		if (event == 14) // сбитый корабль
		{
			image_index = 2;
			text1.txt = target.name;
			text3.txt = global.txt429 + string(target.time / 60 / 60);
		}
		if (event == 15) // изумруд
		{
			image_index = 2;
			text1.txt = target.name;
			text3.txt = global.txt429 + string(target.time / 60 / 60);
		}
		if (event == 16) // база противника
		{
			image_index = 2;
			text1.txt = target.name;
			if (target.santa_will_support) text3.txt = global.txt431;
			else text3.txt = global.txt432;
		}
	}
	else if (event > 9) { instance_destroy(self); exit; }
	
	if (event = 2) { text.txt = global.txt21; image_index = 0; }
	if (event = 3) { text.txt = global.txt22; image_index = 0; }
	if (event = 4) { text.txt = global.txt23; image_index = 0; }
	if (event = 5) { text.txt = global.txt45; image_index = 0; }
	if (event = 6) { text.txt = global.txt83; image_index = 1; }
	if (event = 7) { text.txt = global.txt86; image_index = 2; }
	
}

if (image_xscale = 1 and image_yscale = 1 and but1.ok) { instance_destroy(self); }

