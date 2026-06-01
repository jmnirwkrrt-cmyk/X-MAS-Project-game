if (global.win != 0 && type == 2)
{
	but[0].txt = global.txt17;
	but[1].txt = global.txt16;
}

if (index > 0) text1_txt = global.team[index, 1];

var gw = display_get_gui_width();
var gh = display_get_gui_height();

x = gw * 0.5 - 270;// - 310;
y = gh * 0.5 - 270;// - 350;

but[0].x = x + 24;  but[0].y = y + 70;
but[1].x = x + 24;  but[1].y = y + 130;
but[2].x = x + 24;  but[2].y = y + 190;
but[3].x = x + 680; but[3].y = y + 173;
but[4].x = x + 384; but[4].y = y + 54;
but[5].x = x + 800; but[5].y = y + 54;

mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);
var clk_pressed = mouse_check_button_pressed(mb_left);
var clk_released = mouse_check_button_released(mb_left);

function ui_hit_sprite(_spr, _x, _y, _xs, _ys)
{
    var w = sprite_get_width(_spr);
    var h = sprite_get_height(_spr);
    var ox = sprite_get_xoffset(_spr);
    var oy = sprite_get_yoffset(_spr);

    var l = _x - ox * _xs;
    var t = _y - oy * _ys;
    var r = l + w * _xs;
    var b = t + h * _ys;

    var l2 = min(l, r);
    var r2 = max(l, r);
    var t2 = min(t, b);
    var b2 = max(t, b);

    return (mx >= l2 && mx <= r2 && my >= t2 && my <= b2);
}

if (index > 0) text1_txt = global.team[index, 1]; else text1_txt = "";

if (clk_released) // Мышь отжала кнопку
{
	
	but[0].image_index = 0;
	but[1].image_index = 0;
	but[2].image_index = 0;
	but[3].image_index = 0;
	but[4].image_index = 0;
	but[5].image_index = 0;
	
    if (ui_hit_sprite(but[0].spr, but[0].x, but[0].y, but[0].xs, but[0].ys)) { // continue
		sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
		but[0].image_index = 0;
		if (type == 1)
		{
			oArena3D.drop_pause = true;
			instance_destroy(self);
		}
		else
		{
			if (oArena3D.grenades_on_stockpile > 0) global.atstockpile[oArena3D.grenades_on_stockpile, 1] = oArena3D.grenades_original;
			if (oArena3D.medkits_on_stockpile > 0) global.atstockpile[oArena3D.medkits_on_stockpile, 1] = oArena3D.medkits_original;
			if (global.XMAS_squad_onfight > 0)
			{
				global.planes[global.XMAS_squad_onfight, 16] = oArena3D.grenades_original;
				global.planes[global.XMAS_squad_onfight, 17] = oArena3D.medkits_original;
			}
			
			instance_destroy(pause_men_3D);
			for (var i = 0; i < array_length(oArena3D.saved_forces); i++)
			{
				var saved_soldier = oArena3D.saved_forces[i];
				if (saved_soldier.side == 1)
				{
					global.team[saved_soldier.index, 4] = saved_soldier.hp;
					global.team[saved_soldier.index, 5] = saved_soldier.max_hp;
					global.team[saved_soldier.index, 6] = saved_soldier.xp;
				}
				else
				if (saved_soldier.side == 2)
				{
					global.santateam[saved_soldier.index, 1] = saved_soldier.count;
				}
				else
				if (saved_soldier.side == 3)
				{
					global.eggteam[saved_soldier.index, 1] = saved_soldier.count;
				}
			}
			room_restart();
		}
    }
    else if (ui_hit_sprite(but[1].spr, but[1].x, but[1].y, but[1].xs, but[1].ys)) { // evac
		sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
		but[1].image_index = 0;
		if (type == 2 || (global.ground_battle_type == 3 && oArena3D.emerald_taken_by = landed_transport))
		{
			if (room == ground_map)
			{
				if (oArena3D.beetle_corpses > 0)
				{
					var beetles_index = 0;
					var i = 0;
					for (i = 1; i <= global.atstockpile[0, 0]; i++)
					{
						if (global.atstockpile[i, 0] == 18) { beetle_index = i; break; }
					}
					if (beetles_index > 0) global.atstockpile[i, 1] += oArena3D.beetle_corpses;
					else 
					{ 
						global.atstockpile[0, 0]++; 
						global.atstockpile[global.atstockpile[0, 0], 0] = 18; 
						global.atstockpile[global.atstockpile[0, 0], 1] = oArena3D.beetle_corpses;
						global.atstockpile[global.atstockpile[0, 0], 2] = 0;
					}
				}
				if (oArena3D.metal_corpses > 0)
				{
					var metal_index = 0;
					var i = 0;
					for (i = 1; i <= global.atstockpile[0, 0]; i++)
					{
						if (global.atstockpile[i, 0] == 19) { metal_index = i; break; }
					}
					if (metal_index > 0) global.atstockpile[i, 1] += oArena3D.metal_corpses;
					else 
					{ 
						global.atstockpile[0, 0]++; 
						global.atstockpile[global.atstockpile[0, 0], 0] = 19; 
						global.atstockpile[global.atstockpile[0, 0], 1] = oArena3D.metal_corpses;
						global.atstockpile[global.atstockpile[0, 0], 2] = 0;
					}
				}
				if (oArena3D.pawn_corpses > 0)
				{
					var pawn_index = 0;
					var i = 0;
					for (i = 1; i <= global.atstockpile[0, 0]; i++)
					{
						if (global.atstockpile[i, 0] == 20) { pawn_index = i; break; }
					}
					if (pawn_index > 0) global.atstockpile[i, 1] += oArena3D.pawn_corpses;
					else 
					{ 
						global.atstockpile[0, 0]++; 
						global.atstockpile[global.atstockpile[0, 0], 0] = 20; 
						global.atstockpile[global.atstockpile[0, 0], 1] = oArena3D.pawn_corpses;
						global.atstockpile[global.atstockpile[0, 0], 2] = 0;
					}
				}
				if (oArena3D.ufo_corpses > 0)
				{
					var ufo_index = 0;
					var i = 0;
					for (i = 1; i <= global.atstockpile[0, 0]; i++)
					{
						if (global.atstockpile[i, 0] == 21) { ufo_index = i; break; }
					}
					if (ufo_index > 0) global.atstockpile[i, 1] += oArena3D.ufo_corpses;
					else 
					{ 
						global.atstockpile[0, 0]++; 
						global.atstockpile[global.atstockpile[0, 0], 0] = 21; 
						global.atstockpile[global.atstockpile[0, 0], 1] = oArena3D.ufo_corpses;
						global.atstockpile[global.atstockpile[0, 0], 2] = 0;
					}
				}
				if (oArena3D.turret_corpses > 0)
				{
					var turret_index = 0;
					var i = 0;
					for (i = 1; i <= global.atstockpile[0, 0]; i++)
					{
						if (global.atstockpile[i, 0] == 23) { turret_index = i; break; }
					}
					if (turret_index > 0) global.atstockpile[i, 1] += oArena3D.turret_corpses;
					else 
					{ 
						global.atstockpile[0, 0]++; 
						global.atstockpile[global.atstockpile[0, 0], 0] = 23; 
						global.atstockpile[global.atstockpile[0, 0], 1] = oArena3D.turret_corpses;
						global.atstockpile[global.atstockpile[0, 0], 2] = 0;
					}
				}
				

				if (oArena3D.battle_type == 4) { global.technologies[24, 2] = true; /*new_tech_available_popup();*/ }
				if (oArena3D.battle_type == 5)
				{
					new_mail(17);
				}
				room_goto(map_room);
				if (oArena3D.battle_type == 4) global.santa_will_support_next_assault = false;
			}
			if (room == Ground_Test_Arena_3D) room_goto(menu_room);	
		}
		else
		{
			if (room != Ground_Test_Arena_3D) 
			{
				instance_destroy(oPlayer3D);
				instance_destroy(ally_obj_3D);
				instance_destroy(Terror_Squad_3D);
				global.win = -2;
				room_goto(map_room);
				if (oArena3D.battle_type == 4) global.santa_will_support_next_assault = false;
			}
			else
			{
				room_goto(menu_room);	
			}
		}
		
    }
    else if (ui_hit_sprite(but[2].spr, but[2].x, but[2].y, but[2].xs, but[2].ys)) { // exit
		sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
		but[2].image_index = 0;
		if (type == 1)
		{
			room_goto(menu_room);
		}
		else
		{
			
		}
    }
    else if (ui_hit_sprite(but[3].spr, but[3].x, but[3].y, but[3].xs, but[3].ys)) { // arrow_red
		sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
		but[3].image_index = 0;
		if (index > 0 && type == 1)
		{
			image_index = 0;
			var follower = instance_create(x, y, obj_sight_or_pointer);
			follower.type = 2;
			follower.index = index;
			instance_create(x, y, tabletop_3D);
			instance_destroy(menu_small_3D);
		}
    }
    else if (ui_hit_sprite(but[4].spr, but[4].x, but[4].y, but[4].xs, but[4].ys)) { // arrow_left
		sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
		but[4].image_index = 0;
		
		var anyinf = false;
		var selected = false;
		var imin = 0;
		var imax = 0;
		var icount = 0;
		if (index = 0 and global.team[0, 0] > 0) { index = 1; }
		var ic = 0;
		var i;
		for (i = 1; i <= global.team[0, 0]; i++)
		{
			if (global.team[i, 4] > 0 && is_our_squad(i))
			{ 
				icount++;  
			}
		}
		for (i = 1; i <= global.team[0, 0]; i++)
		{
			
			if (global.team[i, 4] > 0 && is_our_squad(i))
			{ 
				anyinf = true;
				ic++;
				if (imin = 0) { imin = i; }  
				if (ic = icount) { imax = i; }
			}
		
		}
		
		
		if (anyinf)
		{
			for (i = index - 1; !selected; i--)
			{
				if (i < imin) { i = imax; }
				if (global.team[i, 4] > 0 && is_our_squad(i))
				{ 
					index = i; 
					selected = true; 
				}
			
			}
		}
		else
		{
			index = 0;
		}
		
    }
    else if (ui_hit_sprite(but[5].spr, but[5].x, but[5].y, but[5].xs, but[5].ys)) { // arrow_right
		sound_play(button_sound); sound_volume(button_sound, global.soundvolume);
		but[5].image_index = 0;
		
		
		var anyinf = false;
		var selected = false;
		var imin = 0;
		var imax = 0;
		var icount = 0;
		if (index = 0 and global.team[0, 0] > 0) { index = 1; }
		var ic = 0;
		var i;
		for (i = 1; i <= global.team[0, 0]; i++)
		{
			if (global.team[i, 4] > 0 && is_our_squad(i))
			{ 
				icount++;  
			}
		}
		for (i = 1; i <= global.team[0, 0]; i++)
		{
			
			if (global.team[i, 4] > 0 && is_our_squad(i))
			{ 
				anyinf = true;
				ic++;
				if (imin = 0) { imin = i; }  
				if (ic = icount) { imax = i; }
			}
		
		}
		
		
		if (anyinf)
		{
			for (i = index + 1; !selected; i++)
			{
				if (i > imax) { i = imin; }
				if (i < imin) i = imin;
				if (global.team[i, 4] > 0 && is_our_squad(i))
				{ 
					index = i; 
					selected = true; 
				}
			
			}
		}
		else
		{
			index = 0;
		}
    }
}
else
	if (clk_pressed) // Мышь нажала кнопку
	{
		if (ui_hit_sprite(but[0].spr, but[0].x, but[0].y, but[0].xs, but[0].ys)) {
			but[0].image_index = 1;
	    }
	    else if (ui_hit_sprite(but[1].spr, but[1].x, but[1].y, but[1].xs, but[1].ys)) {
			but[1].image_index = 1;
	    }
	    else if (ui_hit_sprite(but[2].spr, but[2].x, but[2].y, but[2].xs, but[2].ys)) {
			but[2].image_index = 1;
	    }
	    else if (ui_hit_sprite(but[3].spr, but[3].x, but[3].y, but[3].xs, but[3].ys)) {
			but[3].image_index = 1;
	    }
	    else if (ui_hit_sprite(but[4].spr, but[4].x, but[4].y, but[4].xs, but[4].ys)) {
			but[4].image_index = 1;
	    }
	    else if (ui_hit_sprite(but[5].spr, but[5].x, but[5].y, but[5].xs, but[5].ys)) {
			but[5].image_index = 1;
	    }
		
	}

